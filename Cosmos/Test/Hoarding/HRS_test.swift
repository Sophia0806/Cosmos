//
//  HRS_test.swift
//  Cosmos
//
//  Created by 😏 😏 on 14/1/2023.
//

import SwiftUI

struct HRS_test: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var HRS_model = HRS_Model().model
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
                    else if(index == HRS_model.HRSModel.count-1){
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
                    
                    Text("Hoarding Rating Scale (HRS)")
                        .padding()
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                        .font(.title)
                        
                    Divider()
                    Text("This questionaire is 5-item semi-structured interview that was designed to capture the key aspects of hoarding disorder (HD): (1) clutter in the home, (2) difficulty discarding possessions, (3) excessive acquiring of possessions, (4) distress due to hoarding, and (5) functional impairment due to hoarding. ")
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
                    
                    Text("From Tolin, D.F., Frost, R.O., & Steketee, G. (2010). A brief interview for assessing compulsive hoarding: The Hoarding Rating Scale-Interview. Psychiatry Research, 178, 147-152.")
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
                        .padding([.leading, .trailing], 8)
                        .font(.title)
                        .padding(.top, 200)
                    
                    HRS_stat()
                        .padding(.top, -10)
                    
                }
                else{
                    HStack{
                        Text("Question \(HRS_model.HRSModel[index].id)/\(HRS_model.HRSModel.count)")
                            .padding()
                            .padding([.leading, .trailing], 10)
                            .font(.title)
                        Spacer()
                    }
                    HRS_test_detail(selected_option: self.$selected_option, question: HRS_model.HRSModel[index], guidance: HRS_model.guidance)
                }
            }
            
            
        }
        .navigationBarHidden(true)
    }
    
    func add_score() -> Bool{
        for option in HRS_model.HRSModel[index].optionsList{
            if(option.optionId == selected_option){
                total_score += option.score
                selected_option = ""
            }
        }
        print("\(total_score)")
        return true
    }
}

