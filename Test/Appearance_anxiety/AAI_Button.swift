//
//  AAI_Button.swift
//  Cosmos
//
//  Created by 😏 😏 on 16/1/2023.
//

import SwiftUI

struct AAI_Button: View {
    var body: some View {
        ZStack{
        VStack{
            Image("AAI")
                .resizable()
                .clipShape(Circle())
                .shadow(radius: 7)
                .frame(width: 80.0, height: 80.0)
            
        Text("Appearance")
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding(.bottom, -80)
            .padding()
            
        Text("Anxiety")
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding(.top, -20)
            .padding()
            
            
        }
    }
    }
}
