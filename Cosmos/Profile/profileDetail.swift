//
//  UserProfile.swift
//  Cosmos
//
//  Created by 😏 😏 on 20/10/2022.
//

import SwiftUI

struct profileDetail: View {
    @Binding var changeP : Bool
    @Binding var user : Account
    @Binding var loginStatus : Bool
    @State var changeA = false;
    @State var animalName : String = "";
    
    var body: some View {
    NavigationView{
    ZStack(alignment: .topLeading){
        Rectangle()
            .fill(Color("bgColor"))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        
        VStack{
            Text("")
                .padding(.bottom, 50)
        if(animalName == ""){
            Image(user.animal!)
                    .clipShape(Circle())
                    .shadow(radius: 7)
                    //.offset(y: -70)
                    .frame(alignment: .center)
                    .padding(.bottom,20)
                    .onTapGesture {
                        changeA.toggle()
                    }
                    .sheet(isPresented: $changeA, content: {
                        changePortrait(user: self.$user, animalName : self.$animalName)
                    })
        }
        else{
            Image(animalName)
                    .clipShape(Circle())
                    .shadow(radius: 7)
                    //.offset(y: -70)
                    .frame(alignment: .center)
                    .padding(.bottom,20)
                    .onTapGesture {
                        changeA.toggle()
                    }
                    .sheet(isPresented: $changeA, content: {
                        changePortrait(user: self.$user, animalName : self.$animalName)
                    })
        }
            
            Text(user.username!)
                .font(.title)
                
        Spacer()
            
        NavigationLink{
            diaryReport(user: self.$user)
        } label: {
            HStack{
                Spacer()
                VStack {
                    Text("Diary report")
                        .fontWeight(.bold)
                }
                    .frame(width: 250.0, height: 10)
                    .foregroundColor(Color.black.opacity(0.8))
                    .padding(20)
                    .background(Color("bgColor"))
                    .cornerRadius(10)
                    .modifier(ButtonShadowViewModifier())
                
                Spacer()
            }.padding(.bottom, 20)
            }
        
        HStack{
            Spacer()
            Button(action: {
                //print("Change password")
                self.changeP.toggle()
            }, label: {
                Spacer()
                
                Text("Change Password")
                    .fontWeight(.bold)
                
                Spacer()
            })
                .frame(width: 250.0, height: 10)
                .foregroundColor(Color.black.opacity(0.8))
                .padding(20)
                .background(Color("bgColor"))
                .cornerRadius(10)
                .modifier(ButtonShadowViewModifier())
            
            Spacer()
        }.padding(.bottom, 20)
         
        HStack{
            Spacer()
            Button(action: {
                //print("Log out")
                logout()
                
            }, label: {
                Spacer()
                
                Text("Logout")
                    .fontWeight(.bold)
                        
                Spacer()
            })
                .frame(width: 250.0, height: 10)
                .foregroundColor(Color.black.opacity(0.8))
                .padding(20)
                .background(Color("bgColor"))
                .cornerRadius(10)
                .modifier(ButtonShadowViewModifier())
                Spacer()
        }.padding(.bottom, 30)
            
        }
        
    }.navigationBarHidden(true)
    }.navigationBarHidden(true)
    .navigationViewStyle(.stack)
    }
    
    func logout(){
        loginStatus = false
    }
}

/*struct profileDetail_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
*/
