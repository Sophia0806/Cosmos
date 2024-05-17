//
//  postDetail.swift
//  Cosmos
//
//  Created by 😏 😏 on 4/11/2022.
//

import SwiftUI

struct postDetail: View {
    @Binding var user: Account
    @ObservedObject var post : Post
    @ObservedObject var postOwner : Account
    @State var isShow = false
    @State var deleteAlert = false
    @State var deleteReply : Reply = Reply()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Rectangle()
                .fill(Color("discussionBg"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {self.presentationMode.wrappedValue.dismiss()
            }, label:{
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.gray)
                    
            }).padding()
            
            VStack{
                detail.padding()
            }.padding(.top, 40)
            
        }
        .navigationBarHidden(true)
        .toolbar {
            Button {
                isShow.toggle()
            } label: {
            Label("", systemImage: "square.and.pencil")
            }
        }
            .sheet(isPresented: $isShow) {
                addReply(user: self.$user, post: self.post)
        }
        
    }
    
    var detail: some View {
        ZStack(alignment: .topLeading){
            ScrollView{
            VStack(alignment: .leading){
                HStack{
                    Image(postOwner.animal!)
                        .resizable()
                        .clipShape(Circle())
                        .shadow(radius: 3)
                        .frame(width: 90, height: 90.0)
                        .padding()
                    
                    VStack{
                        Spacer()
                        if(postOwner.username == user.username){
                            HStack{
                                Text("Post by you")
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.leading)
                                    .frame(alignment: .topLeading)
                                    .padding(.bottom)
                                Spacer()
                            }
                            }
                            else{
                                HStack{
                                Text("Post by "+postOwner.username!)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.leading)
                                    .frame(alignment: .topLeading)
                                    .padding(.bottom)
                                Spacer()
                                }
                            }
                        Spacer()
                            HStack{

                                Text(post.time!)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.leading)
                                    .frame(alignment: .topLeading)
                                    .padding(.bottom)
                                Spacer()
                            }
                        Spacer()
                    }
                    
                    Spacer()
                    Button(action: {isShow.toggle()}) {
                                Image(systemName: "square.and.pencil")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("discussionDark"))
                        }
                            
                }
                Divider()
                
                Text(post.content!)
                    .multilineTextAlignment(.leading)
                    .frame(alignment: .topLeading)
                    .padding([.leading, .trailing], 5)
                    .padding(.bottom)
                }
                
                Divider()
                
                VStack{
                    showreplies
                }
                
            
            }
        }
    }
    
    var showreplies: some View{
        VStack(alignment: .leading){
        if post.haveReplies.array(of: Reply.self).isEmpty{
            Text("No replies")
        }
        else{
            VStack(alignment: .leading){
                ForEach(getReplies()){reply in
                    HStack{
                        Image((reply.accountOwner?.animal!)!)
                            .resizable()
                            .clipShape(Circle())
                            .shadow(radius: 3)
                            .frame(width: 70, height: 70.0)
                            .padding()
                        
                        Spacer()
                        
                        VStack{
                            HStack{
                                
                            Text("LG \(reply.floor)")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                                
                            Spacer()
                             
                                if(reply.accountOwner?.username == user.username){
                                    Text("Post by you")
                                        .foregroundColor(.gray)
                                        .padding([.leading, .trailing], 8)
                                }
                                else{
                                    Text("Post by " + (reply.accountOwner?.username!)!)
                                        .foregroundColor(.gray)
                                        .padding([.leading, .trailing], 8)
                                }
                            }
                            
                            HStack{
                                Spacer()
                                Text(reply.time!)
                                    .padding([.leading, .trailing], 8)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    
                    Text(reply.content!)
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 5)
                        .padding(.bottom)
                    
                    HStack{
                    if(reply.accountOwner!.username == user.username){
                         Spacer()
                         Text("Delete")
                             .foregroundColor(Color("discussionDark"))
                             .padding([.leading, .trailing], 20)
                             .font(.system(size: 15))
                             .onTapGesture {
                                 print("Delete reply")
                                 deleteReply = reply
                                 deleteAlert = true
                             }
                             .alert(isPresented: $deleteAlert) {
                                 Alert(
                                     title: Text("Delete reply"),
                                     message: Text("Are you sure to delete this reply?"),
                                     primaryButton: .default(
                                             Text("Yes"),
                                             action: {deleteReply(reply: deleteReply)}),
                                     secondaryButton: .destructive(
                                         Text("Cancel"),
                                         action: {
                                             deleteAlert = false
                                         })
                                     )
                             }
                     }
                    }.padding(.bottom, 10)
                    
                    Divider()
                    
                }
            }
        }
        }
    }
    
    
    func getReplies() -> [Reply]{
        var replies = post.haveReplies.array(of: Reply.self)
        replies.sort { $0.floor < $1.floor }
        return replies
    }
    
    func deleteReply(reply: Reply)->Bool{
        
        viewContext.delete(reply)
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        deleteReply = Reply()
        return true
    }
}



extension Optional where Wrapped == NSSet {
    func array<T: Hashable>(of: T.Type) -> [T] {
        if let set = self as? Set<T> {
            return Array(set)
        }
        return [T]()
    }
}



/*
struct postDetail_Previews: PreviewProvider {
    static var previews: some View {
        postDetail()
    }
}
*/
