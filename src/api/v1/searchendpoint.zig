const std = @import("std");
const zap = @import("zap");

pub const Self = @This();

alloc: std.mem.Allocator = undefined,
endpoint: zap.SimpleEndpoint = undefined,

pub fn init(
    a: std.mem.Allocator,
    path: []const u8,
) Self {
    return .{
        .alloc = a,
        .endpoint = zap.SimpleEndpoint.init(.{
            .path = path,
            .get = getResults,
        }),
    };
}

pub fn getEndpoint(self: *Self) *zap.SimpleEndpoint {
    return &self.endpoint;
}

fn getResults(e: *zap.SimpleEndpoint, r: zap.SimpleRequest) void {
    if (r.path) |path| {
        // /api/v1/search
        if (path.len == e.settings.path.len) {
            r.setHeader("Access-Control-Allow-Origin", "*") catch unreachable;
            r.sendJson(
                \\{
                \\  "results": {
                \\    "components": [],
                \\    "connectors": [],
                \\    "coreModels": [],
                \\    "catalogs": [],
                \\    "objectStores": [],
                \\    "organizations": [],
                \\    "projects": [
                \\        {
                \\            "name": "Fantasy Sportsball",
                \\            "slug": "fantasy-sportsball"
                \\        }
                \\    ],
                \\    "teams": []
                \\  }
                \\}
            ) catch return;
        }
    }
}
