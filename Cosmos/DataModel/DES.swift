//
//  DES.swift
//  Cosmos
//
//  Created by 😏 😏 on 16/1/2023.
//

import Foundation
import SwiftUI

struct DES: Hashable, Codable {
    var DESModel : [DESModel]
    var guidance : String
}

struct DESModel: Hashable, Codable, Identifiable {
    var id : Int
    var question_content : String
    var optionsList = [
        DESOption(id: 1, optionId: "a", content: "Not at all", score: 0),
        DESOption(id: 2, optionId: "b", content: "Once or twice", score: 1),
        DESOption(id: 3, optionId: "c", content: "Almost every day", score: 2),
        DESOption(id: 4, optionId: "d", content: "About once a day", score: 3),
        DESOption(id: 5, optionId: "e", content: "More than once a day", score: 4)
      ]
}

struct DESOption: Hashable, Codable, Identifiable{
    var id : Int
    var optionId: String
    var content : String
    var score : Int
}
