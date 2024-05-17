//
//  HAI.swift
//  Cosmos
//
//  Created by 😏 😏 on 11/11/2022.
//

import Foundation
import SwiftUI

struct HAI: Hashable, Codable {
    var HAIModel : [HAIModel]
    var guidance : String
}

struct HAIModel: Hashable, Codable, Identifiable {
    var id : Int
    
    var optionsList: [HAIOption]    
}

struct HAIOption: Hashable, Codable, Identifiable{
    var id : Int
    var optionId: String
    var content : String
    var score : Int
}
