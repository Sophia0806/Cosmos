//
//  CUDOS_Button.swift
//  Cosmos
//
//  Created by 😏 😏 on 16/11/2022.
//

import SwiftUI

struct CUDOS_Button: View {
    var body: some View {
        ZStack{
        VStack{
            Image("CUDOS")
                .resizable()
                .clipShape(Circle())
                .shadow(radius: 7)
                .frame(width: 80.0, height: 80.0)
            
        Text("Depression     ")
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding()
            
        }
    }
    }
}
