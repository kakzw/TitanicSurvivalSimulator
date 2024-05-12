//
//  MazeTests.swift
//  TitanicSurvivalSimulatorTests
//
//  Created by Kento Akazawa on 5/12/24.
//

import XCTest
@testable import TitanicSurvivalSimulator

final class MazeTests: XCTestCase {
  
  private var model: MazeModel!
  
  override func setUpWithError() throws {
    model = MazeModel()
  }
  
  override func tearDownWithError() throws {
    model = nil
  }
  
  // MARK: - Test Functions
  
  func testEasyMazes() {
    for maze in model.getMazes(difficulty: .easy) {
      testTopRow(maze: maze.maze)
      testBottomRow(maze: maze.maze)
      testFirstCol(maze: maze.maze)
      testLastCol(maze: maze.maze)
      testMiddleCells(maze: maze.maze, difficulty: "easy", mazeNum: maze.num)
    }
  }
  
  func testMediumMazes() {
    for maze in model.getMazes(difficulty: .medium) {
      testTopRow(maze: maze.maze)
      testBottomRow(maze: maze.maze)
      testFirstCol(maze: maze.maze)
      testLastCol(maze: maze.maze)
      testMiddleCells(maze: maze.maze, difficulty: "medium", mazeNum: maze.num)
    }
  }
  
  // MARK: - Helper Functions
  
  private func testMiddleCells(maze: [[MazeCell]], difficulty: String, mazeNum: Int) {
    let rows = maze.count
    let cols = maze[0].count
    for row in 1..<rows-1 {
      for col in 1..<cols-1 {
        let cell = maze[row][col]
        
        // if @cell has a top border
        // a cell above must have bottom border
        // otherwise, a cell above should not have bottom border
        if cell.hasBorder(.top) {
          XCTAssertTrue(maze[row-1][col].hasBorder(.bottom), "\(difficulty) maze \(mazeNum), row: \(row), column: \(col)")
        } else {
          XCTAssertFalse(maze[row-1][col].hasBorder(.bottom), "\(difficulty) maze \(mazeNum), row: \(row), column: \(col)")
        }
        
        if cell.hasBorder(.bottom) {
          XCTAssertTrue(maze[row+1][col].hasBorder(.top), "\(difficulty) maze \(mazeNum), row: \(row), column: \(col)")
        } else {
          XCTAssertFalse(maze[row+1][col].hasBorder(.top), "\(difficulty) maze \(mazeNum), row: \(row), column: \(col)")
        }
        
        if cell.hasBorder(.left) {
          XCTAssertTrue(maze[row][col-1].hasBorder(.right), "\(difficulty) maze \(mazeNum), row: \(row), column: \(col)")
        } else {
          XCTAssertFalse(maze[row][col-1].hasBorder(.right), "\(difficulty) maze \(mazeNum), row: \(row), column: \(col)")
        }
        
        if cell.hasBorder(.right) {
          XCTAssertTrue(maze[row][col+1].hasBorder(.left), "\(difficulty) maze \(mazeNum), row: \(row), column: \(col)")
        } else {
          XCTAssertFalse(maze[row][col+1].hasBorder(.left), "\(difficulty) maze \(mazeNum), row: \(row), column: \(col)")
        }
      }
    }
  }
  
  // top row must have top border
  private func testTopRow(maze: [[MazeCell]]) {
    let firstRow = maze.first
    XCTAssertNotNil(firstRow)
    
    for cell in firstRow! {
      XCTAssertTrue(cell.hasBorder(.top))
    }
  }
  
  // bottom row must have bottom border
  private func testBottomRow(maze: [[MazeCell]]) {
    let lastRow = maze.last
    XCTAssertNotNil(lastRow)
    
    for cell in lastRow! {
      XCTAssertTrue(cell.hasBorder(.bottom))
    }
  }
  
  // first column must have left border
  private func testFirstCol(maze: [[MazeCell]]) {
    for row in maze {
      let cell = row.first
      XCTAssertNotNil(cell)
      
      XCTAssertTrue(cell!.hasBorder(.left))
    }
  }
  
  // last column must have right border
  private func testLastCol(maze: [[MazeCell]]) {
    for row in maze {
      let cell = row.last
      XCTAssertNotNil(cell)
      
      XCTAssertTrue(cell!.hasBorder(.right))
    }
  }
}
