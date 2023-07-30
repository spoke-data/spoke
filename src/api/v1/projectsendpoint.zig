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
            .get = getProjects,
        }),
    };
}

pub fn getEndpoint(self: *Self) *zap.SimpleEndpoint {
    return &self.endpoint;
}

fn getProjects(e: *zap.SimpleEndpoint, r: zap.SimpleRequest) void {
    if (r.path) |path| {
        // /api/v1/projects
        if (path.len == e.settings.path.len) {
            r.setHeader("Access-Control-Allow-Origin", "*") catch unreachable;
            r.sendJson(
                \\{
                \\  "environments": [
                \\      {
                \\          "name": "Production",
                \\          "slug": "production",
                \\          "projects": [
                \\              { "name": "Fantasy Sportsball", "slug": "fantasy-sportsball" },
                \\              { "name": "Database ETL", "slug": "database-etl" }
                \\          ]
                \\      },
                \\  	{
                \\          "name": "Development",
                \\          "slug": "development",
                \\          "projects": [
                \\              { "name": "Fantasy Sportsball", "slug": "fantasy-sportsball" },
                \\              { "name": "Database ETL", "slug": "database-etl" },
                \\              { "name": "Memphis/Debezium CDC Replication", "slug": "memphis-debezium-cdc-replication" },
                \\              { "name": "Learned Replication", "slug": "learned-replication" }
                \\  	    ]
                \\  	},
                \\  	{
                \\  	    "name": "Local",
                \\  	    "slug": "local",
                \\  	    "projects": [
                \\              { "name": "Fantasy Sportsball", "slug": "fantasy-sportsball" },
                \\              { "name": "AI Movie Recommendations", "slug": "ai-movie-recommendations" },
                \\              { "name": "Stock Forecasting", "slug": "stock-forecasting" },
                \\              { "name": "NFT Pricing", "slug": "nft-pricing" },
                \\              { "name": "Database ETL", "slug": "database-etl" },
                \\              { "name": "Kafka/Debezium CDC Replication", "slug": "kafka-debezium-cdc-replication" },
                \\              { "name": "Memphis/Debezium CDC Replication", "slug": "memphis-debezium-cdc-replication" },
                \\              { "name": "Learned Replication", "slug": "learned-replication" }
                \\  	    ]
                \\  	},
                \\  	{
                \\  	    "name": "Research",
                \\  	    "slug": "research",
                \\  	    "projects": [
                \\              { "name": "Fantasy Sportsball", "slug": "fantasy-sportsball" },
                \\              { "name": "Learned Replication", "slug": "learned-replication" }
                \\  	    ]
                \\  	}
                \\  ]
                \\}
            ) catch return;
        }
    }
}
