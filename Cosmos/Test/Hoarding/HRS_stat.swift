//
//  HRS_stat.swift
//  Cosmos
//
//  Created by 😏 😏 on 14/1/2023.
//

import SwiftUI

struct HRS_stat: View {
    var body: some View {
        ScrollView{
        VStack(alignment: .leading){
            
            Text("Mean for Nonclinical samples: HRS Total = 3.34; standard deviation = 4.97.")
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 25)
                .padding(.bottom, 10)
            
            Text("Mean for people with hoarding problems: HRS Total = 24.22; standard deviation = 5.67.")
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 25)
                .padding(.bottom, 10)
            
            Text("Analysis of sensitivity and specificity suggest an HRS Total clinical cutoff score of 14.")
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
                .padding(.top, -10)
                .padding()
                
        }
    }
    }
}
