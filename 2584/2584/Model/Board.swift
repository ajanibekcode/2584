//
//  Board.swift
//  2584
//
//  Created by Aknazar Janibek on 7/23/23.
//

import Foundation
import UIKit

struct Board {
    let size: Int
    var board: [[Int]]
    var score: Int = 0
    var tilePositions: [[CGSize]]
    
    init(size: Int){
        self.size = size
        self.board = Array(repeating: Array(repeating: 0, count: size), count: size)
        self.tilePositions = Array(repeating: Array(repeating: CGSize.zero, count: size), count: size)
        placeInitialTile()
    }
    
    private mutating func placeInitialTile() {
        placeTile(value: 1)
        placeTile(value: 2)
    }
    
    private mutating func placeTile(value: Int){
        var emptyCells = [(Int, Int)]()
        
        for row in 0..<size {
            for col in 0..<size {
                if board[row][col] == 0{
                    emptyCells.append((row, col))
                }
            }
        }
        if let randomCell = emptyCells.randomElement(){
            let (row, col) = randomCell
            board[row][col] = value
            tilePositions[row][col] = CGSize(width: CGFloat(col) * TileProperties.tileWidth, height: CGFloat(row) * TileProperties.tileHeight)
        }
    }
    
    private mutating func addRandomTile(){
        let newValue = Bool.random() ? 1 : 2
        placeTile(value: newValue)
    }
    
    private func canMerge(_ a: Int, _ b: Int) -> Bool {
        let fibonacciSequence = [1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584]
        let sum = a + b
        return fibonacciSequence.contains(sum)
    }
        
    mutating func move(direction: Direction){
        switch direction{
        case .up:
            moveUp()
        
        case .down:
            moveDown()
        
        case .left:
            moveLeft()
        
        case .right:
            moveRight()
        }
        addRandomTile()
    }
        
    private mutating func moveUp() {
        for column in 0..<size {
            var merged = [Bool](repeating: false, count: size)
            for row in 1..<size {
                if board[row][column] != 0 {
                    var currentRow = row
                    while currentRow > 0 && board[currentRow - 1][column] == 0 {
                        board[currentRow - 1][column] = board[currentRow][column]
                        board[currentRow][column] = 0
                        currentRow -= 1
                    }
                    if currentRow > 0 && !merged[currentRow - 1] {
                        let valueA = board[currentRow - 1][column]
                        let valueB = board[currentRow][column]
                        if canMerge(valueA, valueB){
                            board[currentRow - 1][column] = valueA + valueB
                            board[currentRow][column] = 0
                            merged[currentRow - 1] = true
                            score += valueA + valueB
                        }
                    }
                }
            }
        }
    }

    private mutating func moveDown() {
        for column in 0..<size {
            var merged = [Bool](repeating: false, count: size)
            for row in (0..<size - 1).reversed() {
                if board[row][column] != 0 {
                    var currentRow = row
                    while currentRow < size - 1 && board[currentRow + 1][column] == 0 {
                        board[currentRow + 1][column] = board[currentRow][column]
                        board[currentRow][column] = 0
                        currentRow += 1
                    }
                    if currentRow < size - 1 && !merged[currentRow + 1] {
                        let valueA = board[currentRow + 1][column]
                        let valueB = board[currentRow][column]
                        if canMerge(valueA, valueB){
                            board[currentRow + 1][column] = valueA + valueB
                            board[currentRow][column] = 0
                            merged[currentRow + 1] = true
                            score += valueA + valueB
                        }
                    }
                }
            }
        }
    }

    private mutating func moveLeft() {
        for row in 0..<size {
            var merged = [Bool](repeating: false, count: size)
            for column in 1..<size {
                if board[row][column] != 0 {
                    var currentColumn = column
                    while currentColumn > 0 && board[row][currentColumn - 1] == 0 {
                        board[row][currentColumn - 1] = board[row][currentColumn]
                        board[row][currentColumn] = 0
                        currentColumn -= 1
                    }
                    if currentColumn > 0 && !merged[currentColumn - 1] {
                        let valueA = board[row][currentColumn - 1]
                        let valueB = board[row][currentColumn]
                        if canMerge(valueA, valueB){
                            board[row][currentColumn - 1] = valueA + valueB
                            board[row][currentColumn] = 0
                            merged[currentColumn - 1] = true
                            score += valueA + valueB
                        }
                    }
                }
            }
        }
    }

    private mutating func moveRight() {
        for row in 0..<size {
            var merged = [Bool](repeating: false, count: size)
            for column in (0..<size - 1).reversed() {
                if board[row][column] != 0 {
                    var currentColumn = column
                    while currentColumn < size - 1 && board[row][currentColumn + 1] == 0 {
                        board[row][currentColumn + 1] = board[row][currentColumn]
                        board[row][currentColumn] = 0
                        currentColumn += 1
                    }
                    if currentColumn < size - 1 && !merged[currentColumn + 1] {
                        let valueA = board[row][currentColumn + 1]
                        let valueB = board[row][currentColumn]
                        if canMerge(valueA, valueB){
                            board[row][currentColumn + 1] = valueA + valueB
                            board[row][currentColumn] = 0
                            merged[currentColumn + 1] = true
                            score += valueA + valueB
                        }
                    }
                }
            }
        }
    }
}
