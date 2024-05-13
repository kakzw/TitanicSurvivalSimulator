//
//  ContentView.swift
//  TitanicSurvivalSimulator
//
//  Created by Kento Akazawa on 5/1/24.
//

import SwiftUI

struct ContentView: View {
  private let passengerModel = PassengerModel(modelPath: Bundle.main.path(forResource: "ann_model", ofType: "tflite")!)
  private let crewModel = CrewModel()
  
  @State private var person = Person.passenger
  @State private var passengerClass = PassengerClass.one
  @State private var name = ""
  @State private var sex = Sex.f
  @State private var age = 0
  @State private var numOfSiblings = 0
  @State private var numOfParents = 0
  @State private var ticketNum = ""
  @State private var fare = ""
  @State private var cabin = ""
  @State private var port = Port.c
  @State private var boat = ""
  @State private var bodyNum = ""
  @State private var res: Float = 0.0
  @State private var changesMade = false
  @State private var nameEmptyWarning = false
  @State private var showMaze = false
  
  var body: some View {
    NavigationStack {
      VStack {
        PersonTabBarView(selectedTab: $person)
        
        switch person {
          case .passenger:
            PassengerView(passengerClass: $passengerClass,
                          name: $name,
                          sex: $sex,
                          age: $age,
                          numOfSiblings: $numOfSiblings,
                          numOfParents: $numOfParents,
                          ticketNum: $ticketNum,
                          fare: $fare,
                          cabin: $cabin,
                          port: $port,
                          boat: $boat,
                          bodyNum: $bodyNum)
            // if any changes are made to attributes
            // that affect survival chance, repredict
            .onChange(of: passengerClass) { _, _ in
              predict(person: .passenger)
              changesMade = true
            }
            .onChange(of: sex) { _, _ in
              predict(person: .passenger)
              changesMade = true
            }
            .onChange(of: age) { _, _ in
              predict(person: .passenger)
              changesMade = true
            }
            .onChange(of: numOfSiblings) { _, _ in
              predict(person: .passenger)
              changesMade = true
            }
            .onChange(of: numOfParents) { _, _ in
              predict(person: .passenger)
              changesMade = true
            }
            .onChange(of: fare) { _, _ in
              predict(person: .passenger)
              changesMade = true
            }
            .onChange(of: port) { _, _ in
              predict(person: .passenger)
              changesMade = true
            }
            .frame(maxHeight: .infinity)
            
            NoteView()
          case .crew:
            CrewView(name: $name,
                     sex: $sex)
            .onChange(of: sex) { _, _ in
              predict(person: .crew)
              changesMade = true
            }
            .frame(maxHeight: .infinity)
        }
        
        // survival chance text
        Text("Survival Chance: \(String(format: "%.2f%%", res*100))")
          .bold()
          .opacity(changesMade ? 0.8 : 0)
          .onChange(of: person) { _, newVal in
            changesMade = true
            predict(person: newVal)
          }
        
        // button to simulate
        Button {
          if !changesMade { return }
          if name.isEmpty {
            nameEmptyWarning = true
          } else {
            showMaze = true
          }
        } label: {
          Text("Simulate")
            .bold()
            .frame(width: 200, height: 50)
            .foregroundStyle(Color.white)
            .background(.btn)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .opacity((name.isEmpty || !changesMade) ? 0.4 : 1)
      }
      .navigationDestination(isPresented: $showMaze) {
        MazeView(res: res*100, name: name, sex: sex)
      }
      .alert("Name is empty", isPresented: $nameEmptyWarning) {
        Button("OK", role: .cancel) { }
      } message: {
        Text("Name cannot be empty")
      }
      .background(Color(uiColor: .systemGray6))
      .navigationTitle("Persona")
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden()
      .toolbarBackground(.theme, for: .navigationBar)
      .toolbarBackground(.visible, for: .navigationBar)
      // make foreground color of title to white
      .toolbarColorScheme(.dark, for: .navigationBar)
    }
  }
  
  private func predict(person: Person) {
    switch person {
      case .passenger:
        res = passengerModel.predict(passengerClass: passengerClass, sex: sex, age: age, numOfSiblings: numOfSiblings, numOfParents: numOfParents, fare: fare, embarked: port)
      case .crew:
        res = crewModel.predict(sex: sex)
    }
  }
}

// MARK: - PassengerView
struct PassengerView: View {
  @Binding var passengerClass: PassengerClass
  @Binding var name: String
  @Binding var sex: Sex
  @Binding var age: Int
  @Binding var numOfSiblings: Int
  @Binding var numOfParents: Int
  @Binding var ticketNum: String
  @Binding var fare: String
  @Binding var cabin: String
  @Binding var port: Port
  @Binding var boat: String
  @Binding var bodyNum: String
  
