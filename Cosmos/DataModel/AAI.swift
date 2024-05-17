//
//  AAI.swift
//  Cosmos
//
//  Created by 😏 😏 on 16/1/2023.
//

import Foundation
import SwiftUI

struct AAI: Hashable, Codable {
    var AAIModel : [AAIModel]
    var guidance : String
}

struct AAIModel: Hashable, Codable, Identifiable {
    var id : Int
    var question_content : String
    var optionsList = [
        AAIOption(id: 1, optionId: "a", content: "Not at all", score: 0),
        AAIOption(id: 2, optionId: "b", content: "Rarely", score: 1),
        AAIOption(id: 3, optionId: "c", content: "Sometimes", score: 2),
        AAIOption(id: 4, optionId: "d", content: "Often", score: 3),
        AAIOption(id: 5, optionId: "e", content: "All the time", score: 4)
      ]
}

struct AAIOption: Hashable, Codable, Identifiable{
    var id : Int
    var optionId: String
    var content : String
    var score : Int
}
