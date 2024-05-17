//
//  addDiscussion.swift
//  Cosmos
//
//  Created by 😏 😏 on 2/11/2022.
//

import SwiftUI

struct addDiscussion: View {
    @Binding var isShow : Bool
    @Binding var user : Account

    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var PostContent = ""
    @State var showAlert = false
    @State var title = ""
    @State var message = ""
    var body: some View {
        ZStack(alignment: .topLeading){
            Rectangle()
                .fill(Color("discussionBg"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image("discussionHeader")
                    .resizable()
                    .frame(width: .infinity, height: 250)
                    .edgesIgnoringSafeArea(.all)
                
                HStack{
                    Spacer()
                    Text("Post new discussion")
                        .foregroundColor(Color("discussionDark"))
                        .font(.system(size: 25))
                    
                    Spacer()
                    
                    Button(action: {saveDiscussion()}) {
                                Image(systemName: "paperplane")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("discussionDark"))
                        }
                    .alert(isPresented: $showAlert){
                        Alert(
                            title: Text(title),
                            message: Text(message))
                    }
                    Spacer()
                }
                ScrollView{
                TextEditor(text:$PostContent)
                    .padding()
                    .colorMultiply(Color("discussionBg"))
                    .cornerRadius(5)
                    .frame(width: .infinity, height: 350, alignment: .top)
                    .padding(.bottom,20)
                    .autocapitalization(.none)
                    .modifier(TextViewModifier())
                }
            }
            Button(action : {self.isShow.toggle()}, label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.gray)
            }).padding()
        }
        .navigationBarHidden(true)
        
    }
    func saveDiscussion() -> Bool{
        showAlert = false
        if(PostContent == ""){
            showAlert = true
            title = "Fail to release post"
            message = "Blank input ia not allowed."
            return false
        }
        let newPost = Post(context: viewContext)
        newPost.id = UUID()
        newPost.time = getTime()
        newPost.content = PostContent
        newPost.postBy = user
        user.addToReleasePost(newPost)
        do {
            try viewContext.save()
            showAlert = true
            title = "Release post successfully"
            message = ""
            PostContent = ""
            return true
        } catch {
            let nsError = error as NSError
        }
        return false
    }
}

public func getTime() -> String{
    let date = Date()
    let calendar = Calendar.current
    let day = calendar.component(.day, from: date)
    let month = calendar.component(.month, from: date)
    let year = calendar.component(.year, from: date)
    let hour = calendar.component(.hour, from: date)
    let minute = calendar.component(.minute, from: date)
    var theTime: String
    if(minute < 10){
        theTime = "\(year)/\(month)/\(day) \(hour):0\(minute)"
    }
    else{
        theTime = "\(year)/\(month)/\(day) \(hour):\(minute)"
    }
    return theTime
}

struct TextViewModifier: ViewModifier{
    @State var radius: CGFloat = 10
    
    func body(content: Content) -> some View{
        content
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(Color("discussionBg"),lineWidth: 2)
                    .shadow(color: Color("discussionDark"), radius: 4, x: 5, y: 5)
                    .clipShape(RoundedRectangle(cornerRadius: radius))
                    .shadow(color: Color("discussionDark"), radius: 4, x: -5, y: -5)
                    .clipShape(RoundedRectangle(cornerRadius: radius))
                
            )
    }
}
/*
struct addDiscussion_Previews: PreviewProvider {
    static var previews: some View {
        addDiscussion()
    }
}
*/
