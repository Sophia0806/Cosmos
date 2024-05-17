//
//  CAS_test.swift
//  Cosmos
//
//  Created by 😏 😏 on 12/1/2023.
//

import SwiftUI

struct CAS_test: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var CAS_model = CAS_Model().model
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
                    else if(index == CAS_model.CASModel.count-1){
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
                    Text("The Clinical Anger Scale (CAS)")
                        .padding()
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                        .font(.title)
                    Divider()
                    Text("CAS is an objective self-report instrument designed to measure the syndrome of clinical anger. CAS was related in predictable ways to people's psychopathological symptoms, personality traits, and early family environments.")
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
                    
                    Text("From Snell, W. E., Jr., Gum, S., Shuck, R. L., Mosley, J. A., & Hite, T. L.. (1995).  The Clinical Anger Scale: Preliminary reliability and validity. Journal of Clinical Psychology, 51, 215-226")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        .padding()
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                    
                    
                }
                else if(completed){
                    Text("Your total score is \(total_score)")
                        .padding()
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                        .font(.title)
                        .padding(.top, 200)
                    
                    CAS_stat()
                }
                else{
                    HStack{
                        Text("Question \(CAS_model.CASModel[index].id)/\(CAS_model.CASModel.count)")
                            .padding()
                            .padding([.leading, .trailing], 10)
                            .font(.title)
                        Spacer()
                    }
                    CAS_test_detail(selected_option: self.$selected_option, question: CAS_model.CASModel[index], guidance: CAS_model.guidance)
                }
            }
            
            
        }
        .navigationBarHidden(true)
    }
    
    func add_score() -> Bool{
        for option in CAS_model.CASModel[index].optionsList{
            if(option.optionId == selected_option){
                total_score += option.score
                selected_option = ""
            }
        }
        print("\(total_score)")
        return true
    }
}
