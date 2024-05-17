//
//  Home.swift
//  Cosmos
//
//  Created by 😏 😏 on 20/10/2022.
//

import SwiftUI

struct Home: View {
    @Binding var user : Account
    @Binding var loginStatus : Bool
    
    @Binding var existDiary : Bool
    @Binding var mood : String
    @Binding var weather : String
    @Binding var content : String
    
    @State private var selection: Tab = .test
    enum Tab {
        case test
        case discussion
        case diary
        case game
        case profile
    }
    
    var body: some View {
        TabView(selection: $selection) {
            testHome()
                .tabItem{
                    Label("Test",systemImage: "books.vertical")
                }
                .tag(Tab.test)
            
            discussionHome(user: self.$user)
                .tabItem{
                    Label("Discussion",systemImage: "person.3.sequence")
                }
                .tag(Tab.discussion)
            
            diaryHome(user: self.$user, existDiary: self.$existDiary, mood: self.$mood, weather: self.$weather, content: self.$content)
                .tabItem{
                    Label("Diary",systemImage: "rectangle.and.pencil.and.ellipsis")
                }
                .tag(Tab.diary)
            
            gameHome()
                .tabItem{
                    Label("Game",systemImage: "gamecontroller")
                }
                .tag(Tab.game)
            
            profileHome(user: self.$user, loginStatus: self.$loginStatus)
                .tabItem{
                    Label("Profile",systemImage: "person.icloud")
                }
                .tag(Tab.profile)
        }
    }
}

/*
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
*/
