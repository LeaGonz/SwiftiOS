//
//  ContentView.swift
//  03_PrimeiraApp_Ex01
//
//  Created by MultiLab PRT 14 on 10/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            Color
                .blue
                .opacity(0.2)
                .ignoresSafeArea()
            
            VStack{
                Image("braga")
                    .resizable()
                    .frame(width: 350, height: 500)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(30)
                    .padding(10)
                
                Text("Braga, Portugal")
                    .font(.title)
                    .foregroundColor(.black.opacity(0.6))
            }
        }
    }
}

#Preview {
    ContentView()
}

