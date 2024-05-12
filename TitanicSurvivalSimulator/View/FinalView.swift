//
//  FinalView.swift
//  TitanicSurvivalSimulator
//
//  Created by Kento Akazawa on 5/11/24.
//

import SwiftUI

struct FinalView: View {
  // variables that must be passed in
  var timeRemaining: Int
  var name: String
  var sex: Sex
  var maze: Maze
  
  @State private var selectedTab = Result.result
  @State private var showInitialScreen = false
  
  var body: some View {
    VStack {
      ResultTabBarView(selectedTab: $selectedTab)
      
      Spacer(minLength: 10)
      
      switch selectedTab {
        case .result:
          ResultView(timeRemaining: timeRemaining, name: name, sex: sex)
        case .maze:
          FullMazeView(maze: maze)
      }
      
      Spacer()
      
      Button{
        showInitialScreen = true
      } label: {
        Text("Simulate Again")
          .frame(width: 280, height: 50)
          .background(.btn)
          .foregroundStyle(Color.white)
          .bold()
          .clipShape(RoundedRectangle(cornerRadius: 12))
      }
      .padding()
    }
    .navigationDestination(isPresented: $showInitialScreen, destination: {
      ContentView()
    })
    .navigationTitle("Result")
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarBackButtonHidden()
    .toolbarBackground(.theme, for: .navigationBar)
    .toolbarBackground(.visible, for: .navigationBar)
    // make foreground color of title to white
    .toolbarColorScheme(.dark, for: .navigationBar)
  }
}

// MARK: - ResultView
struct ResultView: View {
  // variables that must be passed in
  var timeRemaining: Int
  var name: String
  var sex: Sex
  
  private let imageWidth: CGFloat = 300
  private let imageCornerRadius: CGFloat = 15
  
  var body: some View {
    VStack {
      if timeRemaining == 0 {
        // when they didn't survive
        Image("not_survived")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: imageWidth)
          .clipShape(RoundedRectangle(cornerRadius: imageCornerRadius))
        Text("\(name) unfortunately does not survive the sinking of the Titanic.")
      } else {
        // based on sex and time remained for the maze
        // display different image and text
        switch sex {
          case .f:
            if timeRemaining < 10 {
              Image("survived_female1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageWidth)
                .clipShape(RoundedRectangle(cornerRadius: imageCornerRadius))
            } else {
              Image("survived_female2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageWidth)
                .clipShape(RoundedRectangle(cornerRadius: imageCornerRadius))
            }
          case .m:
            if timeRemaining < 10 {
              Image("survived_male1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageWidth)
                .clipShape(RoundedRectangle(cornerRadius: imageCornerRadius))
            } else {
              Image("survived_male2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageWidth)
                .clipShape(RoundedRectangle(cornerRadius: imageCornerRadius))
            }
        }
        
        if timeRemaining < 10 {
          Text("\(name) manages to secure a spot in a lifeboat during the chaotic evacuation.")
            .padding(.horizontal)
        } else {
          Text("\(name) boards a lifeboat early on and survives the Titanic disaster.")
            .padding(.horizontal)
        }
      }
    }
  }
}

// MARK: - ResultTabBarView
struct ResultTabBarView: View {
  @Binding var selectedTab: Result
  
  var body: some View {
    VStack {
      HStack {
        Picker(selection: $selectedTab) {
          ForEach(Result.allCases, id: \.self) { res in
            Text(res.rawValue)
          }
        } label: {
          EmptyView()
        }
        .pickerStyle(SegmentedPickerStyle())
      }
      .cornerRadius(10)
    }
  }
}
