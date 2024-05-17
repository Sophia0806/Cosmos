//
//  changeWeather.swift
//  Cosmos
//
//  Created by 😏 😏 on 22/2/2023.
//

import SwiftUI

struct changeWeather: View {
    @Binding var selectedWeather : String
    var body: some View {
        ZStack{
            
            Image("diary_bg")
                 .resizable()
                 .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "sun", selected: selectedWeather)
                    }
                    .onTapGesture {
                        selectedWeather = "sun"
                    }
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "sun&cloud", selected: selectedWeather)
                    }
                    .onTapGesture {
                        selectedWeather = "sun&cloud"
                    }
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "cloud", selected: selectedWeather)
                    }
                    .onTapGesture {
                        selectedWeather = "cloud"
                    }
                    Spacer()
                }
                .frame(width: 400, height: 100)
                .padding()
                HStack{
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "rain", selected: selectedWeather)
                    }
                    .onTapGesture {
                        selectedWeather = "rain"
                    }
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "rainbow", selected: selectedWeather)
                    }
                    .onTapGesture {
                        selectedWeather = "rainbow"
                    }
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "wind", selected: selectedWeather)
                    }
                    .onTapGesture {
                        selectedWeather = "wind"
                    }
                    Spacer()
                }
                .frame(width: 400, height: 100)
                .padding()
                HStack{
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "snow", selected: selectedWeather)
                    }
                    .onTapGesture {
                        selectedWeather = "snow"
                    }
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "shower", selected: selectedWeather)
                    }
                    .onTapGesture {
                        selectedWeather = "shower"
                    }
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "thunderstorm", selected: selectedWeather)
                    }
                    .onTapGesture {
                        selectedWeather = "thunderstorm"
                    }
                    Spacer()
                }
                .frame(width: 400, height: 100)
                .padding()
                HStack{
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "lightning", selected: selectedWeather)
                    }
                    .onTapGesture {
                        selectedWeather = "lightning"
                    }
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "hail", selected: selectedWeather)
                    }
                    .onTapGesture {
                        selectedWeather = "hail"
                    }
                    Spacer()
                    VStack{
                        itemDisplay(imageName: "tornado", selected: selectedWeather)
                    }
                    .onTapGesture {
                        selectedWeather = "tornado"
                    }
                    Spacer()
                }
                .frame(width: 400, height: 100)
                .padding()
                
            }
        }
    }
}
