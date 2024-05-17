//
//  addReply.swift
//  Cosmos
//
//  Created by 😏 😏 on 5/11/2022.
//

import SwiftUI

struct addReply: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Binding var user: Account
    @ObservedObject var post : Post
    
    @State var showAlert = false
    @State var title = ""
    @State var message = ""
    @State var replyContent : String = ""
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Rectangle()
                .fill(Color("discussionBg"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                
                Text("Make reply")
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .frame(alignment: .topLeading)
                    .padding([.leading, .trailing], 5)
                    .padding()
                
                Divider()
            
                TextEditor(text:$replyContent)
                    .padding()
                    .colorMultiply(Color("discussionBg"))
                    .cornerRadius(5)
                    .frame(width: .infinity, height: 500, alignment: .top)
                    .padding(.bottom,20)
                    .autocapitalization(.none)
                
                Divider()
                
                HStack{
                    Spacer()
                    Button(action: {saveReply()}) {
                            Image(systemName: "paperplane")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color("discussionDark"))
                            .padding()
                    }
                    .alert(isPresented: $showAlert){
                        Alert(
                            title: Text(title),
                            message: Text(message))
                    }
                    
                    Spacer()
                }
            }
        }
    }
    
    
    func saveReply() -> Bool{
        showAlert = false
        if(replyContent == ""){
            showAlert = true
            title = "Fail to make reply"
            message = "Blank input ia not allowed."
            return false
        }
        
        var replies = post.haveReplies.array(of: Reply.self)
        
        let newReply = Reply(context: viewContext)
        
        newReply.id = UUID()
        newReply.time = getTime()
        newReply.content = replyContent
        
        if replies.isEmpty{
            newReply.floor = 0
        }
        else{
            replies.sort { $0.floor > $1.floor }
            newReply.floor = replies[0].floor + 1
        }
        
        newReply.accountOwner = user
        newReply.postOwner = post
        
        user.addToReleaseReply(newReply)
        post.addToHaveReplies(newReply)
        
        do {
            try viewContext.save()
            showAlert = true
            title = "Release reply successfully"
            message = ""
            replyContent = ""
            return true
        } catch {
            let nsError = error as NSError
        }
        return false
    }
}

/*
struct addReply_Previews: PreviewProvider {
    static var previews: some View {
        addReply()
    }
}
*/
