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
            .get = getObjectStores,
        }),
    };
}

pub fn getEndpoint(self: *Self) *zap.SimpleEndpoint {
    return &self.endpoint;
}

fn getObjectStores(e: *zap.SimpleEndpoint, r: zap.SimpleRequest) void {
    if (r.path) |path| {
        // /api/v1/object-stores
        if (path.len == e.settings.path.len) {
            r.setHeader("Access-Control-Allow-Origin", "*") catch unreachable;
            r.sendJson(
                \\{
                \\  "objectStores": [
                \\      {
                \\          "name": "MinIO",
                \\          "slug": "minio"
                \\      },
                \\      {
                \\          "name": "AWS Lake 1",
                \\          "slug": "aws-lake-1"
                \\      },
                \\      {
                \\          "name": "GCP Lake 1",
                \\          "slug": "gcp-lake-1"
                \\      },
                \\      {
                \\          "name": "Azure Lake 1",
                \\          "slug": "azure-lake-1"
                \\      },
                \\      {
                \\          "name": "R2 Lake 1",
                \\          "slug": "r2-lake-1"
                \\      }
                \\  ]
                \\}
            ) catch return;
        }
    }
}
