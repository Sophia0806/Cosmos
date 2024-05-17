//
//  postItem.swift
//  Cosmos
//
//  Created by 😏 😏 on 2/11/2022.
//

import SwiftUI

struct postItem: View {
    @Binding var user : Account
    @ObservedObject var post : Post
    var time : String
    var content : String
    @ObservedObject var postOwner : Account

    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        ZStack(alignment: .topLeading){
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("postItemBg"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            VStack(alignment: .leading){
            HStack{
                Image(postOwner.animal!)
                        .resizable()
                        .frame(width: 60.0, height: 60.0)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                        .frame(alignment: .center)
                        .padding()
                
                    HStack{
                        if(postOwner.username == user.username){
                            Text("Post by you")
                                .foregroundColor(.gray)
                            Text(time)
                                .foregroundColor(.gray)
                            
                        }
                        else{
                            Text("Post by "+postOwner.username!)
                                .foregroundColor(.gray)
                            Text(time)
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(alignment: .top)
               
            }
            .padding(.bottom, -20)
                
              if(length() < 150){
                    Text(content)
                      .foregroundColor(.black)
                      .multilineTextAlignment(.leading)
                      .frame(alignment: .topLeading)
                      .padding([.leading, .trailing], 10)
                      .padding(.bottom, 5)
                }
                else{
                    Text(content.prefix(150)+" ......")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding([.leading, .trailing], 10)
                        .padding(.bottom, 5)
                }
               
            Spacer()
        }
        }
    }
    func length()-> Int{
        let len = content.count
        print(len)
        return len
    }
    
}
/*
struct postItem_Previews: PreviewProvider {
    static var previews: some View {
        postItem()
    }
}
*/
