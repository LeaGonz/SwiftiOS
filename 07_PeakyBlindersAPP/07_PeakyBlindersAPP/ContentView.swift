//
//  ContentView.swift
//  07_PeakyBlindersAPP
//
//  Created by MultiLab PRT 14 on 17/03/2025.
//

import SwiftUI

struct ContentView: View {
    let listCharacters = PBCharactersList().allCharacters

    var body: some View {
        NavigationStack {
            List(listCharacters) { character in
                NavigationLink {
                    PBCharacterDetail(character: character)
                } label: {
                    HStack {
                        Image(character.image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1)
                        Text(character.name)
                            .fontWeight(.bold)
                    }
                }
            }
            .navigationTitle("Peaky Blinders")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
