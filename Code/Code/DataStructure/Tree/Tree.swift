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

// 剑指 Offer 07. 重建二叉树，根据 前序遍历+中序遍历重建二叉树
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    guard preorder.count == inorder.count, preorder.count > 0, inorder.count > 0 else {
        return nil
    }
    
    // 前序遍历第一个一定是根节点
    let root = TreeNode(preorder[0])
    
    // 对中序遍历结果进行遍历，找到中序遍历中，根节点的位置 Index
    for (index, num) in inorder.enumerated() {
        if num == preorder[0] {
            // 根节点位置为 Index, 说明左数节点数目是 Index
            // 前序遍历从1开始是因为0是根节点
            // 看起来这里也是可以直接写 1...index，但是写成 1..<index+1 是因为如果 index 为0进入循环会越界
            let leftPreOrder = Array(preorder[1..<index+1])
            
            let leftInorder = Array(inorder[0..<index])
            root.left = buildTree(leftPreOrder, leftInorder)
            
            // 从 index + 1 开始因为算上根节点 1 和 左节点数目 index
            let rightPreorder = Array(preorder[index+1..<preorder.endIndex])
            let rightInorder = Array(inorder[index+1..<inorder.endIndex])
            root.right = buildTree(rightPreorder, rightInorder)
        }
    }
    
    return root
}

// MARK: - 剑指 Offer 26. 树的子结构
func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
    if A == nil || B == nil {
        return false
    }
    
    return contains(A, B) || isSubStructure(A?.left, B) || isSubStructure(A?.right, B)
}

func contains(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
    if B == nil {
        return true
    }
    if A == nil || A!.val != B!.val {
        return false
    }
    return contains(A?.left, B?.left) && contains(A?.right, B?.right)
}

// MARK: - 镜像树
func mirrorTree(_ root: TreeNode?) -> TreeNode? {
    if root == nil {
        return nil
    }

    let left = mirrorTree(root?.right)
    let right = mirrorTree(root?.left)

    root?.left = left
    root?.right = right

    return root
}

