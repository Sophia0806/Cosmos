//
//  MDQ_test_detail.swift
//  Cosmos
//
//  Created by 😏 😏 on 17/11/2022.
//

import SwiftUI

struct MDQ_test_detail: View {
    @Binding var selected_option :String
    var question : MDQModel
    var guidance : String
    var body: some View{
        VStack(alignment: .leading){
            
            Text(guidance)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding([.leading, .trailing], 25)
                .padding(.bottom, 20)
            
            VStack(alignment: .leading){
                Text(question.question_content)
                    .font(.system(size: 23))
                    .multilineTextAlignment(.leading)
                    .frame(alignment: .topLeading)
                    .padding([.leading, .trailing], 25)
                    .padding(.bottom, 20)
                
                Divider()
                ForEach(question.optionsList){option in
                    MDQ_test_option(selected_option: self.$selected_option, option: option)
                    Divider()
                }
            }
        }
    }
}

struct MDQ_last_detail: View{
    @Binding var selected_option : String
    var lastQ : lastMDQ
    var body: some View{
        VStack(alignment: .leading){
            
            VStack(alignment: .leading){
                Text(lastQ.question_content)
                    .font(.system(size: 23))
                    .multilineTextAlignment(.leading)
                    .frame(alignment: .topLeading)
                    .padding([.leading, .trailing], 25)
                    .padding(.bottom, 20)
                
                Divider()
                ForEach(lastQ.optionsList){option in
                    MDQ_test_option(selected_option: self.$selected_option, option: option)
                    Divider()
                }
            }
        }
    }
}

struct MDQ_test_option: View{
    @Binding var selected_option : String
    var option: MDQOption
    
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

