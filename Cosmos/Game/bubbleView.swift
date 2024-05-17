//
//  bubbleView.swift
//  Cosmos
//
//  Created by 😏 😏 on 7/2/2023.
//

import SwiftUI

struct bubbleView: View {
    var imageName: String;
    var body: some View {
        VStack{
            if(imageName == "bubble1" || imageName == "bubble1b"){
            Image(imageName)
                .resizable()
                .clipShape(Circle())
                //shadow(radius: 5)
                .frame(width: 60.0, height: 60.0)
            }
            else if(imageName == "bubble2" || imageName == "bubble3"){
                Image(imageName)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 60.0, height: 60.0)
            }
            else{
                Image(imageName)
                    .resizable()
                    .clipShape(Circle())
                    //.shadow(radius: 10)
                    .frame(width: 60.0, height: 60.0)
            }
        }
    }
}
