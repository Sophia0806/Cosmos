//
//  ED15_Button.swift
//  Cosmos
//
//  Created by 😏 😏 on 16/1/2023.
//

import SwiftUI

struct ED15_Button: View {
    var body: some View {
        ZStack{
        VStack{
            Image("ED15")
                .resizable()
                .clipShape(Circle())
                .shadow(radius: 7)
                .frame(width: 80.0, height: 80.0)
            
        Text("Eating disorder")
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding()
            
        }
    }
    }
}
