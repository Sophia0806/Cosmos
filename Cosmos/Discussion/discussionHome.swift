//
//  discussionHome.swift
//  Cosmos
//
//  Created by 😏 😏 on 22/10/2022.
//

import SwiftUI

struct discussionHome: View {
    @Binding var user : Account
    @State var isShow = false
    var body: some View{
        
        NavigationView{
            ZStack{
                NavigationLink(
                    destination: addDiscussion(isShow: self.$isShow, user: self.$user),
                    isActive: self.$isShow,
                    label: {
                        Text("")
                    }).hidden()
                showDiscussion(isShow: self.$isShow, user: self.$user)
            }
        }
    }
}


struct showDiscussion : View{
    @Binding var isShow : Bool
    @Binding var user : Account
    @State var deleteAlert = false
    @State var deletePost : Post = Post()
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Post.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Post.time, ascending: false)])
    var posts: FetchedResults<Post>
    
    @FetchRequest(entity: Account.entity(), sortDescriptors: [])
    var accounts: FetchedResults<Account>
    
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Rectangle()
                .fill(Color("discussionBg"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
        VStack{
            Image("discussionHeader")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .edgesIgnoringSafeArea(.all)
                .padding(.bottom, -120)
            
            ScrollView(){
                VStack{
                    if self.posts.isEmpty{
                        Text("No posts")
                    }
                    else{
                        ForEach(posts){ post in
                            NavigationLink {
                                postDetail(user: self.$user, post: post, postOwner: post.postBy!)
                            } label: {
                                    postItem(user: self.$user, post: post, time: post.time!, content: post.content!, postOwner: post.postBy!)
                            }
                            .padding(.bottom, 4 )
                            
                            HStack{
                            if(post.postBy!.username == user.username){
                                 Spacer()
                                 Text("Delete")
                                     .foregroundColor(Color("discussionDark"))
                                     .padding([.leading, .trailing], 20)
                                     .font(.system(size: 15))
                                     .onTapGesture {
                                         print("Deletepost")
                                         deletePost = post
                                         deleteAlert = true
                                     }
                                     .alert(isPresented: $deleteAlert) {
                                         Alert(
                                             title: Text("Delete post"),
                                             message: Text("Are you sure to delete this post?"),
                                             primaryButton: .default(
                                                     Text("Yes"),
                                                     action: {deletePost(post: deletePost)}),
                                             secondaryButton: .destructive(
                                                 Text("Cancel"),
                                                 action: {
                                                     deleteAlert = false
                                                 })
                                             )
                                     }
                             }
                            }.padding(.bottom, 10)
                            
                        }
                    
                    }
                }
                
            }
            
        Spacer()
        Button(action: {self.isShow.toggle()}) {
                    Image(systemName: "plus.app")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color("discussionDark"))
            }
        }
        }
    }
    
    func deletePost(post: Post)->Bool{
        deleteAlert = false
        
        post.postBy!.removeFromReleasePost(post)
        //delete replies
        var replies = post.haveReplies.array(of: Reply.self)
        
        /*
        if(replies.isEmpty){
            print("No reply")
        }
        else{
            for reply in replies{
                print(reply.content!)
                print(reply.accountOwner!.username!)
                //reply.accountOwner!.removeFromReleaseReply(reply)
                //post.removeFromHaveReplies(reply)
                viewContext.delete(reply)
                print("delete")
            }
        }
        */
        
        viewContext.delete(post)
        
        do {
            try viewContext.save()
            
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
struct discussionHome_Previews: PreviewProvider {
    static var previews: some View {
        discussionHome()
    }
}
*/

