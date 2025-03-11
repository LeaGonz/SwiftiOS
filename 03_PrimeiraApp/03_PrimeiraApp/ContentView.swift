//
//  ContentView.swift
//  03_PrimeiraApp
//
//  Created by MultiLab PRT 14 on 10/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //Text("test")

            
            VStack(alignment: .leading,spacing: 20){
                
                Image("porto")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding(1)
                
                HStack{
                    Text("Porto")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.black)
                    
                    Spacer()

                    VStack{
                        HStack{
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.leadinghalf.filled")
                        }.foregroundStyle(.green)
                        Text("423 reviews").fontWeight(.thin).opacity(0.3)
                    }
                }
                Text("Should be the capital of Portugal.").fontWeight(.light)
                    .font(.headline)
                    .foregroundColor(Color.black)
            }
            .padding()
            .background(
                Rectangle()
                    .foregroundStyle(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 15)
            )
            .padding()
        }
    }

#Preview {
    ContentView()
}
