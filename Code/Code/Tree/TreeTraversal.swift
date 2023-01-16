//
//  TreeTraversal.swift
//  Code
//
//  Created by 李卓维 on 2023/1/10.
//

import Foundation

// MARK: - 前序遍历 PreorderTraversal, 根左右
func preorderRecursiveTraversal(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    
    var result: [Int] = []
    preorderRecursive(root, &result)
    
    return result
    
}

func preorderRecursive(_ root: TreeNode?, _ result: inout [Int]) {
    guard root != nil else {
        return
    }
    
    result.append(root!.val)
    preorderRecursive(root?.left, &result)
    preorderRecursive(root?.right, &result)
}

func preorderIterativeTraversal(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    
    var currentRoot = root
    var result: [Int] = []
    var rootStack: [TreeNode] = []
    
    while !rootStack.isEmpty || currentRoot != nil {
        while currentRoot != nil {
            rootStack.append(currentRoot!)
            result.append(currentRoot!.val)
            currentRoot = currentRoot?.left
        }
        
        currentRoot = rootStack.removeLast().right
    }
    
    return result
}

// MARK: - 中序遍历 InorderTraversal, 左根右
func inorderRecursiveTraversal(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    
    var inorderResult: [Int] = []
    inorderRecursive(root, &inorderResult)
    
    return inorderResult
}

func inorderRecursive(_ root: TreeNode?, _ inorderResult: inout [Int]) {
    guard root != nil else {
        return
    }
    inorderRecursive(root?.left, &inorderResult)
    inorderResult.append(root!.val)
    inorderRecursive(root?.right, &inorderResult)
}

func inorderIterativeTraversal(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    
    var rootStack: [TreeNode] = []
    var inorderResult: [Int] = []
    var currentRoot = root
    
    while !rootStack.isEmpty || currentRoot != nil {
        while currentRoot != nil {
            rootStack.append(currentRoot!)
            currentRoot = currentRoot?.left
        }
        
        currentRoot = rootStack.removeLast()
        inorderResult.append(currentRoot!.val)
        currentRoot = currentRoot?.right
    }
    
    return inorderResult
}

// MARK: - 后序遍历，左右根
func postorderRecursiveTraversal(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    
    var postorderResult: [Int] = []
    
    postorderRecursive(root, &postorderResult)
    return postorderResult
}

func postorderRecursive(_ root: TreeNode?, _ result: inout [Int]) {
    guard root != nil else {
        return
    }
    
    postorderRecursive(root?.left, &result)
    postorderRecursive(root?.right, &result)
    result.append(root!.val)
}

func postorderIterativeTraversal(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    
    var rootStack = [root!]
    var lastPopRoot = root
    var result = [Int]()
    
    while !rootStack.isEmpty {
        let currentRoot = rootStack.last
        // 指针比较用 ===/!==
        if currentRoot?.left != nil, currentRoot?.left !== lastPopRoot, currentRoot?.right !== lastPopRoot {
            rootStack.append(currentRoot!.left!)
        } else if currentRoot?.right != nil, currentRoot?.right !== lastPopRoot {
            rootStack.append(currentRoot!.right!)
        } else {
            lastPopRoot = rootStack.removeLast()
            result.append(currentRoot!.val)
        }
    }
    
    return result
}

// MARK: 变式题：二叉树裁剪
// 树的每个节点的值要么是 0，要么是 1。请剪除该二叉树中所有节点的值为 0 的子树。
func pruneTree(_ root: TreeNode?) -> TreeNode? {
    guard root != nil else {
        return nil
    }
    root?.left = pruneTree(root?.left)
    root?.right = pruneTree(root?.right)
    if root!.val == 0, root?.left == nil, root?.right == nil {
        return nil
    } else {
        return root
    }
}

// MARK: - 层序遍历
// 从上到下按照每一层一个数组输出
func levelOrderTraversal(_ root: TreeNode?) -> [[Int]] {
    guard root != nil else {
        return []
    }
    
    var rootQueue: [TreeNode] = [root!]
    var result: [[Int]] = []
    
    while !rootQueue.isEmpty {
        var rootLevel: [Int] = []
        
        // 根据当前树的结点数目循环，因为 Queue 是往后面添加，而且 PopFirst，所以不会影响Queue的结构
        for _ in 0..<rootQueue.count {
            let node = rootQueue.removeFirst()
            rootLevel.append(node.val)
            if let left = node.left {
                rootQueue.append(left)
            }
            if let right = node.right {
                rootQueue.append(right)
            }
        }
        
        result.append(rootLevel)
    }
    
    return result
}

// MARK: 变式题：二叉树每一层最大值
func getLevelMax(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    
    var nodeQueue: [TreeNode] = []
    var result: [Int] = []
    
    nodeQueue.append(root!)
    
    while !nodeQueue.isEmpty {
        var levelMax = nodeQueue.first!.val
        for _ in 0..<nodeQueue.count {
            let node = nodeQueue.removeFirst()
            levelMax = max(levelMax, node.val)
            
            if let left = node.left {
                nodeQueue.append(left)
            }
            
            if let right = node.right {
                nodeQueue.append(right)
            }
        }
        result.append(levelMax)
    }
    
    return result
}


// MARK: 变式题：二叉树最底边最左边的值
// 这套题其实只需要用 BFS 就可以了，不依赖层序遍历
func getBottomLeft(_ root: TreeNode?) -> Int? {
    guard root != nil else {
        return nil
    }
    
    var result = root?.val
    var treeQueue: [TreeNode] = [root!]
    
    while !treeQueue.isEmpty {
        let node = treeQueue.removeFirst()
        if let right = node.right {
            treeQueue.append(right)
        }
        if let left = node.left {
            treeQueue.append(left)
        }
        result = node.val
    }
    
    
    return result
}

// MARK: 变式题：二叉树右侧视图
func fromRight(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }

    var result = [Int]()
    var nodeQueue: [TreeNode] = [root!]

    while !nodeQueue.isEmpty {
        let right = nodeQueue.first!.val
        for _ in 0..<nodeQueue.count {
            let node = nodeQueue.removeFirst()
            if let right = node.right {
                nodeQueue.append(right)
            }
            if let left = node.left {
                nodeQueue.append(left)
            }
        }
        result.append(right)
    }

    return result
}

