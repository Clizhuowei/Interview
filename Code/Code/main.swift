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

var dp: [Int] = [1,2,5,10,6,9,4,3]


var stringArray: [Int] = []
print(stringArray)

reverse(123)

func reverse(_ x: Int) -> Int {
        var numberArray: [Int] = []
        var tempX = x
        var isNegative = false
        if x < 0 {
            tempX = -x
            isNegative = true
        }

        while tempX != 0 {
            let temp = tempX / 10
            let add = tempX - temp * 10
            numberArray.append(add)
            tempX = temp
        }
        
        var result = 0
        var firstIndex = 0
        for (index,num) in numberArray.enumerated() {
            if num != 0 {
                firstIndex = index
                break
            }
        }

        for i in firstIndex..<numberArray.count {
            result = result * 10 + numberArray[i]
        }

        if isNegative {
            result = -result
        }

        return result
    }
