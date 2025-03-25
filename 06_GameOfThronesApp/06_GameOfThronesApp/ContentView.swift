//
//  ContentView.swift
//  06_GameOfThronesApp
//
//  Created by MultiLab PRT 14 on 11/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var imgClicked = false
    
    var body: some View {
        ZStack {
            //Backimg
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            VStack {
                // character
                Button {
                    //print("test")
                    //imgClicked.toggle()
                    imgClicked = true
                } label: {
                    Image("jon")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .cornerRadius(400)
                }

                // name
                Text("Jon Snow")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .shadow(radius: 50)

                // description
                Text(
                    "Jon Snow, born Aegon Targaryen, is the son of Lyanna Stark and Rhaegar Targaryen, the late Prince of Dragonstone. From infancy, Jon is presented as the bastard son of Lord Eddard Stark, Lyanna's brother, and raised alongside Eddard's lawful children at Winterfell. Jon's true parentage is kept secret from everyone, including Jon himself, in order to protect him from those that sought the complete annihilation of House Targaryen."
                )
                .font(.title3)
                .foregroundStyle(.white)
                .shadow(radius: 10)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            }
            .padding()
        }
        .sheet(isPresented: $imgClicked){
            DetailsView()
        }
    }
}

#Preview {
    ContentView()
}
