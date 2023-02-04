//
//  main.swift
//  Code
//
//  Created by 李卓维 on 2023/1/8.
//

import Foundation

let listNodeHelper = ListNodeInitializer()
let head = listNodeHelper.initWithListValues([2,3,4,5,6])

//
let helper = TreeNodeInitializer()
let root = helper.treeInit([4,2,7,1,3,6,9])

var dp: [[Int]] = [[1,3],[2,6],[8,10],[15,18]]

print(dp.sorted(by: {$0[0] < $1[0]}))

var stringArray: [Int] = []
print(stringArray)

for i in (1..<3).reversed() {
    print(i)
}

