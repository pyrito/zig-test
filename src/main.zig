const std = @import("std");


fn range(start: usize, end: usize) []const void {
    return @as([*]void, undefined)[start..end];
}

fn fibonacci(n: u64) !u64 {
    if (n < 1) {
        return error.InvalidParam;
    }
    if (n == 1) {
        return 0;
    }
    else if (n == 2) {
        return 1;
    }
    var prev: u64 = 0;
    var res: u64 = 1;
    var idx: u64 = 3;
    while (idx <= n) {
        var tmp = prev + res;
        prev = res;
        res = tmp;
        idx += 1;
    }
    return res;
}

fn fibonacci_for(n: u64) !u64 {
    if (n < 1) {
        return error.InvalidParam;
    }
    if (n == 1) {
        return 0;
    }
    else if (n == 2) {
        return 1;
    }
    var prev: u64 = 0;
    var res: u64 = 1;
    var idx: u64 = 3;
    for (range(idx, n+1)) |x, i| {
        std.debug.print("x: {d}, i: {d}\n", .{x, i});
        var tmp = prev + res;
        prev = res;
        res = tmp;
        idx += 1;
    }
    return res;
}

pub fn main() anyerror!void {
    // 0 1 1 2 3 5
    // var x = fibonacci(7);
    var x = fibonacci_for(7);
    std.debug.print("fibonacci: {d}\n", .{x});
}

test "basic test" {
    try std.testing.expectEqual(10, 3 + 7);
}
