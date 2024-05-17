//
//  HRS_test_detail.swift
//  Cosmos
//
//  Created by 😏 😏 on 14/1/2023.
//

import SwiftUI

struct HRS_test_detail: View{
    @Binding var selected_option :String
    var question : HRSModel
    var guidance : String
    var body: some View{
        VStack(alignment: .leading){
            ScrollView{
            Text(guidance)
                .foregroundColor(.gray)
                .padding([.leading, .trailing], 10)
                .padding(.bottom, 5)
                
                VStack(alignment: .leading){
            Text("0 = no problem")
                .foregroundColor(.gray)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 13)
                .padding(.bottom, 0)
            Text("2 = mild problem, occasionally (less than weekly) acquires items not needed, or acquires a few unneeded items")
                .foregroundColor(.gray)
                .padding([.leading, .trailing], 13)
                .padding(.bottom, 2)
            Text("4 = moderate, regularly (once or twice weekly) acquires items not needed, or acquires some unneeded items")
                .foregroundColor(.gray)
                .padding([.leading, .trailing], 13)
                .padding(.bottom, 2)
            Text("6 = severe, frequently (several times per week) acquires items not needed, or acquires many unneeded items")
                .foregroundColor(.gray)
                .padding([.leading, .trailing], 13)
                .padding(.bottom, 2)
            Text("8 = extreme, very often (daily) acquires items not needed, or acquires large numbers of unneeded items")
                .foregroundColor(.gray)
                .padding([.leading, .trailing], 13)
                .padding(.bottom, 8)
                }
            
            VStack(alignment: .leading){
                Text(question.question_content)
                    .font(.system(size: 23))
                    .multilineTextAlignment(.leading)
                    .frame(alignment: .topLeading)
                    .padding([.leading, .trailing], 25)
                    .padding(.bottom, 20)
                
                Divider()
                
                ForEach(question.optionsList){option in
                    HRS_test_option(selected_option: self.$selected_option, option: option)
                    Divider()
                }
                
            }
            }
            Text("")
        }
    }
}


struct HRS_test_option: View{
    @Binding var selected_option : String
    var option: HRSOption
    
    var body: some View{
        ZStack(alignment: .topLeading){
            
            if(selected_option == option.optionId){
                VStack(alignment: .leading){
                    Text("\(option.optionId). \(option.content)")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black.opacity(1.0))
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 25)
                        .padding(.bottom, 10)
                        .onTapGesture {
                            selected_option = option.optionId
                        }
                    }
            }
            else{
                VStack(alignment: .leading){
                    Text("\(option.optionId). \(option.content)")
                        .font(.system(size: 20))
                        .foregroundColor(Color.black.opacity(0.7))
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 25)
                        .padding(.bottom, 10)
                        .onTapGesture {
                            selected_option = option.optionId
                        }
                    }
            }
        }
    }
}

