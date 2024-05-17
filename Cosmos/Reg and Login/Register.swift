//
//  Register.swift
//  Cosmos
//
//  Created by 😏 😏 on 19/10/2022.
//

import SwiftUI
import CoreData

struct Register: View {
    @State var email = ""
    @State var username = ""
    @State var password = ""
    @State var comfirmPassword = ""
    @State var showAlert = false
    @State var title = ""
    @State var message = ""
    @Binding var isShow : Bool
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Account.entity(), sortDescriptors: [])
    var accounts: FetchedResults<Account>
        
    var body: some View{

        ZStack(alignment: .topLeading){
            Rectangle()
                .fill(Color("bgColor"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            HStack{
                Spacer()
                register.padding()
                Spacer()
            }
            
            Button(action : {self.isShow.toggle()}, label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.gray)
            }).padding()
        }
        .navigationBarHidden(true)
        
    
    }

    var register: some View {
        ZStack{
            VStack{
                Spacer()
                Text("Register")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom,40)
                
                Text("Create a new account")
                    .foregroundColor(.gray)
                
                TextField("Email Address",text:$email)
                    .padding()
                    .cornerRadius(5)
                    .frame(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/60.0/*@END_MENU_TOKEN@*/)
                    .modifier(ShadowViewModifier())
                    .padding(.bottom,20)
                    .autocapitalization(.none)
                
                TextField("Username",text:$username)
                    .padding()
                    .cornerRadius(5)
                    .frame(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/60.0/*@END_MENU_TOKEN@*/)
                    .modifier(ShadowViewModifier())
                    .padding(.bottom,20)
                    .autocapitalization(.none)
                
                
                SecureField("Password",text:$password)
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
    
                    Button(action: {addAccount()}, label: {
                        Spacer()
                        
                        Text("Create")
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
        }
    }

    private func addAccount() -> Bool{
        
        title = "Fail to create aacount"
        showAlert = false
        
        if username == "" || email == "" || password == "" {
            showAlert = true
            message = "Blank input. Please input again."
            return false
        }
        
        if password != comfirmPassword{
            password = ""
            comfirmPassword = ""
            showAlert = true
            message = "The password entered twice does not match. Please try again."
            return false
        }
            for account in accounts {
                if account.username == username || account.email == email{
                    print("Existing account!")
                    username = ""
                    email = ""
                    password = ""
                    comfirmPassword = ""
                    showAlert = true
                    message = "Your input username or email address has been used. Please change and try again."
                    return false
                }
            }
        
            let newAccount = Account(context: viewContext)
            newAccount.id = UUID()
            newAccount.username = username
            newAccount.password = password
            newAccount.email = email
            newAccount.animal = "tiger"
            do {
                try viewContext.save()
                showAlert = true
                username = ""
                email = ""
                password = ""
                comfirmPassword = ""
                title = "Successfully create a new account"
                message = "You can return to log in page and log in now."
                return true
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
    }

    
}
/*
struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
*/

