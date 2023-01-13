//
//  main.swift
//  Code
//
//  Created by 李卓维 on 2023/1/8.
//

import Foundation

let listNodeHelper = ListNodeInitializer()
let head = listNodeHelper.initWithListValues([2,3,4,5,6])
print(head!.next!.next!.val)

//
let helper = TreeNodeInitializer()
let root = helper.treeInit([1, nil, 2,3])

print(climbStairs(3))
