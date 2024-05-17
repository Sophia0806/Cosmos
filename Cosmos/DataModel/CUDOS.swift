//
//  CUDOS.swift
//  Cosmos
//
//  Created by 😏 😏 on 16/11/2022.
//

import Foundation
import SwiftUI

struct CUDOS: Hashable, Codable {
    var CUDOSModel : [CUDOSModel]
    var guidance : String
}

struct CUDOSModel: Hashable, Codable, Identifiable {
    var id : Int
    var question_content : String
    var optionsList = [
        CUDOSOption(id: 1, optionId: "a", content: "not at all true (0 days)", score: 0),
        CUDOSOption(id: 2, optionId: "b", content: "rarely true (1-2 days)", score: 1),
        CUDOSOption(id: 3, optionId: "c", content: "sometimes true (3-4 days)", score: 2),
        CUDOSOption(id: 4, optionId: "d", content: "often true (5-6 days)", score: 3),
        CUDOSOption(id: 5, optionId: "e", content: "almost always true (every day)", score: 4)
      ]
}

struct CUDOSOption: Hashable, Codable, Identifiable{
    var id : Int
    var optionId: String
    var content : String
    var score : Int
}
