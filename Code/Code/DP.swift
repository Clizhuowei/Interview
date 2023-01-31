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

// 剑指 Offer 14- I. 剪绳子
func cuttingRope(_ n: Int) -> Int {
    if n == 2 {
        return 1
    }
    var dp: [Int] = []
    for _ in 0...n {
        dp.append(0)
    }
    dp[2] = 1
    
    for index in 3...n {
        for i in (1..<index).reversed() {
            dp[index] = max(dp[index], max(i * dp[index-i], i * (index-i)))
        }
    }

    return dp[n]
}

// MARK: - 最长回文子串，核心 dp[i][j] 表示从 i - j 的字符串是否是回文的
func longestPalindrome(_ s: String) -> String {
    if s.count <= 1 {
        return s
    }
    
    var sArray: [Character] = []
    for c in s {
        sArray.append(c)
    }
    
    var dp: [[Bool]] = Array.init(repeating:Array.init(repeating:false, count:s.count), count:s.count)
    var maxLength = 0
    var maxBegin = 0

    for i in 0..<s.count {
        dp[i][i] = true
    }

    for i in stride(from:s.count-1, through:0, by:-1) {
        for j in i..<s.count {
            if sArray[i] == sArray[j] {
                if j - i <= 1 {
                    dp[i][j] = true
                } else {
                    dp[i][j] = dp[i+1][j-1]
                }
            } else {
                dp[i][j] = false
            }

            if j - i > maxLength, dp[i][j] == true {
                maxBegin = i
                maxLength = j - i
            }
        }
    }
    
    let beginIndex = s.index(s.startIndex, offsetBy:maxBegin)
    let finalIndex = s.index(s.startIndex, offsetBy:maxBegin+maxLength)
    return String(s[beginIndex...finalIndex])
}

