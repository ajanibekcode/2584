//
//  _584Tests.swift
//  2584Tests
//
//  Created by Aknazar Janibek on 7/23/23.
//

import XCTest
@testable import _584

final class _584Tests: XCTestCase {
    
    var gameBoard: Board!

    override func setUpWithError() throws {
        gameBoard = Board(size: 4)
    }

    override func tearDownWithError() throws {
        gameBoard = nil
    }

    func testMovement() throws {
        // Test moving tiles to the right
        let initialBoard: [[Int]] = [
            [0, 0, 2, 0],
            [2, 4, 0, 2],
            [0, 2, 2, 2],
            [2, 0, 0, 1]
        ]
        gameBoard.board = initialBoard
        
        gameBoard.move(direction: .right)
        
        XCTAssertEqual(gameBoard.board[0][3], 2) // Move to the Right
        XCTAssertEqual(gameBoard.board[3][3], 3) // Merge
        XCTAssertEqual(gameBoard.board[2][3], 2) // Unchanged
    }
}
