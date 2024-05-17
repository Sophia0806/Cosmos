//
//  CPAQ.swift
//  Cosmos
//
//  Created by 😏 😏 on 16/1/2023.
//

import Foundation
import SwiftUI

struct CPAQ: Hashable, Codable {
    var CPAQModel : [CPAQModel]
    var guidance : String
}

struct CPAQModel: Hashable, Codable, Identifiable {
    var id : Int
    var question_content : String
    var optionsList = [
        CPAQOption(id: 1, optionId: "a", content: "Not true", score: 0),
        CPAQOption(id: 2, optionId: "b", content: "Very rarely true", score: 1),
        CPAQOption(id: 3, optionId: "c", content: "Seldom true", score: 2),
        CPAQOption(id: 4, optionId: "d", content: "Sometimes true", score: 3),
        CPAQOption(id: 5, optionId: "e", content: "Often true", score: 4),
        CPAQOption(id: 6, optionId: "f", content: "Almost always true", score: 5),
        CPAQOption(id: 7, optionId: "g", content: "Always time", score: 6)
      ]
}

struct CPAQOption: Hashable, Codable, Identifiable{
    var id : Int
    var optionId: String
    var content : String
    var score : Int
}
