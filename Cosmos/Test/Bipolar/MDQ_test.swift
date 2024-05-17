//
//  MDQ_test.swift
//  Cosmos
//
//  Created by 😏 😏 on 17/11/2022.
//

import SwiftUI

struct MDQ_test: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var MDQ_model = MDQ_Model().model
    @State var exitAlert = false
    @State var nextAlert = false
    @State var index = -1
    @State var selected_option = ""
    @State var total_score = 0
    @State var completed = false
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Rectangle()
                .fill(Color("testBg"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            if(completed){
                Image("testHeader")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 240)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.7)
            }
            
            Button(action: {
                if(index == -1){
                    exitAlert = false
                    self.presentationMode.wrappedValue.dismiss()
                }
                else if(completed){
                    exitAlert = false
                    self.presentationMode.wrappedValue.dismiss()
                }
                else{
                    exitAlert = true
                }
            }, label:{
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.gray)
                    
            }).padding()
                .alert(isPresented: $exitAlert) {
                    Alert(
                        title: Text("Are you sure to exit the test? "),
                        message: Text("The process will not be saved if you exit."),
                        primaryButton: .default(
                                Text("Yes"),
                                action: {self.presentationMode.wrappedValue.dismiss()}),
                        secondaryButton: .destructive(
                            Text("Cancel"),
                            action: {
                                exitAlert = false
                            })
                        )
                }
            
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                 
                    //header
                    if(index == -1){
                        Text("Start")
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .padding()
                            .padding([.leading, .trailing], 10)
                            .onTapGesture {
                                index += 1
                            }
                    }
                    else if(index == MDQ_model.MDQModel.count){
                        Text("Submit")
                            .foregroundColor(.gray)
                            .padding()
                            .padding([.leading, .trailing], 10)
                            .onTapGesture {
                                if(selected_option == ""){
                                    nextAlert = true
                                }else{
                                    add_score()
                                    completed = true
                                    index += 1
                                }
                            }
                            .alert(isPresented: $nextAlert){
                                Alert(
                                    title: Text("You haven't chosen any option"),
                                    message: Text("Please choose one option"))
                            }
                    }
                    else if(!completed){
                        Text("Next")
                            .foregroundColor(.gray)
                            .padding()
                            .padding([.leading, .trailing], 10)
                            .onTapGesture {
                                if(selected_option == ""){
                                    nextAlert = true
                                }else{
                                    add_score()
                                    index += 1
                                }
                            }
                            .alert(isPresented: $nextAlert){
                                Alert(
                                    title: Text("You haven't chosen any option"),
                                    message: Text("Please choose one option"))
                        }
                    }
                }
               
                //main body
                if(index == -1){
                    Text("The Mood Disorder Questionnaire (MDQ)")
                        .padding()
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                        .font(.title)
                        
                    Divider()
                    Text("Bipolar spectrum disorders, which include bipolar I, bipolar II, and bipolar disorder not otherwise specified, fre- quently go unrecognized, undiagnosed, and untreated. ")
                        .padding()
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                    
                        HStack{
                            Text("Please note:")
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .frame(alignment: .topLeading)
                                .padding([.leading, .trailing], 30)
                                .padding(.bottom, -15)
                            Spacer()
                        }
                        
                    Text("This is not a diagnostic tool. Only a healthcare profession can diagnose. Always follow the advice of your doctor. Do not change the way you take your medication without talking to your doctor(if any).")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                        .padding()
                    
                    Text("From Hirschfeld, R. M., Williams, J. B., Spitzer, R. L., Calabrese, J. R., Flynn, L., Keck Jr, P. E., … & Russell, J. M. (2000). Development and validation of a screening instrument for bipolar spectrum disorder: the Mood Disorder Questionnaire. American Journal of Psychiatry, 157(11), 1873-1875.")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        .padding()
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                    
                    
                }
                else if(completed){
                    if(total_score > 6){
                        Text("Your test result is")
                            .padding()
                            .multilineTextAlignment(.leading)
                            .frame(alignment: .topLeading)
                            .padding([.leading, .trailing], 8)
                            .font(.title)
                            .padding(.top, 200)
                        
                        Text("Bipolar Positive")
                            .padding()
                            .multilineTextAlignment(.leading)
                            .frame(alignment: .topLeading)
                            .padding([.leading, .trailing], 8)
                            .font(.title)
                            .padding(.top, -20)
                        
                        Text("Your results indicate that you are experiencing some signs of bipolar disorder. Further medical assessment for bipolar disorder is clearly warranted.")
                            .multilineTextAlignment(.leading)
                            .frame(alignment: .topLeading)
                            .padding([.leading, .trailing], 10)
                            .padding()
                    }
                    else{
                        Text("Your test result is")
                            .padding()
                            .multilineTextAlignment(.leading)
                            .frame(alignment: .topLeading)
                            .padding([.leading, .trailing], 8)
                            .font(.title)
                            .padding(.top, 200)
                        
                        Text("Bipolar Negative")
                            .padding()
                            .multilineTextAlignment(.leading)
                            .frame(alignment: .topLeading)
                            .padding([.leading, .trailing], 8)
                            .font(.title)
                            .padding(.top, -20)
                        
                        Text("Your results indicate that you are experiencing none, or very few signs of bipolar disorder.")
                            .multilineTextAlignment(.leading)
                            .frame(alignment: .topLeading)
                            .padding([.leading, .trailing], 10)
                            .padding()
                    }
                    
                    Text("Important:")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 25)
                        .padding(.bottom, -10)
                    
                    Text("This questionnaire should be used as a starting point. It is not a substitute for a full medical evaluation.Bipolar disorder is a complex illness, and an accurate, thorough diagnosis can only be made through a personal evaluation by your doctor.")
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                        .padding()
                    
                }
                else if( index == MDQ_model.MDQModel.count-1){
                    HStack{
                        Text("Question \(MDQ_model.MDQModel[index].id)/\(MDQ_model.MDQModel.count+1)")
                            .padding()
                            .padding([.leading, .trailing], 10)
                            .font(.title)
                        Spacer()
                    }
                    MDQ_test_detail(selected_option: self.$selected_option, question: MDQ_model.MDQModel[index], guidance: "")
                }
                else if( index == MDQ_model.MDQModel.count){
                    HStack{
                        Text("Question 15/\(MDQ_model.MDQModel.count+1)")
                            .padding()
                            .padding([.leading, .trailing], 10)
                            .font(.title)
                        Spacer()
                    }
                    MDQ_last_detail(selected_option: self.$selected_option, lastQ: MDQ_model.lastQ)
                }
                else{
                    HStack{
                        Text("Question \(MDQ_model.MDQModel[index].id)/\(MDQ_model.MDQModel.count+1)")
                            .padding()
                            .padding([.leading, .trailing], 10)
                            .font(.title)
                        Spacer()
                    }
                    MDQ_test_detail(selected_option: self.$selected_option, question: MDQ_model.MDQModel[index], guidance: MDQ_model.guidance)
                }
            }
            
            
        }
        .navigationBarHidden(true)
    }
    
    func add_score() -> Bool{
        if(index == 13){
            for option in MDQ_model.MDQModel[index].optionsList{
                if(option.optionId == selected_option){
                    total_score *= option.score
                    selected_option = ""
                }
            }
        }
        else if(index == 14){
            for option in MDQ_model.lastQ.optionsList{
                if(option.optionId == selected_option){
                    total_score *= option.score
                    selected_option = ""
                }
            }
        }
        else{
            for option in MDQ_model.MDQModel[index].optionsList{
                if(option.optionId == selected_option){
                    total_score += option.score
                    selected_option = ""
                }
            }
        }
        print("\(total_score)")
        return true
    }
}
