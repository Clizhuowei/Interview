//
//  DP.swift
//  Code
//
//  Created by 李卓维 on 2023/1/12.
//

import Foundation

/*
 1. 确定 DP 数组含义，以及下标意义
 2. 递推公式
 3. DP 数组初始化
 4. 遍历顺序
 5. 打印 DP 数组（DEBUG用）
 */

// 斐波拉契数列
func fib(_ n: Int) -> Int {
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }

    var dp: [Int] = []
    dp.append(0)
    dp.append(1)
    for i in 2...n {
        dp.append(dp[i - 1] + dp[i - 2])
    }

    return dp[n]
}

func climbStairs(_ n: Int) -> Int {
    if n == 1 {
        return 1
    }
    if n == 2 {
        return 2
    }
    
    var dp: [Int] = [1,2]
    for i in 2..<n {
        dp.append(dp[i-1]+dp[i-2])
    }
    return dp[n-1]
}

// LeetCode: 746
func minCostClimbingStairs(_ cost: [Int]) -> Int {
    // dp[i] = min(dp[i-1]+cost[i-1], dp[i-1]+cost[i-2
    var dp: [Int] = [0, 0]

    for i in 2...cost.count {
        dp.append(min(dp[i-1]+cost[i-1], dp[i-2]+cost[i-2]))
    }

    return dp[cost.count]
}
