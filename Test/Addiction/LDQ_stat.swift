//
//  LDQ_stat.swift
//  Cosmos
//
//  Created by 😏 😏 on 12/1/2023.
//

import SwiftUI

struct LDQ_stat: View {
    var body: some View {
        ScrollView{
        VStack(alignment: .leading){
            
            Text("There is no specific cut-off points for low, moderate or severe dependence. Instead users of the scale are encouraged to view it as a continuum.")
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 25)
                .padding(.bottom, 10)
            
            Text("However a score of 20 or more approximates to a score for severe dependence.")
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
