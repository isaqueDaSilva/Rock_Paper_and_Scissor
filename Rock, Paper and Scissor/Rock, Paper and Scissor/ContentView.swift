//
//  ContentView.swift
//  Rock, Paper and Scissor
//
//  Created by Isaque da Silva on 26/06/23.
//

import SwiftUI

struct ContentView: View {
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
