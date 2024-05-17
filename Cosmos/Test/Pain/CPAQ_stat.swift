//
//  CPAQ_stat.swift
//  Cosmos
//
//  Created by 😏 😏 on 17/1/2023.
//

import SwiftUI

struct CPAQ_stat: View {
    var body: some View {
        ScrollView{
        VStack(alignment: .leading){
            
            Text("Higher scores indicate higher levels of acceptance.")
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 25)
                .padding(.bottom, 10)
            
            Text("No score interpretation found in Internet up to now. ")
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 25)
                .padding(.bottom, 10)
            
            
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
