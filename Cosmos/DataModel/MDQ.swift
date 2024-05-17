//
//  MDQ.swift
//  Cosmos
//
//  Created by 😏 😏 on 17/11/2022.
//

import Foundation
import SwiftUI

struct MDQ: Hashable, Codable {
    var MDQModel : [MDQModel]
    var guidance : String
    var lastQ : lastMDQ
}

struct lastMDQ: Hashable, Codable, Identifiable {
    var id : Int
    var question_content : String = "How much of a problem did any of these cause you — like being unable to work; having family, money, or legal troubles; getting into arguments or fights?"
    var optionsList = [
        MDQOption(id: 1, optionId: "a", content: "No problem", score: 0),
        MDQOption(id: 2, optionId: "b", content: "Minor problem", score: 0),
        MDQOption(id: 3, optionId: "c", content: "Moderate problem", score: 1),
        MDQOption(id: 4, optionId: "d", content: "Serious problem", score: 1)
      ]
}

struct MDQModel: Hashable, Codable, Identifiable {
    var id : Int
    var question_content : String
    var optionsList = [
        MDQOption(id: 1, optionId: "a", content: "Yes", score: 1),
        MDQOption(id: 2, optionId: "b", content: "No", score: 0)
      ]
}

struct MDQOption: Hashable, Codable, Identifiable{
    var id : Int
    var optionId: String
    var content : String
    var score : Int
}
