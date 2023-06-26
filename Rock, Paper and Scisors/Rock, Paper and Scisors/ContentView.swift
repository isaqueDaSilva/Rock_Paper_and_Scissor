//
//  ContentView.swift
//  Rock, Paper and Scisors
//
//  Created by Isaque da Silva on 25/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var possibleMovements = ["✊", "🖐️", "✌️"]
    @State private var finalResultOfPlayer: PossibleResults = .win
    @State private var finalResultOfMachine: PossibleResults = .lose
    
    var body: some View {
        ZStack {
            VStack {
                Text("Vs")
                    .frame(maxWidth: .infinity)
                    .font(.title.bold())
                    .foregroundColor(.black)
                    .background(Rectangle())
                    .foregroundColor(.gray)
            }
        }
    }
}

enum PossibleResults: String, CaseIterable {
    case win, lose
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
