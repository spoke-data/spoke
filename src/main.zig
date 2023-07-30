// const std = @import("std");
//
// pub fn main() !void {
//     // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
//     std.debug.print("All your {s} are belong to us.\n", .{"codebase"});
//
//     // stdout is for the actual output of your application, for example if you
//     // are implementing gzip, then only the compressed bytes should be sent to
//     // stdout, not any debugging messages.
//     const stdout_file = std.io.getStdOut().writer();
//     var bw = std.io.bufferedWriter(stdout_file);
//     const stdout = bw.writer();
//
//     try stdout.print("Run `zig build test` to run the tests.\n", .{});
//
//     try bw.flush(); // don't forget to flush!
// }
//
// test "simple test" {
//     var list = std.ArrayList(i32).init(std.testing.allocator);
//     defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
//     try list.append(42);
//     try std.testing.expectEqual(@as(i32, 42), list.pop());
// }

// const std = @import("std");
// const zap = @import("zap");
//
// fn on_request_verbose(r: zap.SimpleRequest) void {
//     if (r.path) |the_path| {
//         std.debug.print("PATH: {s}\n", .{the_path});
//     }
//
//     if (r.query) |the_query| {
//         std.debug.print("QUERY: {s}\n", .{the_query});
//     }
//     r.sendBody("<html><body><h1>Hello from ZAP!!!</h1></body></html>") catch return;
// }
//
// fn on_request_minimal(r: zap.SimpleRequest) void {
//     r.sendBody("<html><body><h1>Hello from ZAP!!!</h1></body></html>") catch return;
// }
//
// pub fn main() !void {
//     var listener = zap.SimpleHttpListener.init(.{
//         .port = 3001,
//         .on_request = on_request_verbose,
//         .log = true,
//         .max_clients = 100000,
//     });
//     try listener.listen();
//
//     std.debug.print("Listening on 0.0.0.0:3001\n", .{});
//
//     // start worker threads
//     zap.start(.{
//         .threads = 2,
//         .workers = 2,
//     });
// }

const std = @import("std");
const zap = @import("zap");
const Endpoint = @import("api/endpoint.zig");
const StopEndpoint = @import("api/stopendpoint.zig");
const ApiV1SidebarEndpoint = @import("api/v1/sidebarendpoint.zig");
const ApiV1ProjectsEndpoint = @import("api/v1/projectsendpoint.zig");
const ApiV1CatalogsEndpoint = @import("api/v1/catalogsendpoint.zig");
// const ApiV1StorageEndpoint = @import("api/v1/storageendpoint.zig");
// const ApiV1ConnectorsEndpoint = @import("api/v1/connectorsendpoint.zig");
// const ApiV1ComponentsEndpoint = @import("api/v1/componentsendpoint.zig");
// const ApiV1TeamsEndpoint = @import("api/v1/teamsendpoint.zig");
// const ApiV1OrganizationsEndpoint = @import("api/v1/organizationsendpoint.zig");

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
        // var apiV1Storage = ApiV1CatalogsEndpoint.init(allocator, "/api/v1/storage");
        // try listener.addEndpoint(apiV1Storage.getEndpoint());
        // var apiV1Connectors = ApiV1CatalogsEndpoint.init(allocator, "/api/v1/connectors");
        // try listener.addEndpoint(apiV1Connectors.getEndpoint());
        // var apiV1Components = ApiV1ComponentsEndpoint.init(allocator, "/api/v1/components");
        // try listener.addEndpoint(apiV1Components.getEndpoint());
        // var apiV1Teams = ApiV1TeamsEndpoint.init(allocator, "/api/v1/teams");
        // try listener.addEndpoint(apiV1Teams.getEndpoint());
        // var apiV1Organizations = ApiV1OrganizationsEndpoint.init(allocator, "/api/v1/organizations");
        // try listener.addEndpoint(apiV1Organizations.getEndpoint());

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
