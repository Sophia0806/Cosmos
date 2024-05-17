//
//  CUDOS_stat.swift
//  Cosmos
//
//  Created by 😏 😏 on 16/11/2022.
//

import SwiftUI

struct CUDOS_stat: View {
    var body: some View {
        ScrollView{
        VStack(alignment: .leading){
            
            Text("If your scores fall within the ranges listed below, you may have possibility to have a corresponding degree of depression.")
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
                    Text("0-10")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 30)
                        .padding(.bottom,10)
                    Text("11-20")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 30)
                        .padding(.bottom,10)
                    Text("21-30")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 30)
                        .padding(.bottom,10)
                    Text("31-45")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 30)
                        .padding(.bottom,10)
                    Text("46 and above")
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
                    Text("Non-depressed")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom,10)
                    Text("Minimal Depression")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom,10)
                    Text("Mild Depression")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom,10)
                    Text("Moderate Depression")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom,10)
                    Text("Severe Depression")
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
                .padding(.top, -10)
                .padding()
                
        }
    }
    }
}
