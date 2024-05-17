//
//  CAS_stat.swift
//  Cosmos
//
//  Created by 😏 😏 on 12/1/2023.
//

import SwiftUI

struct CAS_stat: View {
    var body: some View {
        ScrollView{
        VStack(alignment: .leading){
            
            Text("CAS scores is accomplished through the following interpretive ranges")
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 25)
                .padding(.bottom, 10)
            
            HStack{
                VStack(alignment: .leading){
                    Text("0-13")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 30)
                        .padding(.bottom,10)
                    Text("14-19")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 30)
                        .padding(.bottom,10)
                    Text("20-28")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 30)
                        .padding(.bottom,10)
                    Text("29-63")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 30)
                        .padding(.bottom,10)
                }
                VStack(alignment: .leading){
                    Text("minimal clinical anger")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom,10)
                    Text("mild clinical anger")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom,10)
                    Text("moderate clinical anger")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom,10)
                    Text("severe clinical anger")
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

