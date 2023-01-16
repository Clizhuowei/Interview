//
//  Stack.swift
//  Code
//
//  Created by 李卓维 on 2023/1/14.
//

import Foundation

// 剑指 Offer 09. 用两个栈实现队列
class CQueue {
    private var inputStack: [Int]
    private var outputStack: [Int]

    init() {
        self.inputStack = []
        self.outputStack = []
    }
    
    func appendTail(_ value: Int) {
        // Stack: 从尾部取、从尾部添加
        self.inputStack.append(value)
    }
    
    func deleteHead() -> Int {
        if !self.outputStack.isEmpty {
            return self.outputStack.removeLast()
        }

        if self.inputStack.isEmpty {
            return -1
        }

        while !self.inputStack.isEmpty {
            self.outputStack.append(self.inputStack.removeLast())
        }

        return self.outputStack.removeLast()
    }
}

// MARK:  - 剑指 Offer 31. 栈的压入、弹出序列
func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
    if pushed.count != popped.count {
        return false
    }

    var result: [Int] = []
    var tempPoped = popped
    for pushNum in pushed {
        result.append(pushNum)
        while !result.isEmpty, let first = tempPoped.first, let last = result.last, first == last {
            result.removeLast()
            tempPoped.removeFirst()
        }
    }

    return result.isEmpty
}
