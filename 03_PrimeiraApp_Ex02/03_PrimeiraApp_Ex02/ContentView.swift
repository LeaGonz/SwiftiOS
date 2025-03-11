//
//  ContentView.swift
//  03_PrimeiraApp_Ex02
//
//  Created by MultiLab PRT 14 on 10/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        
        ZStack {
            Color
                .green
                .ignoresSafeArea()
            
            VStack {
                    
                    Text("Home: 0")
                    .font(.title)
                    
                
                Spacer()
                
                Image("football")
                    .resizable()
                
                Spacer()

                Text("Away: 0")
                    .font(.title)
                    
            }
        }
    }
}

#Preview {
    ContentView()
}
