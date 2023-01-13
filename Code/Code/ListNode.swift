//
//  ListNode.swift
//  Code
//
//  Created by 李卓维 on 2023/1/9.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

class ListNodeInitializer {
    func initWithListValues(_ listValues: [Int]) -> ListNode? {
        guard !listValues.isEmpty else {
            return nil
        }
        
        let head = ListNode(listValues[0], nil)
        var tempHead = head
        for index in 1..<listValues.count {
            tempHead.next = ListNode(listValues[index], nil)
            if let next = tempHead.next {
                tempHead = next
            }
        }
        
        return head
    }
}

