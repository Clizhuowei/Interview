//
//  DFS.swift
//  Code
//
//  Created by 李卓维 on 2023/1/14.
//

import Foundation

// MARK: - 剑指 Offer 12. 矩阵中的路径
func existA(_ board: [[Character]], _ word: String) -> Bool {
      var temp = board
      var characters = [Character]()
      for c in word {
          characters.append(c)
      }
      for i in 0..<board.count {
          for j in 0..<board[0].count {
              if dfs(&temp, characters, i, j, 0) {
                  return true
              }
          }
      }

      return false
  }

func dfs(_ board: inout [[Character]], _ word: [Character], _ line: Int, _ list: Int, _ wordIndex: Int) -> Bool {
    if line < 0 || line >= board.count || list < 0 || list >= board[0].count || board[line][list] != word[wordIndex] {
        return false
    }

    if wordIndex == word.count - 1 {
        return true
    }

    board[line][list] = Character(" ")

    let res = dfs(&board, word, line-1, list, wordIndex+1) || dfs(&board, word, line+1, list, wordIndex+1)
    || dfs(&board, word, line, list-1, wordIndex+1) || dfs(&board, word, line, list+1, wordIndex+1)
    
    return res
}


// MARK: - 剑指 Offer 17. 打印从1到最大的n位数
class PrintNDigitSolution {
    var result: [Int] = []

    func printNumbers(_ n: Int) -> [Int] {
        for i in 1...n {
            for j in 1...9 {
                var numberString = ""
                numberString.append(String(j))
                dfs(1, i, &numberString)
            }
        }

        return self.result
    }

    func dfs(_ currentDigit: Int, _ totalDigit: Int, _ numberString: inout String) {
        if currentDigit == totalDigit {
            self.result.append(Int(numberString)!)
        } else {
            for i in 0...9 {
                numberString.append(String(i))
                dfs(currentDigit+1, totalDigit, &numberString)
                numberString.removeLast()
            }
        }

    }
}
