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
    self.easyMazes = [easyMaze1, easyMaze3, easyMaze7, easyMaze9, easyMaze22]
    self.mediumMazes = [mediumMaze1, mediumMaze3, mediumMaze6, mediumMaze16]
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
  
  private let easyMaze1: Maze = Maze(maze: [
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
  ], start: (9, 0), goal: (1, 4))
  
  private let easyMaze3: Maze = Maze(maze: [
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
  ], start: (5, 0), goal: (9, 4))
  
  private let easyMaze7: Maze = Maze(maze: [
    [MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .right]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left, .right])],
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right])]
  ], start: (0, 0), goal: (6, 6))
  
  private let easyMaze9: Maze = Maze(maze: [
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
  ], start: (9, 6), goal: (6, 1))
  
  private let easyMaze22 = Maze(maze: [
    [MazeCell(borders: [.top, .left]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.top, .left, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .bottom, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.bottom, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.left, .right]), MazeCell(borders: [.top, .left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .right])],
    [MazeCell(borders: [.left, .right]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.top, .left]), MazeCell(borders: [.top, .right]), MazeCell(borders: [.left, .right])],
    [MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.top, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right]), MazeCell(borders: [.left, .bottom]), MazeCell(borders: [.bottom, .right])]
  ], start: (2, 3), goal: (4, 6))
  
  private let easyMaze23 = Maze(maze: [
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()],
    [MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell(), MazeCell()]
  ], start: (0, 0), goal: (0, 0))
  
  // MARK: - List of Medium Mazes
  
  private let mediumMaze1: Maze = Maze(maze: [
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
  ], start: (6, 3), goal: (5, 6))
  
  private let mediumMaze3: Maze = Maze(maze: [
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
  ], start: (13, 0), goal: (7, 8))
  
  private let mediumMaze6: Maze = Maze(maze: [
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
  ], start: (13, 9), goal: (3, 6))
  
  private let mediumMaze16: Maze = Maze(maze: [
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
  ], start: (0, 9), goal: (13, 9))
  
  private let mediumMaze2: Maze = Maze(maze: [
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
  ], start: (0, 0), goal: (0, 0))
}
