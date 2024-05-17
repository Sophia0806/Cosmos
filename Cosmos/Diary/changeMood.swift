//
//  changeMood.swift
//  Cosmos
//
//  Created by 😏 😏 on 22/2/2023.
//

import SwiftUI

struct changeMood: View {
    @Binding var selectedMood : String
    var body: some View {
        ZStack{
            
            Image("diary_bg")
                 .resizable()
                 .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "excited", selected: selectedMood)
                    }
                    .onTapGesture {
                        selectedMood = "excited"
                    }
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "happy", selected: selectedMood)
                    }
                    .onTapGesture {
                        selectedMood = "happy"
                    }
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "heartbeat", selected: selectedMood)
                    }
                    .onTapGesture {
                        selectedMood = "heartbeat"
                    }
                    Spacer()
                }
                .frame(width: 400, height: 100)
                .padding()
                HStack{
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "relaxed", selected: selectedMood)
                    }
                    .onTapGesture {
                        selectedMood = "relaxed"
                    }
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "normal", selected: selectedMood)
                    }
                    .onTapGesture {
                        selectedMood = "normal"
                    }
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "shocked", selected: selectedMood)
                    }
                    .onTapGesture {
                        selectedMood = "shocked"
                    }
                    Spacer()
                }
                .frame(width: 400, height: 100)
                .padding()
                HStack{
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "worried", selected: selectedMood)
                    }
                    .onTapGesture {
                        selectedMood = "worried"
                    }
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "tired", selected: selectedMood)
                    }
                    .onTapGesture {
                        selectedMood = "tired"
                    }
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "ill", selected: selectedMood)
                    }
                    .onTapGesture {
                        selectedMood = "ill"
                    }
                    Spacer()
                }
                .frame(width: 400, height: 100)
                .padding()
                HStack{
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "angry", selected: selectedMood)
                    }
                    .onTapGesture {
                        selectedMood = "angry"
                    }
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "sad", selected: selectedMood)
                    }
                    .onTapGesture {
                        selectedMood = "sad"
                    }
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "cry", selected: selectedMood)
                    }
                    .onTapGesture {
                        selectedMood = "cry"
                    }
                    Spacer()
                }
                .frame(width: 400, height: 100)
                .padding()
                
            }
        }
    }
    
}

