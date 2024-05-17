//
//  itemDisplay.swift
//  Cosmos
//
//  Created by 😏 😏 on 22/2/2023.
//

import SwiftUI

struct itemDisplay: View {
    
    var imageName: String
    var selected : String
    var body: some View {
        VStack{
            if(imageName == selected){
                Image(imageName)
                    .resizable()
                    .clipShape(Circle())
                    .shadow(radius: 30)
                    .frame(width: 95.0, height: 95.0)
            }
            else{
                Image(imageName)
                    .resizable()
                    .clipShape(Circle())
                    .shadow(radius: 7)
                    .frame(width: 80.0, height: 80.0)
            }
            
        }
    }
}

