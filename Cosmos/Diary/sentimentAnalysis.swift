//
//  sentimentAnalysis.swift
//  Cosmos
//
//  Created by 😏 😏 on 28/3/2023.
//

import SwiftUI

struct sentimentAnalysis: View {
    @EnvironmentObject var responsedata: ResponseData
    var content: String
    @State var output : Int = 0
    @State var isShow = false
    var body: some View {
        VStack{
            Image("analysis")
                .resizable()
                .padding()
                .frame(width: 80.0, height: 80.0)
                .onTapGesture{
                    if(!isShow){
                        output=responsedata.API(content: content)
                    }
                    isShow.toggle()
                }
            
            if(isShow){
                if(output == 1){
                    Text("Possibly positive content :)")
                }
                else if(output == -1){
                    Text("Possibly negative content :(")
                }
                else{
                    Text("Neutral content :|")
                }
            }
        }
    }
    
    }

