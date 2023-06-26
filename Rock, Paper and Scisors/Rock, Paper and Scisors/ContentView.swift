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
    
    @State private var possibleMovements = "✊"
//    @State private var finalResultOfPlayer: PossibleResults = .win
//    @State private var finalResultOfMachine: PossibleResults = .lose
    @State private var nameOfPlayer = ""
    
    var movements = ["✊", "🖐️", "✌️"]
    
    var possibleResult: PossibleResults {
        var result: PossibleResults = .win
        
        // chance to tie
        if possibleMovements == "✊" && possibleMovements == "✊" {
            result = .tie
        } else if possibleMovements == "🖐️" && possibleMovements == "🖐️" {
            result = .tie
        } else if possibleMovements == "✌️" && possibleMovements == "✌️" {
            result = .tie
        }
        
        // chance to win
        
        if possibleMovements == "✊" && possibleMovements == "✌️" {
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
    case win, lose, tie
}

enum PossibleMoviments: String, CaseIterable {
    case rock = "✊"
    case paper = "🖐️"
    case scissor = "✌️"
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
