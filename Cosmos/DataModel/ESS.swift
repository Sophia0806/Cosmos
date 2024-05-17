//
//  ESS.swift
//  Cosmos
//
//  Created by 😏 😏 on 17/11/2022.
//

import Foundation
import SwiftUI

struct ESS: Hashable, Codable {
    var ESSModel : [ESSModel]
    var guidance : String
}

struct ESSModel: Hashable, Codable, Identifiable {
    var id : Int
    var question_content : String
    var optionsList = [
        ESSOption(id: 1, optionId: "a", content: "would never doze", score: 0),
        ESSOption(id: 2, optionId: "b", content: "slight chance of dozing", score: 1),
        ESSOption(id: 3, optionId: "c", content: "moderate chance of dozing", score: 2),
        ESSOption(id: 4, optionId: "d", content: "high chance of dozing", score: 3)
      ]
}

struct ESSOption: Hashable, Codable, Identifiable{
    var id : Int
    var optionId: String
    var content : String
    var score : Int
}
