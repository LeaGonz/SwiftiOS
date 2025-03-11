//
//  ContentView.swift
//  04_Layout_Ex01
//
//  Created by MultiLab PRT 14 on 10/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        //Porto
        VStack(alignment: .leading,spacing: 20){
            
            Image("porto")
                .resizable()
                .aspectRatio(contentMode: .fill)
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
        .padding(40)
        
        //Braga
        VStack(alignment: .leading,spacing: 20){
            
            Image("braga")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(10)
                .padding(1)
                
            
            HStack{
                Text("Braga")
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
                        Image(systemName: "star.fill")
                    }.foregroundStyle(.green)
                    Text("424 reviews").fontWeight(.thin).opacity(0.3)
                }
            }
            Text("Soa a Futuro").fontWeight(.light)
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
        .padding(40)

    }
}

#Preview {
    ContentView()
}
