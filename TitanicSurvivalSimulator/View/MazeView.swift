//
//  MazeView.swift
//  TitanicSurvivalSimulator
//
//  Created by Kento Akazawa on 5/9/24.
//

import SwiftUI

// global variable fro border width
let borderWidth: CGFloat = 1.5

struct MazeView: View {
  // variables that must be passed in
  var res: Float
  var name: String
  var sex: Sex
  
  // private variables
  private let model = MazeModel()
  private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  private let gridRows = 7
  private let gridCols = 5
  private let buttonLength: CGFloat = 60
  @State private var showResult = false
  
  // variables that are initialized in initialization of the object
  private var maze: Maze
  private var totalTime: Int
  private var rows: Int
  private var cols: Int
  private var cellLength: CGFloat
  @State private var dotPosition: (row: Int, col: Int)
  @State private var timeRemaining: Int
  
  // MARK: - Initialization
  
  init(res: Float, name: String, sex: Sex) {
    self.res = res
    self.name = name
    self.sex = sex
    
    // if survival chance is greater than 50%, easy maze
    // if it's less than 50%, medium maze
    switch res {
      case 50...100:
        maze = model.getMaze(difficulty: .easy)
        totalTime = Int((res/2) + 10)
        rows = maze.maze.count
        cols = maze.maze[0].count
      default:
        maze = model.getMaze(difficulty: .medium)
        totalTime = Int((res/2) + 30)
        rows = maze.maze.count
        cols = maze.maze[0].count
    }
    
    timeRemaining = totalTime
    dotPosition = maze.start
    
    let screenRect = UIScreen.main.bounds
    let screenWidth = screenRect.width
    cellLength = (screenWidth - 60) / CGFloat(gridCols)
  }
  
  // MARK: - View
  
  var body: some View {
    ZStack {
      // maze
      VStack(spacing: 0) {
        Spacer(minLength: 120)
        // iterate through rows
        ForEach(0..<gridRows, id: \.self) { rowOffset in
          self.rowView(for: rowOffset)
        }
        Spacer(minLength: 150)
      }
      .onAppear {
        timeRemaining = totalTime
        dotPosition = maze.start
      }
      
      VStack {
        Spacer()
          .frame(height: 30)
        TimerView(timeRemaining: $timeRemaining, totalTime: totalTime)
          .onReceive(timer) { _ in
            if timeRemaining == 0 {
              showResult = true
            } else if !showResult {
              timeRemaining -= 1
            }
          }
        Spacer()
        
        MovementButtonView(maze: maze,
                           buttonLength: buttonLength,
                           endMaze: $showResult,
                           dotPosition: $dotPosition)
      }
    }
    .navigationDestination(isPresented: $showResult) {
      FinalView(timeRemaining: timeRemaining, name: name, sex: sex, maze: maze)
    }
    .navigationTitle("Maze")
    .navigationBarTitleDisplayMode(.inline)
    .toolbarBackground(.orange, for: .navigationBar)
    .toolbarBackground(.visible, for: .navigationBar)
    // make foreground color of title to white
    .toolbarColorScheme(.dark, for: .navigationBar)
  }
  
  // each row of the maze
  private func rowView(for rowOffset: Int) -> some View {
    HStack(spacing: 0) {
      ForEach(0..<gridCols, id: \.self) { colOffset in
        self.cellView(rowOffset: rowOffset, colOffset: colOffset)
      }
    }
  }
  
  // view for each cell
  private func cellView(rowOffset: Int, colOffset: Int) -> some View {
    let row = dotPosition.row - (gridRows / 2) + rowOffset
    let col = dotPosition.col - (gridCols / 2) + colOffset
    
    if row >= 0 && row < maze.maze.count && col >= 0 && col < maze.maze[row].count {
      let cell = maze.maze[row][col]
      return AnyView(
        CellView(maze: maze,
                 cell: cell,
                 row: row,
                 col: col,
                 cols: maze.maze[row].count,
                 cellLength: cellLength,
                 dotPosition: $dotPosition,
                 timeRemaining: $timeRemaining,
                 totalTime: totalTime)
          .frame(width: cellLength, height: cellLength)
      )
    } else {
      // empty cell if outside maze bounds
      return AnyView(
        Rectangle().fill(Color.clear).frame(width: cellLength, height: cellLength)
      )
    }
  }
}

