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
    @State private var round = 1
    @State private var gameIsOn = false
    
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
                        possibleResults()
                        
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
        }.alert("Round \(round) of Rock, Paper and Scissor", isPresented: $gameIsOn) {
            if round < 10 {
                Button("Continue") {
                    if result == .win {
                        playerScore += 1
                        round += 1
                    } else if result == .lose {
                        machineScore += 1
                        round += 1
                    } else if result == .tie {
                        round += 1
                    }
                }
            } else if round == 10 {
                Button("New Game") {
                    if result == .win {
                        playerScore += 1
                    } else if result == .lose {
                        machineScore += 1
                    }
                    
                    playerScore = 0
                    machineScore = 0
                    round = 1
                }
            }
        } message: {
            if round < 10 {
                if result == .win {
                    Text("Congratulations player\nYou were smarter than the machine and scored 1 point 😉")
                } else if result == .lose {
                    Text("Who knows next time 😔\nThe machine was smarter than you and scored 1 point!")
                } else if result == .tie {
                    Text("What a dispute 🤯\nYou showed the same object and tied!")
                }
            } else if round == 10 {
                if playerScore > machineScore {
                    Text("Congratulations, you won this match by \(playerScore) points against just \(machineScore) of the machine 😉")
                } else if playerScore < machineScore {
                    Text("It wasn't this time 😔\nThe machine managed to beat you with \(machineScore) points, against just \(playerScore) points!")
                } else if playerScore == machineScore {
                    Text("What a dispute 🤯\nYou guys are so great that you managed to keep the same final score!")
                }
            }
        }
    }
    
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
