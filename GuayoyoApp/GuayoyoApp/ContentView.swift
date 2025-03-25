//
//  ContentView.swift
//  GuayoyoApp
//
//  Created by MultiLab PRT 14 on 18/03/2025.
//

import SwiftUI

struct ContentView: View {
    let listFofoqueiros = GuayoyoList().allFofoqueiros
    
    var body: some View {
        NavigationStack {
            List(listFofoqueiros){ fofoqueiro in
                NavigationLink{
                    GuayoyoDetails(fofoqueiro: fofoqueiro)
                } label : {
                    HStack{
                        Image(fofoqueiro.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1)
                        Text(fofoqueiro.name)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Guayoyos")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
