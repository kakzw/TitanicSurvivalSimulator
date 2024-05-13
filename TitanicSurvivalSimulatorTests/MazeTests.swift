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
      
      XCTAssertTrue(solveMaze(maze: maze), "easy maze \(maze.num) could not be solved.")
    }
  }
  
  func testMediumMazes() {
    for maze in model.getMazes(difficulty: .medium) {
      testTopRow(maze: maze.maze)
      testBottomRow(maze: maze.maze)
      testFirstCol(maze: maze.maze)
      testLastCol(maze: maze.maze)
      testMiddleCells(maze: maze.maze, difficulty: "medium", mazeNum: maze.num)
      
      XCTAssertTrue(solveMaze(maze: maze), "medium maze \(maze.num) could not be solved.")
    }
  }
  
  // MARK: - Helper Functions
  
  // solve maze by recursiving go through all cells it can reach
  // starting at start cell and check if it can reach goal cell
  private func solveMaze(maze: Maze) -> Bool {
    let startCell = maze.maze[maze.start.row][maze.start.col]
    
    // for each border that the start cell doesn't have
    // move to corresponding direction and solve using utility function
    for border in Border.allCases {
      if !startCell.hasBorder(border) {
        if solveMazeUtils(maze: maze.maze,
                          pos: getNewPos(of: maze.start, border: border),
                          goal: maze.goal,
                          from: border.opposite) {
          return true
        }
      }
    }
    // if after going through all directions from start cell
    // and could not reach the goal
    return false
  }
  
  // from maze cell at @pos, go to all surrounding cells that it can go to (has not border)
  private func solveMazeUtils(maze: [[MazeCell]], pos: (row: Int, col: Int), goal: (row: Int, col: Int), from: Border) -> Bool {
    // if already reached the goal, returns true
    if pos.row == goal.row && pos.col == goal.col { return true }
    
    let cell = maze[pos.row][pos.col]
    // for each border that @cell doesn't have
    // move to that direction
    for border in Border.allCases {
      // even if @cell doesn't have border
      // if it's the direction that it came from, don't go back
      if border != from && !cell.hasBorder(border) {
        if solveMazeUtils(maze: maze,
                          pos: getNewPos(of: pos, border: border),
                          goal: goal,
                          from: border.opposite) {
          return true
        }
      }
    }
    // if after going through all directions from @cell
    // and could not reach the goal
    return false
  }
  
  // returns new position based on current position and
  // border that the current cell doesn't have
  private func getNewPos(of pos: (row: Int, col: Int), border: Border) -> (row: Int, col: Int) {
    switch border {
      // if it doesn't have top border, move up
      case .top:
        return (pos.row-1, pos.col)
      // if it doesn't have bottom border, move down
      case .bottom:
        return (pos.row+1, pos.col)
      // if it doesn't have left border, move left
      case .left:
        return (pos.row, pos.col-1)
      // if it doesn't have right border, move right
      case .right:
        return (pos.row, pos.col+1)
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
        
        // if @cell has a bottom border
        // a cell below must have top border
        if cell.hasBorder(.bottom) {
          XCTAssertTrue(maze[row+1][col].hasBorder(.top), "\(difficulty) maze \(mazeNum), row: \(row), column: \(col)")
        } else {
          XCTAssertFalse(maze[row+1][col].hasBorder(.top), "\(difficulty) maze \(mazeNum), row: \(row), column: \(col)")
        }
        
        // if @cell has a left border
        // a cell to the left must have right border
        if cell.hasBorder(.left) {
          XCTAssertTrue(maze[row][col-1].hasBorder(.right), "\(difficulty) maze \(mazeNum), row: \(row), column: \(col)")
        } else {
          XCTAssertFalse(maze[row][col-1].hasBorder(.right), "\(difficulty) maze \(mazeNum), row: \(row), column: \(col)")
        }
        
        // if @cell has a right border
        // a cell to the right must have left border
        if cell.hasBorder(.right) {
          XCTAssertTrue(maze[row][col+1].hasBorder(.left), "\(difficulty) maze \(mazeNum), row: \(row), column: \(col)")
        } else {
          XCTAssertFalse(maze[row][col+1].hasBorder(.left), "\(difficulty) maze \(mazeNum), row: \(row), column: \(col)")
        }
      }
    }
  }
}
