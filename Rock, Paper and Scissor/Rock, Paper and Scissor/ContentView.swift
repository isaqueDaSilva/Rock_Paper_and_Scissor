//
//  ContentView.swift
//  Rock, Paper and Scissor
//
//  Created by Isaque da Silva on 26/06/23.
//

import SwiftUI

struct ViewOfPlayers: View {
    var viewOfPlayer: String
    
    var body: some View{
        VStack {
            Text(viewOfPlayer)
                .frame(width: 200, height: 200)
                .font(.system(size: 150))
                .background(Rectangle())
                .cornerRadius(20)
                .shadow(radius: 15)
                .foregroundColor(.gray)
        }
    }
}

struct ContentView: View {
    @State private var possibleMovementsOfPlayer: Movements = .paper
    @State private var possibleMovimentsOfMachine: Movements = .rock
    @State private var result: Results = .win
    @State private var playerScore = 0
    @State private var machineScore = 0
    @State private var gameIsOn = false
    
    func possibleResults() {
        // chance of tie
        if possibleMovementsOfPlayer == .rock && possibleMovimentsOfMachine == .rock {
            result = .tie
        } else if possibleMovementsOfPlayer == .paper && possibleMovimentsOfMachine == .paper {
            result = .tie
        } else if possibleMovementsOfPlayer == .scissor && possibleMovimentsOfMachine == .scissor {
            result = .tie
        }
        
        // chance of player win
        if possibleMovementsOfPlayer == .rock && possibleMovimentsOfMachine == .scissor {
            result = .win
        } else if possibleMovementsOfPlayer == .paper && possibleMovimentsOfMachine == .rock {
            result = .win
        } else if possibleMovementsOfPlayer == .scissor && possibleMovimentsOfMachine == .paper {
            result = .win
        }
        
        // chance of player lose
        if possibleMovementsOfPlayer == .rock && possibleMovimentsOfMachine == .paper {
            result = .lose
        } else if possibleMovementsOfPlayer == .paper && possibleMovimentsOfMachine == .scissor {
            result = .lose
        } else if possibleMovementsOfPlayer == .scissor && possibleMovimentsOfMachine == .rock {
            result = .lose
        }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(stops: [
                Gradient.Stop(color: .white, location: 0.35),
                Gradient.Stop(color: .cyan, location: 0.65)
            ], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                Spacer()
                HStack{
                    Text("Player Score: \(playerScore)")
                        .font(.title3.bold())
                    Spacer()
                    Text("Machine Score: \(machineScore)")
                        .font(.title3.bold())
                }
                .padding()
                Spacer()
                
                VStack{
                    ViewOfPlayers(viewOfPlayer: possibleMovimentsOfMachine.rawValue)
                }
                Spacer()
                
                Text("VS")
                    .font(.title.bold())
                    .foregroundColor(.black)
                Spacer()
                
                VStack {
                    ViewOfPlayers(viewOfPlayer: possibleMovementsOfPlayer.rawValue)
                    Picker("Select your Moviment", selection: $possibleMovementsOfPlayer) {
                        ForEach(Movements.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    Button("Start", action: {
                        gameIsOn = true
                        possibleMovimentsOfMachine = Movements.allCases.randomElement() ?? .rock
                    })
                    .frame(width: 60, height: 35)
                    .foregroundColor(.white)
                    .bold()
                    .background(Rectangle())
                    .foregroundColor(.blue)
                    .cornerRadius(10)
                }
                Spacer()
            }
        }.alert("Rock, Paper and Scissor", isPresented: $gameIsOn) {
            Button("Continue") {
                if result == .win {
                    playerScore += 1
                } else if result == .lose {
                    machineScore += 1
                }
            }
        } message: {
            Text(result.rawValue)
        }
    }
}

enum Movements: String, CaseIterable {
    case rock = "✊"
    case paper = "🖐️"
    case scissor = "✌️"
}

enum Results: String, CaseIterable {
    case win = "Win"
    case lose = "Lose"
    case tie = "Tie"
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
