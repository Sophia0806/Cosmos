//
//  IPS_Button.swift
//  Cosmos
//
//  Created by 😏 😏 on 14/1/2023.
//

import SwiftUI

struct IPS_Button: View {
    var body: some View {
        ZStack{
        VStack{
            Image("IPS")
                .resizable()
                .clipShape(Circle())
                .shadow(radius: 7)
                .frame(width: 80.0, height: 80.0)
            
        Text("Procrastination")
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding()
            
        }
    }
    }
}

