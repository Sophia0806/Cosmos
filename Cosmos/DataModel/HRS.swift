//
//  HRS.swift
//  Cosmos
//
//  Created by 😏 😏 on 14/1/2023.
//

import Foundation
import SwiftUI

struct HRS: Hashable, Codable {
    var HRSModel : [HRSModel]
    var guidance : String
}

struct HRSModel: Hashable, Codable, Identifiable {
    var id : Int
    var question_content : String
    var optionsList = [
        HRSOption(id: 1, optionId: "a", content: "0", score: 0),
        HRSOption(id: 2, optionId: "b", content: "1", score: 1),
        HRSOption(id: 3, optionId: "c", content: "2", score: 2),
        HRSOption(id: 4, optionId: "d", content: "3", score: 3),
        HRSOption(id: 5, optionId: "e", content: "4", score: 4),
        HRSOption(id: 6, optionId: "f", content: "5", score: 5),
        HRSOption(id: 7, optionId: "g", content: "6", score: 6),
        HRSOption(id: 8, optionId: "h", content: "7", score: 7),
        HRSOption(id: 9, optionId: "i", content: "8", score: 8)
    ]
}

struct HRSOption: Hashable, Codable, Identifiable{
    var id : Int
    var optionId: String
    var content : String
    var score : Int
}
