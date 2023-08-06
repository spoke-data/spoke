const std = @import("std");
const zap = @import("zap");
const Endpoint = @import("api/endpoint.zig");
const StopEndpoint = @import("api/stopendpoint.zig");
const ApiV1SidebarEndpoint = @import("api/v1/sidebarendpoint.zig");
const ApiV1ProjectsEndpoint = @import("api/v1/projectsendpoint.zig");
const ApiV1CatalogsEndpoint = @import("api/v1/catalogsendpoint.zig");
const ApiV1ObjectStoresEndpoint = @import("api/v1/objectstoresendpoint.zig");
const ApiV1ConnectorsEndpoint = @import("api/v1/connectorsendpoint.zig");
const ApiV1ComponentsEndpoint = @import("api/v1/componentsendpoint.zig");
const ApiV1CoreModelsEndpoint = @import("api/v1/coremodelsendpoint.zig");
const ApiV1TeamsEndpoint = @import("api/v1/teamsendpoint.zig");
const ApiV1OrganizationsEndpoint = @import("api/v1/organizationsendpoint.zig");
const ApiV1SearchEndpoint = @import("api/v1/searchendpoint.zig");

// this is just to demo that we can catch arbitrary slugs
fn on_request(r: zap.SimpleRequest) void {
    if (r.path) |the_path| {
        std.debug.print("REQUESTED PATH: {s}\n", .{the_path});
    }

    r.sendBody("<html><body><h1>Hello from ZAP!!!</h1></body></html>") catch return;
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{
        .thread_safe = true,
    }){};
    var allocator = gpa.allocator();

    // we scope everything that can allocate within this block for leak detection
    {
        // setup listener
        var listener = zap.SimpleEndpointListener.init(
            allocator,
            .{
                .port = 3001,
                .on_request = on_request,
                .log = true,
                .public_folder = "html",
                .max_clients = 100000,
                .max_body_size = 100 * 1024 * 1024,
            },
        );
        defer listener.deinit();

        var endpoint = Endpoint.init(allocator, "/users");
        defer endpoint.deinit();

        var stopEp = StopEndpoint.init("/stop");


        // add endpoint
        try listener.addEndpoint(endpoint.getUserEndpoint());
        try listener.addEndpoint(stopEp.getEndpoint());

        // fake some users
        var uid: usize = undefined;
        uid = try endpoint.getUsers().addByName("renerocksai", null);
        uid = try endpoint.getUsers().addByName("renerocksai", "your mom");

        // API v1 endpoints
        var apiV1Sidebar = ApiV1SidebarEndpoint.init(allocator, "/api/v1/sidebar");
        try listener.addEndpoint(apiV1Sidebar.getEndpoint());
        var apiV1Projects = ApiV1ProjectsEndpoint.init(allocator, "/api/v1/projects");
        try listener.addEndpoint(apiV1Projects.getEndpoint());
        var apiV1Catalogs = ApiV1CatalogsEndpoint.init(allocator, "/api/v1/catalogs");
        try listener.addEndpoint(apiV1Catalogs.getEndpoint());
        var apiV1ObjectStores = ApiV1ObjectStoresEndpoint.init(allocator, "/api/v1/object-stores");
        try listener.addEndpoint(apiV1ObjectStores.getEndpoint());
        var apiV1Connectors = ApiV1ConnectorsEndpoint.init(allocator, "/api/v1/connectors");
        try listener.addEndpoint(apiV1Connectors.getEndpoint());
        var apiV1Components = ApiV1ComponentsEndpoint.init(allocator, "/api/v1/components");
        try listener.addEndpoint(apiV1Components.getEndpoint());
        var apiV1CoreModels = ApiV1CoreModelsEndpoint.init(allocator, "/api/v1/core-models");
        try listener.addEndpoint(apiV1CoreModels.getEndpoint());
        var apiV1Teams = ApiV1TeamsEndpoint.init(allocator, "/api/v1/teams");
        try listener.addEndpoint(apiV1Teams.getEndpoint());
        var apiV1Organizations = ApiV1OrganizationsEndpoint.init(allocator, "/api/v1/organizations");
        try listener.addEndpoint(apiV1Organizations.getEndpoint());
        var apiV1Search = ApiV1SearchEndpoint.init(allocator, "/api/v1/search");
        try listener.addEndpoint(apiV1Search.getEndpoint());

        // listen
        try listener.listen();

        std.debug.print("Listening on 0.0.0.0:3001\n", .{});

        // and run
        zap.start(.{
            .threads = 2000,
            .workers = 4,
        });
    }

    // show potential memory leaks when ZAP is shut down
    const has_leaked = gpa.detectLeaks();
    std.log.debug("Has leaked: {}\n", .{has_leaked});
}
