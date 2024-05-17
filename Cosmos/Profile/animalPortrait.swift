//
//  animalPortrait.swift
//  Cosmos
//
//  Created by 😏 😏 on 22/10/2022.
//

import SwiftUI

struct animalPortrait: View {
    var imageName: String;
    var body: some View {
        VStack{
        Image(imageName)
            .resizable()
            .clipShape(Circle())
            .shadow(radius: 7)
            .frame(width: 100.0, height: 100.0)
        }
    }
}

struct animalPortrait_Previews: PreviewProvider {
    static var previews: some View {
        animalPortrait(imageName: "bear")
    }
}

