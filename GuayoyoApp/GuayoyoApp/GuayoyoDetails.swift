//
//  GuayoyoDetails.swift
//  GuayoyoApp
//
//  Created by MultiLab PRT 14 on 18/03/2025.
//

import SwiftUI

struct GuayoyoDetails: View {
    let fofoqueiro: Guayoyos
    
    var body: some View {
        VStack{
            ZStack{
                Image(fofoqueiro.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 400)
                    //.offset(y: 10)
                    .clipped()
                    .clipShape(.circle)
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
            }
            .padding()
            Text(fofoqueiro.name)
                .font(.title)
            Text(fofoqueiro.description)
                .padding()
                .multilineTextAlignment(.center)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    GuayoyoDetails(fofoqueiro: GuayoyoList().allFofoqueiros[0])
}
