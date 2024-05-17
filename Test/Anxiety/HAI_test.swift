//
//  HAI_Test.swift
//  Cosmos
//
//  Created by 😏 😏 on 11/11/2022.
//

import SwiftUI

struct HAI_test: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var HAI_model = HAI_Model().model
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
                    else if(index == HAI_model.HAIModel.count-1){
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
                    Text("Health Anxiety Inventory (HAI)")
                        .padding()
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                        .font(.title)
                    Divider()
                    Text("HAI is a self-rated measure of health anxiety which is sensitive across the full range of intensity (from mild concern to frank hypochondriasis) and can differentiate people suffering from health anxiety from those who have actual physical illness but who are not excessively concerned about their health.")
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
                    
                    Text("From Salkovskis, P. M., Rimes, K. A., Warwick, H. M. C., & Clark, D. M. (2002). The Health Anxiety Inventory: development and validation of scales for the measurement of health anxiety and hypochondriasis. Psychological Medicine, 32(05), 843-853.")
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
                    
                    HAI_stat()
                }
                else{
                    HStack{
                        Text("Question \(HAI_model.HAIModel[index].id)/\(HAI_model.HAIModel.count)")
                            .padding()
                            .padding([.leading, .trailing], 10)
                            .font(.title)
                        Spacer()
                    }
                    HAI_test_detail(selected_option: self.$selected_option, question: HAI_model.HAIModel[index], guidance: HAI_model.guidance)
                }
            }
            
            
        }
        .navigationBarHidden(true)
    }
    
    func add_score() -> Bool{
        for option in HAI_model.HAIModel[index].optionsList{
            if(option.optionId == selected_option){
                total_score += option.score
                selected_option = ""
            }
        }
        print("\(total_score)")
        return true
    }
}
