//
//  ContentView.swift
//  05_WarCardGame_Ex02
//
//  Created by MultiLab PRT 14 on 11/03/2025.
//

import SwiftUI

struct ContentView: View {

    @State var colorCard = "0"
    @State var background = "background-plain"
    
    @State var score = 0
    @State var certo = 0
    @State var erro = 0

    func btnRandomCards(color: String) {
        let backRandom = [
            "background-plain", "background-plain", "background-wood-cartoon",
            "background-wood-grain",
        ]
        background = backRandom[Int.random(in: 0...3)]
        
        colorCard = String(Int.random(in: 1...2))
        
        print(color)
        print(colorCard+"\n")
        
        if color == colorCard {
            certo += 1
            score += 1
        } else {
            erro += 1
            score = 0
        }
    }

    var body: some View {
        ZStack {
            // background
            Image(background)
                .resizable()
                .ignoresSafeArea()
            //content
            VStack {
                Spacer()
                //logo
                Image("logo")
                //cards
                Spacer()
                HStack {
                    Spacer()
                    //card1
                    Image(colorCard)
                    Spacer()
                }

                Spacer()

                HStack {
                    Spacer()

                    //button red
                    Button {
                        btnRandomCards(color: "1")
                    } label: {
                        Text("_______\n").foregroundStyle(.red)
                    }
                    .background(.red)
                    .cornerRadius(10)

                    //button black
                    Button {
                        btnRandomCards(color: "2")
                    } label: {
                        Text("_______\n").foregroundStyle(.black)
                    }
                    .background(.black)
                    .cornerRadius(10)

                    Spacer()
                }
                Spacer()

                HStack{
                    Text("Fixe: " + String(certo))
                        .font(.headline)
                        .padding(.bottom, 10)
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    
                    Text("Burro: " + String(erro))
                        .font(.headline)
                        .padding(.bottom, 10)
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
                Text("Best Score: " + String(score))
                    .font(.headline)
                    .padding(.bottom, 10)
                    .font(.largeTitle)
                    .foregroundStyle(.yellow)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
