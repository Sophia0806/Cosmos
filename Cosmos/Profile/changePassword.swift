//
//  changePassword.swift
//  Cosmos
//
//  Created by 😏 😏 on 22/10/2022.
//

import SwiftUI

struct changePassword: View {
    @Binding var changeP : Bool
    @Binding var user : Account
    
    @State var oldPassword = ""
    @State var newPassword = ""
    @State var comfirmPassword = ""
    
    @State var showAlert = false
    @State var title = ""
    @State var message = ""
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Rectangle()
                .fill(Color("bgColor"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            Spacer()
            VStack{
                Spacer()
                
                HStack{
                Spacer()
                SecureField("Old Password",text:$oldPassword)
                    .padding()
                    .cornerRadius(5)
                    .frame(width: 300.0, height: 60.0)
                    .modifier(ShadowViewModifier())
                    .padding(.bottom,20)
                    .autocapitalization(.none)
                Spacer()
                }
                
                SecureField("New Password",text:$newPassword)
                    .padding()
                    .cornerRadius(5)
                    .frame(width: 300.0, height: 60.0)
                    .modifier(ShadowViewModifier())
                    .padding(.bottom,20)
                    .autocapitalization(.none)
                    
                    SecureField("Comfirm Password",text:$comfirmPassword)
                    .padding()
                    .cornerRadius(5)
                    .frame(width: 300.0, height: 60.0)
                    .modifier(ShadowViewModifier())
                    .padding(.bottom,20)
                    .autocapitalization(.none)
            
            HStack{
                Button(action: {change()}, label: {
                    Spacer()
                    
                    Text("Change")
                        .fontWeight(.bold)
                    
                    Spacer()
                })
                    .frame(width: 250.0, height: 10)
                    .foregroundColor(Color.black.opacity(0.8))
                    .padding(20)
                    .background(Color("bgColor"))
                    .cornerRadius(10)
                    .modifier(ButtonShadowViewModifier())
                    .alert(isPresented: $showAlert){
                        Alert(
                            title: Text(title),
                            message: Text(message))
                    }
                    
            }.padding()
            Spacer()
            
        }
            Button(action : {self.changeP.toggle()}, label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.gray)
            }).padding()
        }
        .navigationBarHidden(true)
    }
    
    
    func change()->Bool{
        showAlert = true
        title = "Fail to Change Password"
        if user.password != oldPassword {
            oldPassword = ""
            newPassword = ""
            comfirmPassword = ""
            message = "Old password is wrong. Please input your current password correctly. "
            return false
        }
        if newPassword != comfirmPassword {
            oldPassword = ""
            newPassword = ""
            comfirmPassword = ""
            message = "The password entered twice does not match. Please try again. "
            return false
        }
        user.password = newPassword
        do {
            try viewContext.save()
            oldPassword = ""
            newPassword = ""
            comfirmPassword = ""
            title = "Successfully change your password"
            message = ""
            return true
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

/*struct changePassword_Previews: PreviewProvider {
    static var previews: some View {
        changePassword()
    }
}
*/
