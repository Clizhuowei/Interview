//
//  Tree.swift
//  Code
//
//  Created by 李卓维 on 2023/1/12.
//

import Foundation

// MARK: 二叉树是否对称
func isSymmetric(_ root: TreeNode?) -> Bool {
        guard root != nil else {
            return true
        }

        return dfs(root?.left, root?.right)
    }

func dfs(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
    if node1 == nil, node2 == nil {
        return true
    }
    if node1 == nil || node2 == nil {
        return false
    }
    if node1!.val != node2!.val {
        return false
    }
    return dfs(node1?.left, node2?.right) && dfs(node1?.right, node2?.left)

}
