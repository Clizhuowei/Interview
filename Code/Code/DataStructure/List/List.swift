//
//  ListNodeCommon.swift
//  Code
//
//  Created by 李卓维 on 2023/1/14.
//

import Foundation

// MARK: 160. 相交链表
func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    guard headA != nil, headB != nil else {
        return nil
    }
    
    // 1. 获取链表长度
    var tempA = headA
    var aLength = 0
    while tempA != nil {
        tempA = tempA?.next
        aLength += 1
    }
    
    var tempB = headB
    var bLength = 0
    while tempB != nil {
        tempB = tempB?.next
        bLength += 1
    }
    
    tempA = headA
    tempB = headB
    
    while aLength != bLength {
        if aLength > bLength {
            tempA = tempA?.next
            aLength -= 1
        } else {
            tempB = tempB?.next
            bLength -= 1
        }
    }
    
    while tempA !== tempB {
        tempA = tempA?.next
        tempB = tempB?.next
    }
    
    return tempA
}

// MARK: - 剑指 Offer 22. 链表中倒数第k个节点
func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard head != nil else {
        return nil
    }
    
    var result = head
    var end = head
    for _ in 0..<k {
        if end == nil {
            return nil
        }
        end = end?.next
    }
    
    while end != nil {
        result = result?.next
        end = end?.next
    }
    
    return result
}

// MARK: - 剑指 Offer 24. 反转链表
func reverseList(_ head: ListNode?) -> ListNode? {
    var prev: ListNode? = nil
    var cur = head
    
    while cur != nil {
        let temp = cur?.next
        cur?.next = prev
        prev = cur
        cur = temp
    }
    
    return prev
}

// MARK: - 剑指 Offer 25. 合并两个排序的链表
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil || l2 == nil{
        return l1 ?? l2
    }
    
    let head: ListNode? = ListNode(0)
    var temp = head
    var tempL1 = l1
    var tempL2 = l2
    
    while tempL1 != nil, tempL2 != nil {
        if tempL1!.val < tempL2!.val {
            temp?.next = tempL1
            tempL1 = tempL1?.next
        } else {
            temp?.next = tempL2
            tempL2 = tempL2?.next
        }
        temp = temp?.next
    }
    
    temp?.next = tempL1 ?? tempL2
    
    return head?.next
}

// MARK: 25. K 个一组翻转链表
func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    let dummy: ListNode? = ListNode(0)
    dummy?.next = head
    
    var prev = dummy
    var end = dummy
    
    while end?.next != nil {
        for _ in 0..<k {
            end = end?.next
        }
        if end == nil {
            break
        }
        
        let start = prev?.next
        let next = end?.next
        
        // 断开后续, 开始进行翻转
        end?.next = nil
        
        // 使用到上面的反转链表
        prev?.next = reverseList(start!)
        
        //
        start?.next = next
        
        // 重新置
        prev = start
        end = start
    }
    
    return dummy?.next
}
