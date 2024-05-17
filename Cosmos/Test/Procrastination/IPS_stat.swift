//
//  IPS_stat.swift
//  Cosmos
//
//  Created by 😏 😏 on 14/1/2023.
//

import SwiftUI

struct IPS_stat: View {
    var body: some View {
        ScrollView{
        VStack(alignment: .leading){
            
            Text("The higher the score, the more serious your procrastination.")
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 25)
                .padding(.bottom, 10)
            
            Text("19 or less: Your mantra is “first-things-first”")
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 25)
                .padding(.bottom, 10)
            
            Text("From 20 to 36: Average procrastinator")
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 25)
                .padding(.bottom, 10)
            
            Text("37 or more: “Tomorrow” is your middle name")
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
