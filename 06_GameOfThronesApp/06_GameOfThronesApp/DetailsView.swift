//
//  DetailsView.swift
//  06_GameOfThronesApp
//
//  Created by MultiLab PRT 14 on 11/03/2025.
//

import SwiftUI

struct DetailsView: View {
    var body: some View {
        ZStack {
            //Backimg
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            VStack {
                Image(.jon)
                    .resizable()
                    .scaledToFit()
                    .padding(20)
            }
        }
    }
}

#Preview {
    DetailsView()
}
