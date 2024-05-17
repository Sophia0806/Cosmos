//
//  IPS.swift
//  Cosmos
//
//  Created by 😏 😏 on 14/1/2023.
//

import Foundation

struct IPS: Hashable, Codable {
    var IPSModel : [IPSModel]
    var guidance : String
}

struct IPSModel: Hashable, Codable, Identifiable {
    var id : Int
    var question_content : String
    var optionsList: [IPSOption]
}

struct IPSOption: Hashable, Codable, Identifiable{
    var id : Int
    var optionId: String
    var content : String
    var score : Int
}
