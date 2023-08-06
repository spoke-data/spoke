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
            .get = getConnectors,
        }),
    };
}

pub fn getEndpoint(self: *Self) *zap.SimpleEndpoint {
    return &self.endpoint;
}

fn getConnectors(e: *zap.SimpleEndpoint, r: zap.SimpleRequest) void {
    if (r.path) |path| {
        // /api/v1/connectors
        if (path.len == e.settings.path.len) {
            r.setHeader("Access-Control-Allow-Origin", "*") catch unreachable;
            r.sendJson(
                \\{
                \\  "connectors": [
                \\      {
                \\          "name": "MLB HTTP Source",
                \\          "slug": "mlb-http-source"
                \\      },
                \\      {
                \\          "name": "NFL HTTP Source",
                \\          "slug": "nfl-http-source"
                \\      },
                \\      {
                \\          "name": "NBA HTTP Source",
                \\          "slug": "nba-http-source"
                \\      },
                \\      {
                \\          "name": "IMDB HTTP Source",
                \\          "slug": "imdb-http-source"
                \\      },
                \\      {
                \\          "name": "OpenSea HTTP Source",
                \\          "slug": "opensea-http-source"
                \\      },
                \\      {
                \\          "name": "OpenSea WebSocket Source",
                \\          "slug": "opensea-websocket-source"
                \\      },
                \\      {
                \\          "name": "IBM Db2 Read Only Source",
                \\          "slug": "ibm-db2-read-only-source"
                \\      },
                \\      {
                \\          "name": "Postgres Sink",
                \\          "slug": "postgres-sink"
                \\      },
                \\      {
                \\          "name": "MariaDB Sink",
                \\          "slug": "mariadb-sink"
                \\      }
                \\  ]
                \\}
            ) catch return;
        }
    }
}
