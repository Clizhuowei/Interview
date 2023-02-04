//
//  String.swift
//  Code
//
//  Created by 李卓维 on 2023/1/30.
//

import Foundation

// MARK: - N 字形变换
// https://leetcode.cn/problems/zigzag-conversion/

func convert(_ s: String, _ numRows: Int) -> String {
       // 必须要做这个判断，因为如果不做这个判断，进循环就会越界
       if numRows < 1 {
           return s
       }
       var sArray: [Character] = []
       
       for c in s {
           sArray.append(c)
       }

       var resultString: [String] = Array.init(repeating:"", count:numRows)
       var currentDirection = 1
       var currentRow = 0
       for c in sArray {
           resultString[currentRow].append(c)
           if currentRow == numRows - 1, currentDirection == 1 {
               currentDirection = 0
           } else if currentRow == 0, currentDirection == 0 {
               currentDirection = 1
           }

           if currentDirection == 1 {
               currentRow += 1
           } else {
               currentRow -= 1
           }
       }

       var result = ""
       for temp in resultString {
           result += temp
       }

       return result
   }
