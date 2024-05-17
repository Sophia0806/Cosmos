//
//  ED15.swift
//  Cosmos
//
//  Created by 😏 😏 on 16/1/2023.
//

import Foundation
import SwiftUI

struct ED15: Hashable, Codable {
    var ED15Model : [ED15Model]
    var guidance : String
}

struct ED15Model: Hashable, Codable, Identifiable {
    var id : Int
    var question_content : String
    var optionsList = [
        ED15Option(id: 1, optionId: "a", content: "Not at all", score: 0),
        ED15Option(id: 2, optionId: "b", content: "Rarely", score: 1),
        ED15Option(id: 3, optionId: "c", content: "Occassionally", score: 2),
        ED15Option(id: 4, optionId: "d", content: "Sometimes", score: 3),
        ED15Option(id: 5, optionId: "e", content: "Often", score: 4),
        ED15Option(id: 6, optionId: "f", content: "Most of the time", score: 5),
        ED15Option(id: 7, optionId: "g", content: "All the time", score: 6)
      ]
}

struct ED15Option: Hashable, Codable, Identifiable{
    var id : Int
    var optionId: String
    var content : String
    var score : Int
}
