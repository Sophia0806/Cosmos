//
//  AAI_stat.swift
//  Cosmos
//
//  Created by 😏 😏 on 16/1/2023.
//

import SwiftUI

struct AAI_stat: View {
    var body: some View {
        ScrollView{
        VStack(alignment: .leading){
            
            Text("The AAI is a self-report scale for assessing symptoms of Body Dysmorphic Disorder (BDD).")
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 25)
                .padding(.bottom, 10)
            
            Text("Recommended cutoff score is 19, with scores at or above this level indicating the likely presence of BDD.")
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
