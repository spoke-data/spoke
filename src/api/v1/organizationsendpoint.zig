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
            .get = getOrganizations,
        }),
    };
}

pub fn getEndpoint(self: *Self) *zap.SimpleEndpoint {
    return &self.endpoint;
}

fn getOrganizations(e: *zap.SimpleEndpoint, r: zap.SimpleRequest) void {
    if (r.path) |path| {
        // /api/v1/organizations
        if (path.len == e.settings.path.len) {
            r.setHeader("Access-Control-Allow-Origin", "*") catch unreachable;
            r.sendJson(
                \\{
                \\  "organizations": [
                \\      {
                \\          "name": "Personal",
                \\          "slug": "personal"
                \\      },
                \\      {
                \\          "name": "Spoke",
                \\          "slug": "spoke"
                \\      }
                \\  ]
                \\}
            ) catch return;
        }
    }
}
