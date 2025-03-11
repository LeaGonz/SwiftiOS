//
//  ContentView.swift
//  05_WarCardGame
//
//  Created by MultiLab PRT 14 on 11/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "back"
    @State var cpuCard = "back"
    @State var background = "background-plain"

    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    func buttonDealClicked(){
        var backRandom = ["background-plain", "background-plain","background-wood-cartoon", "background-wood-grain"]
        background = backRandom[Int.random(in: 0...3)]

        // print("Clicked")
        var player = Int.random(in: 2...14)
        var cpu = Int.random(in: 2...14)
        
        playerCard = "card" + String(player)
        cpuCard = "card" + String(cpu)
        
        if player > cpu {
            playerScore += 1
        } else if player < cpu {
            cpuScore += 1
        }
    }
    
    var body: some View {
        ZStack{
            // background
            Image(background)
                .resizable()
                .ignoresSafeArea()
            //content
            VStack{
                Spacer()
                //logo
                Image("logo")
                //cards
                Spacer()
                HStack{
                    Spacer()
                    //card1
                    Image(playerCard)
                    Spacer()
                    //card2
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                //button deal
                Button{
                    buttonDealClicked()
                } label: {
                    Image("button")
                }
                .shadow(radius: 10)
                Spacer()
                //score
                HStack{
                    Spacer()
                    //player
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    // cpu
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundStyle(.white)
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
