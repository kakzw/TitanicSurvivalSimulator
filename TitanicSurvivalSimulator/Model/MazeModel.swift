//
//  MazeModel.swift
//  TitanicSurvivalSimulator
//
//  Created by Kento Akazawa on 5/9/24.
//

import SwiftUI

struct Maze {
  var maze: [[MazeCell]]
  var start: (row: Int, col: Int)
  var goal: (row: Int, col: Int)
  var num: Int // used as identifier
}

struct MazeCell {
  var borders: [Border] = [Border]()
  
  func hasBorder(_ border: Border) -> Bool {
    return borders.contains(border)
  }
}

class MazeModel {
  private var easyMazes: [Maze]
  private var mediumMazes: [Maze]
  
  // MARK: - Initialization
  
  init() {
    self.easyMazes = [easyMaze1, easyMaze2, easyMaze3, easyMaze4, easyMaze5, easyMaze6, easyMaze7, easyMaze8, easyMaze9, easyMaze10, easyMaze11, easyMaze12]
    self.mediumMazes = [mediumMaze1, mediumMaze3, mediumMaze4, mediumMaze6]
  }
  
  // MARK: - Public Functions
  
  // picks maze randomly based on @difficulty and return it
  func getMaze(difficulty: MazeDifficulty) -> Maze {
    switch difficulty {
    case .easy:
      let index = Int.random(in: 0..<easyMazes.count)
      return easyMazes[index]
    case .medium:
      let index = Int.random(in: 0..<mediumMazes.count)
      return mediumMazes[index]
    }
  }
  
  // MARK: - List of Easy Mazes
  
  let easyMaze1: Maze = Maze(maze: [
    [MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right])]
  ], start: (9, 0), goal: (1, 4), num: 1)
  
  let easyMaze2 = Maze(maze: [
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .bottom, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .bottom, .right])]
  ], start: (9, 6), goal: (3, 6), num: 2)
  
  let easyMaze3: Maze = Maze(maze: [
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left]), MazeCell(borders: [.right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom, .right])]
  ], start: (5, 0), goal: (9, 4), num: 3)
  
  let easyMaze4: Maze = Maze(maze: [
    [MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left, .right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right])]
  ], start: (6, 6), goal: (0, 0), num: 4)
  
  let easyMaze5: Maze = Maze(maze: [
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom, .right])]
  ], start: (9, 6), goal: (6, 1), num: 9)
  
  let easyMaze6 = Maze(maze: [
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top]), MazeCell(borders: [.top]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.bottom, .right])]
  ], start: (7, 6), goal: (5, 2), num: 11)
  
  let easyMaze7 = Maze(maze: [
    [MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom, .right])]
  ], start: (9, 6), goal: (0, 0), num: 12)
  
  let easyMaze8 = Maze(maze: [
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.bottom, .right])]
  ], start: (3, 5), goal: (6, 4), num: 14)
  
  let easyMaze9 = Maze(maze: [
    [MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right])]
  ], start: (8, 3), goal: (0, 1), num: 19)
  
  let easyMaze10 = Maze(maze: [
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.top, .left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right])]
  ], start: (2, 3), goal: (4, 6), num: 22)
  
  let easyMaze11 = Maze(maze: [
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right])]
  ], start: (0, 3), goal: (3, 6), num: 24)
  
  let easyMaze12 = Maze(maze: [
    [MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right])]
  ], start: (9, 1), goal: (0, 1), num: 29)
  
  // MARK: - List of Medium Mazes
  
  let mediumMaze1: Maze = Maze(maze: [
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [. left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.bottom, .right])]
  ], start: (6, 3), goal: (5, 6), num: 1)
  
  let mediumMaze3: Maze = Maze(maze: [
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom,]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom, .right])]
  ], start: (13, 0), goal: (7, 8), num: 3)
  
  let mediumMaze4: Maze = Maze(maze: [
    [MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right])]
  ], start: (13, 9), goal: (3, 6), num: 6)
  
  let mediumMaze6: Maze = Maze(maze: [
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom, .right])]
  ], start: (0, 9), goal: (13, 9), num: 16)
  
  let mediumMaze2: Maze = Maze(maze: [
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()]
  ], start: (0, 0), goal: (0, 0), num: 2)
  
  // MARK: - Test Functions
  
  // returns all mazes with @difficulty
  func getMazes(difficulty: MazeDifficulty) -> [Maze] {
    switch difficulty {
      case .easy:
        return easyMazes
      case .medium:
        return mediumMazes
    }
  }
}
