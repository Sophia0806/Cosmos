//
//  LoginView.swift
//  Cosmos
//
//  Created by 😏 😏 on 19/10/2022.
//

import SwiftUI
import CoreData

struct LoginView: View {
    @State var username = ""
    @State var password = ""
    @State var showAlert = false
    @Binding var isShow : Bool
    @Binding var loginStatus : Bool
    @Binding var user : Account
    
    @Binding var existDiary : Bool
    @Binding var mood : String
    @Binding var weather : String
    @Binding var content : String
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Account.entity(), sortDescriptors: [])
    var accounts: FetchedResults<Account>

    @FetchRequest(entity: Diary.entity(), sortDescriptors: [])
    var diarys: FetchedResults<Diary>
    
    @Environment(\.calendar) var calendar
    private var year: DateInterval {
        calendar.dateInterval(of: .month, for: Date())!
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("bgColor"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom,40)
                
                Text("Log in to your account")
                    .foregroundColor(.gray)
                
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
                    .autocapitalization(.none)
                
                HStack{
                    Spacer()
                    Text("Forget password?")
                        .foregroundColor(.gray)
                }.padding()
                
                HStack{
                    Button(action: {checkAccount()}, label: {
                        Spacer()
                        
                        Text("Login")
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
                                title: Text("Fail to log in"),
                                message: Text("Invalid username or password."))
                        }
                    
                }.padding(.bottom, 30)
                    
                HStack{
                    Text("Don't have an account?")
                        .foregroundColor(.gray)
                    Text("Sign up!")
                        .foregroundColor(.blue)
                        .onTapGesture{
                            self.isShow.toggle()
                        }
                }
                
                Spacer()
                
            }
        }
    }
    
    func checkAccount() -> Bool{
        // delete all data in account
        
       /* for account in accounts {
            viewContext.delete(account)
        }
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        */
        
        showAlert = false
        for account in accounts {
            if account.username == username &&  account.password == password{
                print("Log in successfully")
                loginStatus = true
                user = account
                checkDiary()
                return true
            }
        }
        username = ""
        password = ""
        showAlert = true
        
        return false
    }
    
    func checkDiary()-> Bool{
        print("check today")
        let date = Date()
        for diary in diarys {
            if diary.writeBy == user{
                if(diary.day == self.calendar.component(.day, from: date) && diary.month == self.calendar.component(.month, from: date) && diary.year == self.calendar.component(.year, from: date)){
                    mood = diary.mood!
                    weather = diary.weather!
                    content = diary.content!
                    existDiary = true
                    return true
                }
            }
        }
        return false
    }
    
}

struct ShadowViewModifier: ViewModifier{
    @State var radius: CGFloat = 10
    
    func body(content: Content) -> some View{
        content
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(Color("bgColor"),lineWidth: 4)
                    .shadow(color: Color("darkColor"), radius: 4, x: 5, y: 5)
                    .clipShape(RoundedRectangle(cornerRadius: radius))
                    .shadow(color: Color("lightColor").opacity(0.7), radius: 4, x: -5, y: -5)
                    .clipShape(RoundedRectangle(cornerRadius: radius))
                
            )
    }
}

struct ButtonShadowViewModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("lightColor").opacity(0.8), radius: 3, x: 5, y: 5)
            .shadow(color: Color("darkColor"), radius: 3, x: -3, y: -3)
    }
}

/*struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(is)
    }
}*/
