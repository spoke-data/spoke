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
            .get = getComponents,
        }),
    };
}

pub fn getEndpoint(self: *Self) *zap.SimpleEndpoint {
    return &self.endpoint;
}

fn getComponents(e: *zap.SimpleEndpoint, r: zap.SimpleRequest) void {
    if (r.path) |path| {
        // /api/v1/components
        if (path.len == e.settings.path.len) {
            r.setHeader("Access-Control-Allow-Origin", "*") catch unreachable;
            r.sendJson(
                \\{
                \\  "components": [
                \\      {
                \\          "name": "Grafana",
                \\          "slug": "grafana"
                \\      },
                \\      {
                \\          "name": "Redpanda Console",
                \\          "slug": "redpanda-console"
                \\      },
                \\      {
                \\          "name": "Memphis Console",
                \\          "slug": "memphis-console"
                \\      },
                \\      {
                \\          "name": "Debezium Console",
                \\          "slug": "debezium-console"
                \\      },
                \\      {
                \\          "name": "Qryn Console",
                \\          "slug": "qryn-console"
                \\      },
                \\      {
                \\          "name": "MinIO Console",
                \\          "slug": "minio-console"
                \\      },
                \\      {
                \\          "name": "AWS S3 Console",
                \\          "slug": "aws-s3-console"
                \\      },
                \\      {
                \\          "name": "GCP GCS Console",
                \\          "slug": "gcp-gcs-console"
                \\      },
                \\      {
                \\          "name": "Azure Lake Storage",
                \\          "slug": "azure-lake-storage"
                \\      },
                \\      {
                \\          "name": "Cloudflare R2",
                \\          "slug": "cloudflare-r2"
                \\      }
                \\  ]
                \\}
            ) catch return;
        }
    }
}
