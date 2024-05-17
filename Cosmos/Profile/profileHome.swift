//
//  profileHome.swift
//  Cosmos
//
//  Created by 😏 😏 on 22/10/2022.
//

import SwiftUI

struct profileHome: View {
    @State var changeP = false
    
    @Binding var user : Account
    @Binding var loginStatus : Bool
    
    var body: some View {
        NavigationView{
            ZStack{
                NavigationLink(
                    destination: changePassword(changeP: self.$changeP, user: self.$user),
                    isActive: self.$changeP,
                    label: {
                        Text("")
                    }).hidden()
                profileDetail(changeP: self.$changeP, user: self.$user, loginStatus: self.$loginStatus)
            }
        }
    }
}

