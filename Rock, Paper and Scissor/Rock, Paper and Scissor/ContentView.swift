//
//  ContentView.swift
//  Rock, Paper and Scissor
//
//  Created by Isaque da Silva on 26/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var possibleMovementsOfPlayer: Movements = .paper
    @State private var possibleMovimentsOfMachine: Movements = .rock
    
    var result: Results {
        var result: Results = .win
        
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
        
        // chance of machine win
        
        // chance of machine lose
        
        return result
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

enum Movements: String, CaseIterable {
    case rock = "Rock"
    case paper = "Paper"
    case scissor = "Scissor"
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
