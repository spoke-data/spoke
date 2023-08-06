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
            .get = getCatalogs,
        }),
    };
}

pub fn getEndpoint(self: *Self) *zap.SimpleEndpoint {
    return &self.endpoint;
}

fn getCatalogs(e: *zap.SimpleEndpoint, r: zap.SimpleRequest) void {
    if (r.path) |path| {
        // /api/v1/catalogs
        if (path.len == e.settings.path.len) {
            r.setHeader("Access-Control-Allow-Origin", "*") catch unreachable;
            r.sendJson(
                \\{
                \\  "catalogs": [
                \\      {
                \\          "name": "Postgres",
                \\          "slug": "postgres"
                \\      },
                \\      {
                \\          "name": "MariaDB",
                \\          "slug": "mariadb"
                \\      },
                \\      {
                \\          "name": "IBM Db2",
                \\          "slug": "ibm-db2"
                \\      },
                \\      {
                \\          "name": "AWS Bucket 1",
                \\          "slug": "aws-bucket-1"
                \\      },
                \\      {
                \\          "name": "GCP Bucket 1",
                \\          "slug": "gcp-bucket-1"
                \\      },
                \\      {
                \\          "name": "Azure Bucket 1",
                \\          "slug": "azure-bucket-1"
                \\      },
                \\      {
                \\          "name": "Kafka Cluster",
                \\          "slug": "kafka-cluster"
                \\      },
                \\      {
                \\          "name": "Memphis Cluster",
                \\          "slug": "memphis-cluster"
                \\      },
                \\      {
                \\          "name": "FTP",
                \\          "slug": "ftp"
                \\      },
                \\      {
                \\          "name": "SFTP",
                \\          "slug": "sftp"
                \\      },
                \\      {
                \\          "name": "Mother Duck",
                \\          "slug": "mother-duck"
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
