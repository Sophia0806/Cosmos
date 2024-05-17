//
//  CAS_Button.swift
//  Cosmos
//
//  Created by 😏 😏 on 12/1/2023.
//

import SwiftUI

struct CAS_Button: View {
    var body: some View {
        ZStack{
        VStack{
            Image("CAS")
                .resizable()
                .clipShape(Circle())
                .shadow(radius: 7)
                .frame(width: 80.0, height: 80.0)
            
        Text("Anger          ")
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding()
            
        }
    }
    }
}