// MARK: - FullMazeView
struct FullMazeView: View {
  var maze: Maze
  
  @State private var timeRemaining = 8
  
  private var rows: Int
  private var cols: Int
  private var cellLength: CGFloat
  @State private var dotPosition: (row: Int, col: Int)
  
  // MARK: - Initialization
  
  init(maze: Maze) {
    self.maze = maze
    dotPosition = maze.start
    rows = maze.maze.count
    cols = maze.maze[0].count
    let screenRect = UIScreen.main.bounds
    let screenWidth = screenRect.width
    cellLength = (screenWidth - 60) / CGFloat(cols)
  }
  
  // MARK: - View
  
  var body: some View {
    VStack(spacing: 0) {
      // iterate through rows
      ForEach(0..<rows, id: \.self) { row in
        HStack(spacing: 0) {
          // iterate through columns
          ForEach(0..<cols, id: \.self) { col in
            let cell = maze.maze[row][col]
            
            CellView(maze: maze,
                     cell: cell,
                     row: row,
                     col: col,
                     cols: cols,
                     cellLength: cellLength,
                     dotPosition: $dotPosition,
                     timeRemaining: $timeRemaining,
                     totalTime: 10)
          }
        }
      }
    }
  }
}

// MARK: - CellView
struct CellView: View {
  var maze: Maze
  var cell: MazeCell
  var row: Int
  var col: Int
  var cols: Int
  var cellLength: CGFloat
  @Binding var dotPosition: (row: Int, col: Int)
  @Binding var timeRemaining: Int
  var totalTime: Int
  
  @State private var opacity = 0.0
  
  var body: some View {
    VStack(spacing: 0) {
      // top border
      if cell.hasBorder(.top) && row == 0 {
        Rectangle()
          .fill(Color.black)
          .frame(width: cellLength, height: borderWidth)
          .padding(.bottom, -borderWidth)
      }
      HStack(spacing: 0) {
        // left border
        if cell.hasBorder(.left) && col == 0 {
          Rectangle()
            .fill(Color.black)
            .frame(width: borderWidth, height: cellLength)
            .padding(.trailing, -borderWidth)
        }
        Rectangle()
          .frame(width: cellLength, height: cellLength)
          .foregroundStyle(Color(uiColor: .black).opacity(1.05 - Double(timeRemaining)/Double((totalTime))))
          .overlay {
            // person (if it's in this cell)
            if (row == dotPosition.row && col == dotPosition.col) {
              Image(systemName: "figure.run")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(Color.green)
                .frame(width: cellLength*0.6)
            } else if (row == maze.goal.row && col == maze.goal.col) {
              // display sailboat at goal
              Image(systemName: "sailboat.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(Color.cyan)
                .frame(width: cellLength*0.6)
            }
          }
        // right border
        if cell.hasBorder(.right) {
          Rectangle()
            .fill(Color.black)
            .frame(width: borderWidth, height: cellLength)
            .padding(.leading, -borderWidth)
        }
      }
      // bottom border
      if cell.hasBorder(.bottom) {
        Rectangle()
          .fill(Color.black)
          .frame(width: cellLength, height: borderWidth)
          .padding(.top, -borderWidth)
      }
    }
  }
}

// MARK: - MovementButtonView
struct MovementButtonView: View {
  var maze: Maze
  var buttonLength: CGFloat
  @Binding var endMaze: Bool
  @Binding var dotPosition: (row: Int, col: Int)
  
