//
//  HAI_stat.swift
//  Cosmos
//
//  Created by 😏 😏 on 16/11/2022.
//

import SwiftUI


struct HAI_stat: View{
    var body: some View{
        ScrollView{
        VStack(alignment: .leading){
            
            Text("The health anxiety inventory is a brief screening measure of health anxiety. Statistic is preovided by the HAI resourece.")
                .padding()
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 20)
            
            HStack{
                Spacer()
                VStack(alignment: .leading){
                    Text("")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom,10)
                    Text("Mean")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom,10)
                    Text("SD")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 15)
                        .padding(.bottom,10)
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("Hyp")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                        .padding(.bottom,10)
                    Text("37.9")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                        .padding(.bottom,10)
                    Text("6.9")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                        .padding(.bottom,10)
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("Anx ")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                        .padding(.bottom,10)
                    Text("18.5")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                        .padding(.bottom,10)
                    Text("7.3")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                        .padding(.bottom,10)
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("Con")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                        .padding(.bottom,10)
                    Text("12.2")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                        .padding(.bottom,10)
                    Text("6.2")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                        .padding(.bottom,10)
                }
                Spacer()
            }.padding(.bottom, 10)
            
            Text("Remaks")
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 45)
            Text("Hyp: Hypochondriac Patients")
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 45)
            Text("Anx: Anxious Patients")
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 45)
            Text("Con: Control Patients")
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 45)
            Text("SD: Standard Deviation")
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 45)
            
        }
        }
    }
}