  var body: some View {
    List {
      PassengerClassView(passengerClass: $passengerClass)
      
      TextFieldView(title: "Name", text: $name)
      
      SexView(sex: $sex)
      
      NumPickerView(title: "Age*", num: $age, min: 0, max: 100)
      
      NumPickerView(title: "Number of Siblings/Spouses*", num: $numOfSiblings, min: 0, max: 10)
      
      NumPickerView(title: "Number of Parents/Children*", num: $numOfParents, min: 0, max: 10)
      
      TicketNumView(ticketNum: $ticketNum)
      
      FareView(fare: $fare)
      
      TextFieldView(title: "Cabin", text: $cabin)
      
      PortView(port: $port)
      
      TextFieldView(title: "Boat", text: $boat)
      
      BodyNumView(bodyNum: $bodyNum)
    }
  }
}

// MARK: - CrewView
struct CrewView: View {
  @Binding var name: String
  @Binding var sex: Sex
  
  var body: some View {
    List {
      TextFieldView(title: "Name", text: $name)
      
      SexView(sex: $sex)
    }
  }
}

// MARK: - TextFieldView
struct TextFieldView: View {
  var title: String
  @Binding var text: String
  
  var body: some View {
    HStack {
      TextView(text: title)
      
      TextField(title, text: $text)
        .autocorrectionDisabled()
        .textInputAutocapitalization(.never)
        .multilineTextAlignment(.trailing)
    }
  }
}

// MARK: - PassengerClassView
struct PassengerClassView: View {
  @Binding var passengerClass: PassengerClass
  
  var body: some View {
    HStack {
      TextView(text: "Passenger Class*")
      Spacer()
      
      Picker("Passenger Class", selection: $passengerClass) {
        ForEach(PassengerClass.allCases) { ele in
          Text("\(ele.rawValue)")
            .tag(ele)
        }
      }
      .pickerStyle(.segmented)
      .frame(width: 200)
    }
  }
}

// MARK: - SexView
struct SexView: View {
  @Binding var sex: Sex
  
  var body: some View {
    HStack {
      TextView(text: "Sex*")
      Spacer()
      
      Picker("Sex", selection: $sex) {
        ForEach(Sex.allCases) { ele in
          Text("\(ele.rawValue)")
            .tag(ele)
        }
      }
      .pickerStyle(.segmented)
      .frame(width: 200)
    }
  }
}

// MARK: - NumPickerView
struct NumPickerView: View {
  var title: String
  @Binding var num: Int
  var min: Int
  var max: Int
  
  var body: some View {
    HStack {
      TextView(text: title)
      Spacer()
      
      Picker("", selection: $num) {
        ForEach(min...max, id: \.self) { num in
          Text("\(num)")
        }
      }
    }
  }
}

// MARK: - TicketNumView
struct TicketNumView: View {
  @Binding var ticketNum: String
  
  var body: some View {
    HStack {
      TextView(text: "Ticket Number")
      
      TextField("Ticket Number", text: $ticketNum)
        .multilineTextAlignment(.trailing)
        .autocorrectionDisabled()
        .textInputAutocapitalization(.never)
        .onChange(of: ticketNum) { _, newVal in
          let num = newVal.filter { "0123456789".contains($0) }
          ticketNum = num
        }
    }
  }
}

// MARK: - FareView
struct FareView: View {
  @Binding var fare: String
  
  var body: some View {
    HStack {
      TextView(text: "Fare*")
      
      TextField("Fare", text: $fare)
        .multilineTextAlignment(.trailing)
        .autocorrectionDisabled()
        .textInputAutocapitalization(.never)
        .onChange(of: fare) { oldVal, newVal in
          if newVal.isEmpty { return }
          // make sure entered value can be converted to double
          if Double(newVal) == nil {
            fare = oldVal
          }
        }
    }
  }
}

// MARK: - PortView
struct PortView: View {
  @Binding var port: Port
  
  var body: some View {
    HStack {
      TextView(text: "Port of Embarkation*")
      Spacer()
      
      Picker("", selection: $port) {
        ForEach(Port.allCases) { ele in
          Text("\(ele.rawValue)")
            .tag(ele)
        }
      }
    }
  }
}

// MARK: - BodyNumView
struct BodyNumView: View {
  @Binding var bodyNum: String
  
  var body: some View {
    HStack {
      TextView(text: "Body Number")
      
      TextField("Body Number", text: $bodyNum)
        .multilineTextAlignment(.trailing)
        .keyboardType(.numberPad)
        .onChange(of: bodyNum) { _, newVal in
          let num = newVal.filter { "0123456789".contains($0) }
          bodyNum = num
        }
    }
  }
}

// MARK: - TextView
struct TextView: View {
  var text: String
  
  var body: some View {
    Text(text)
      .font(.subheadline)
      .bold()
      .opacity(0.7)
  }
}

// MARK: - PersonTabBarView
struct PersonTabBarView: View {
  @Binding var selectedTab: Person
  
  var body: some View {
    VStack {
      HStack {
        Picker(selection: $selectedTab) {
          ForEach(Person.allCases, id: \.self) { person in
            Text(person.rawValue)
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

// MARK: - NoteView
struct NoteView: View {
  
  var body: some View {
    HStack {
      Text("Attributes marked with * affect survival chance.")
        .font(.footnote)
        .foregroundColor(.gray)
      Spacer()
    }
    .padding(.horizontal)
    .padding(.horizontal)
  }
}

#Preview {
  ContentView()
}