  var body: some View {
    VStack {
      // button to move up
      Button(action: moveUp, label: {
        Rectangle()
          .frame(width: buttonLength, height: buttonLength)
          .foregroundStyle(Color(uiColor: .orange).opacity(canMoveUp() ? 1 : 0.4))
          .overlay {
            Image(systemName: "arrowshape.up.fill")
              .resizable()
              .frame(width: 30, height: 30)
              .foregroundStyle(Color.white)
          }
          .clipShape(RoundedRectangle(cornerRadius: 4))
      })
      // button to move left
      HStack {
        Spacer()
        Button(action: moveLeft, label: {
          Rectangle()
            .frame(width: buttonLength, height: buttonLength)
            .foregroundStyle(Color(uiColor: .orange).opacity(canMoveLeft() ? 1 : 0.4))
            .overlay {
              Image(systemName: "arrowshape.left.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(Color.white)
            }
            .clipShape(RoundedRectangle(cornerRadius: 4))
        })
        // button to move down
        Button(action: moveDown, label: {
          Rectangle()
            .frame(width: buttonLength, height: buttonLength)
            .foregroundStyle(Color(uiColor: .orange).opacity(canMoveDown() ? 1 : 0.4))
            .overlay {
              Image(systemName: "arrowshape.down.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(Color.white)
            }
            .clipShape(RoundedRectangle(cornerRadius: 4))
        })
        // button to move right
        Button(action: moveRight, label: {
          Rectangle()
            .frame(width: buttonLength, height: buttonLength)
            .foregroundStyle(Color(uiColor: .orange).opacity(canMoveRight() ? 1 : 0.4))
            .overlay {
              Image(systemName: "arrowshape.right.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(Color.white)
            }
            .clipShape(RoundedRectangle(cornerRadius: 4))
        })
        .disabled(!canMoveRight())
        Spacer()
      }
    }
  }
}

// functions for movement buttons
extension MovementButtonView {
  private func canMoveUp() -> Bool {
    return !maze.maze[dotPosition.row][dotPosition.col].hasBorder(.top)
  }
  
  private func canMoveDown() -> Bool {
    return !maze.maze[dotPosition.row][dotPosition.col].hasBorder(.bottom)
  }
  
  private func canMoveLeft() -> Bool {
    return !maze.maze[dotPosition.row][dotPosition.col].hasBorder(.left)
  }
  
  private func canMoveRight() -> Bool {
    return !maze.maze[dotPosition.row][dotPosition.col].hasBorder(.right)
  }
  
  private func moveUp() {
    if canMoveUp() {
      dotPosition.row = dotPosition.row - 1
      endMaze = mazeCompleted(row: dotPosition.row, col: dotPosition.col)
    }
  }
  
  private func moveDown() {
    if canMoveDown() {
      dotPosition.row = dotPosition.row + 1
      endMaze = mazeCompleted(row: dotPosition.row, col: dotPosition.col)
    }
  }
  
  private func moveLeft() {
    if canMoveLeft() {
      dotPosition.col = dotPosition.col - 1
      endMaze = mazeCompleted(row: dotPosition.row, col: dotPosition.col)
    }
  }
  
  private func moveRight() {
    if canMoveRight() {
      dotPosition.col = dotPosition.col + 1
      endMaze = mazeCompleted(row: dotPosition.row, col: dotPosition.col)
    }
  }
  
  private func mazeCompleted(row: Int, col: Int) -> Bool {
    return dotPosition == maze.goal
  }
}

// MARK: - TimerView
struct TimerView: View {
  @Binding var timeRemaining: Int
  var totalTime: Int
  
  var body: some View {
    ProgressView(value: Double(timeRemaining), total: Double(totalTime)) {
      Text("Time Remaining: \(timeRemaining)s")
    }
    .tint(.pink)
    .padding(.horizontal)
  }
}

#Preview {
  MazeView(res: 20, name: "Name", sex: .f)
}
