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
            .get = getCoreModels,
        }),
    };
}

pub fn getEndpoint(self: *Self) *zap.SimpleEndpoint {
    return &self.endpoint;
}

fn getCoreModels(e: *zap.SimpleEndpoint, r: zap.SimpleRequest) void {
    if (r.path) |path| {
        // /api/v1/core-models
        if (path.len == e.settings.path.len) {
            r.setHeader("Access-Control-Allow-Origin", "*") catch unreachable;
            r.sendJson(
                \\{
                \\  "coreModels": [
                \\      {
                \\          "name": "Denis",
                \\          "slug": "denis"
                \\      },
                \\      {
                \\          "name": "Replicant",
                \\          "slug": "replicant"
                \\      },
                \\      {
                \\          "name": "Tudor",
                \\          "slug": "tudor"
                \\      },
                \\      {
                \\          "name": "Assistant",
                \\          "slug": "assistant"
                \\      },
                \\      {
                \\          "name": "Picasso",
                \\          "slug": "picasso"
                \\      },
                \\      {
                \\          "name": "Mozart",
                \\          "slug": "mozart"
                \\      },
                \\      {
                \\          "name": "Schumacher",
                \\          "slug": "schumacher"
                \\      },
                \\      {
                \\          "name": "Madden",
                \\          "slug": "madden"
                \\      }
                \\  ]
                \\}
            ) catch return;
        }
    }
}
