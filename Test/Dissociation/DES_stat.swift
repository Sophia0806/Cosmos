//
//  DES_stat.swift
//  Cosmos
//
//  Created by 😏 😏 on 16/1/2023.
//

import SwiftUI

struct DES_stat: View {
    var body: some View {
        ScrollView{
        VStack(alignment: .leading){
            
            Text("The total score can range from 0 to 32, with higher scores indicating greater severity of dissociative experiences.")
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 25)
                .padding(.bottom, 10)
            
            HStack{
                VStack(alignment: .leading){
                    Text("Range")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 30)
                        .padding(.bottom,10)
                    Text("0-3")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 30)
                        .padding(.bottom,10)
                    Text("4-11")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 30)
                        .padding(.bottom,10)
                    Text("12-19")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 30)
                        .padding(.bottom,10)
                    Text("20-27")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 30)
                        .padding(.bottom,10)
                    Text("28-32")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 30)
                        .padding(.bottom,10)
                }
                VStack(alignment: .leading){
                    Text("Severity")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom,10)
                    Text("None")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom,10)
                    Text("Mild")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom,10)
                    Text("Moderate")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom,10)
                    Text("Severe")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom,10)
                    Text("Extreme")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom,10)
                }
            }
            
            Text("Important")
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 25)
                .padding(.bottom, -10)
            
            Text("This is not a diagnostic tool. Only a healthcare profession can diagnose. Always follow the advice of your doctor. Do not change the way you take your medication without talking to your doctor(if any).")
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 10)
                .padding()
        }
    }
    }
}
