//
//  PBCharacterDetail.swift
//  07_PeakyBlindersAPP
//
//  Created by MultiLab PRT 14 on 18/03/2025.
//

import SwiftUI

struct PBCharacterDetail: View {
    
    let character: PBCharacter
    var body: some View {
        VStack{
            ZStack{
                Image(character.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height:400)
                    .offset(y:50)
                    .clipped()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
            }
            .padding()
            Text(character.name)
                .font(.title3)
                .fontWeight(.bold)
            Text(character.description)
                .padding()
                .multilineTextAlignment(.center)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    PBCharacterDetail(character: PBCharactersList().allCharacters[3])
}
