//
//  BST.swift
//  Code
//
//  Created by 李卓维 on 2023/1/12.
//

import Foundation

// 给你一个整数 n ，求恰由 n 个节点组成且节点值从 1 到 n 互不相同的 二叉搜索树 有多少种？返回满足题意的二叉搜索树的种数。


// MARK: - 剑指 Offer 33. 二叉搜索树的后序遍历序列
func verifyPostorder(_ postorder: [Int]) -> Bool {
    return verifyPostorderRecur(postorder, 0, postorder.count - 1)
}

func verifyPostorderRecur(_ postorder: [Int], _ left: Int, _ right: Int) -> Bool {
    if left >= right {
        return true
    }

    let rootVal = postorder[right]
    var mid = left
    while mid < right, postorder[mid] < rootVal {
        mid += 1
    }

    for index in mid..<right {
        if postorder[index] < rootVal {
            return false
        }
    }
    
    return verifyPostorderRecur(postorder, left, mid-1) && verifyPostorderRecur(postorder, mid, right-1)
}

