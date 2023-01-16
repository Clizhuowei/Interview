//
//  Common.swift
//  Code
//
//  Created by 李卓维 on 2023/1/15.
//

import Foundation


// MARK: 剑指 Offer 21. 调整数组顺序使奇数位于偶数前面
func exchange(_ nums: [Int]) -> [Int] {
    if nums.count == 0 {
        return []
    }
    
    var result = nums
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        if result[left] % 2 == 1 {
            left += 1
        } else if result[right] % 2 == 0 {
            right -= 1
        } else {
            let temp = result[right]
            result[right] = result[left]
            result[left] = temp
            left += 1
            right -= 1
        }
    }
    
    return result
}

// MARK: - 顺时针打印矩阵
func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    if matrix.count == 0 {
        return []
    }

    if matrix[0].count == 0 {
        return []
    }
    var top = 0
    var bottom = matrix.count - 1
    var left = 0
    var right = matrix[0].count - 1
    var result: [Int] = []
    
    while true {
        for index in left...right {
            result.append(matrix[top][index])
        }
        top += 1
        if top > bottom {
            break
        }

        for index in top...bottom {
            result.append(matrix[index][right])
        }
        right -= 1
        if right < left {
            break
        }

        for index in stride(from:right ,to:left-1, by:-1) {
            result.append(matrix[bottom][index])
        }
        bottom -= 1
        if bottom < top {
            break
        }

        for index in stride(from:bottom ,to:top-1, by:-1) {
            result.append(matrix[index][left])
        }
        left += 1
        if left > right {
            break
        }
    }

    return result
}

