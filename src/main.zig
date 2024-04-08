const std = @import("std");
const raylib = @cImport(@cInclude("raylib.h"));

pub fn main() !void {
    const WIDTH = 800;
    const HEIGHT = 600;
    const TITLE = "The Librarian";
    raylib.InitWindow(WIDTH, HEIGHT, TITLE);
    raylib.SetTargetFPS(60);
    defer raylib.CloseWindow();
    while (!raylib.WindowShouldClose()) {
        raylib.BeginDrawing();
        raylib.ClearBackground(raylib.BLACK);
        raylib.DrawFPS(10, 10);
        raylib.EndDrawing();
    }
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
