//
//  ContentView.swift
//  04_Layout_Ex02
//
//  Created by MultiLab PRT 14 on 10/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("MyStore")
                .font(.largeTitle)
                .bold()
            
            VStack{
                HStack{
                    Image("7up")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image("cocacola")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                HStack{
                    Image("fanta")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image("icetea")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .background(
                Rectangle()
                    .foregroundStyle(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 15)
            )
            .padding()
            
            Text("Developed by Luis")
                .bold()
        }
    }
}

#Preview {
    ContentView()
}
