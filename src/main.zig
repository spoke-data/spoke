const std = @import("std");
const zap = @import("zap");
const ApiV1SidebarEndpoint = @import("api/v1/sidebarendpoint.zig");
const ApiV1ProjectsEndpoint = @import("api/v1/projectsendpoint.zig");

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

        // API v1 endpoints
        var apiV1Sidebar = ApiV1SidebarEndpoint.init(allocator, "/api/v1/sidebar");
        try listener.addEndpoint(apiV1Sidebar.getEndpoint());
        var apiV1Projects = ApiV1ProjectsEndpoint.init(allocator, "/api/v1/projects");
        try listener.addEndpoint(apiV1Projects.getEndpoint());

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
