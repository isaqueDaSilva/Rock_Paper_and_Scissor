//
//  ContentView.swift
//  Rock, Paper and Scisors
//
//  Created by Isaque da Silva on 25/06/23.
//

import SwiftUI

struct GameSection: View {
    
    var body: some View {
        VStack{
            
        }
    }
}

struct ContentView: View {
    
    @State private var possibleMovementsOfPlayer: Moviments = .paper
    @State private var possibleMovementsOfMachine: Moviments = .rock
//    @State private var finalResultOfPlayer: PossibleResults = .win
//    @State private var finalResultOfMachine: PossibleResults = .lose
    @State private var nameOfPlayer = ""
    
    var possibleResult: PossibleResults {
        var result: PossibleResults = .win
        
        // chance to tie
        if possibleMovementsOfPlayer == .rock && possibleMovementsOfMachine == .rock {
            result = .tie
        } else if possibleMovementsOfPlayer == .paper && possibleMovementsOfMachine == .paper {
            result = .tie
        } else if possibleMovementsOfPlayer == .scissor && possibleMovementsOfMachine == .scissor {
            result = .tie
        }
        
        // chance to player win
        if possibleMovementsOfPlayer == .rock && possibleMovementsOfMachine == .scissor {
            result = .win
        } else if possibleMovementsOfPlayer == .paper && possibleMovementsOfMachine == .rock {
            result = .win
        } else if possibleMovementsOfPlayer == .scissor && possibleMovementsOfMachine == .paper {
            result = .win
        }
        
        // chance to machine win
        if possibleMovementsOfMachine == .rock && possibleMovementsOfPlayer == .scissor {
            result = .win
        } else if possibleMovementsOfMachine == .paper && possibleMovementsOfPlayer == .rock {
            result = .win
        } else if possibleMovementsOfMachine == .scissor && possibleMovementsOfPlayer == .paper {
            result = .win
        }
        
        return result
    }
    
    var body: some View {
        ZStack {
            VStack {
                Text("")
                Text("Vs")
                    .frame(maxWidth: .infinity)
                    .font(.title.bold())
                    .foregroundColor(.black)
                    .background(Rectangle())
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.thinMaterial)
            .cornerRadius(20)
            .shadow(radius: 10)
        }
    }
}

enum PossibleResults: String, CaseIterable {
    case win = "Win"
    case lose = "Lose"
    case tie = "Tie"
}

enum Moviments: String, CaseIterable {
    case rock = "✊"
    case paper = "🖐️"
    case scissor = "✌️"
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
