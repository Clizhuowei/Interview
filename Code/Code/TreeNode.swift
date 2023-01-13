//
//  TreeNode.swift
//  Code
//
//  Created by 李卓维 on 2023/1/9.
//

import Foundation
class TreeNode {
    var val : Int
    var left : TreeNode?
    var right : TreeNode?
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class TreeNodeInitializer {
    // 层序介绍树生成器
    func treeInit(_ treeValueArray: [Int?]) -> TreeNode? {
        guard !treeValueArray.isEmpty && treeValueArray[0] != nil else {
            return nil
        }
        
        let root = TreeNode(treeValueArray[0]!, nil, nil)
        
        var rootQueue: [TreeNode] = [root]
        var index = 1
        
        while (index < treeValueArray.count) {
            let tempRoot = rootQueue.removeFirst()
            tempRoot.left = self.treeNodeInitWithValue(treeValueArray[index])
            if let left = tempRoot.left {
                rootQueue.append(left)
            }
            index += 1
            if index > treeValueArray.count - 1 {
                break
            }
            tempRoot.right = self.treeNodeInitWithValue(treeValueArray[index])
            if let right = tempRoot.right {
                rootQueue.append(right)
            }
            index += 1
        }
    
        
        return root
    }
    
    func treeNodeInitWithValue(_ val: Int?) -> TreeNode? {
        if let value = val {
            return TreeNode(value, nil, nil)
        } else {
            return nil
        }
    }
}
