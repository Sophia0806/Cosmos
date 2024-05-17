//
//  LDQ.swift
//  Cosmos
//
//  Created by 😏 😏 on 12/1/2023.
//

import Foundation
import SwiftUI

struct LDQ: Hashable, Codable {
    var LDQModel : [LDQModel]
    var guidance : String
}

struct LDQModel: Hashable, Codable, Identifiable {
    var id : Int
    var question_content : String
    var optionsList = [
        LDQOption(id: 1, optionId: "a", content: "Never", score: 0),
        LDQOption(id: 2, optionId: "b", content: "Sometimes", score: 1),
        LDQOption(id: 3, optionId: "c", content: "Often", score: 2),
        LDQOption(id: 4, optionId: "d", content: "Nearly always", score: 3)
      ]
}

struct LDQOption: Hashable, Codable, Identifiable{
    var id : Int
    var optionId: String
    var content : String
    var score : Int
}
