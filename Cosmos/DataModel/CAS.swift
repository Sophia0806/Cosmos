//
//  CAS.swift
//  Cosmos
//
//  Created by 😏 😏 on 12/1/2023.
//

import Foundation
import SwiftUI

struct CAS: Hashable, Codable {
    var CASModel : [CASModel]
    var guidance : String
}

struct CASModel: Hashable, Codable, Identifiable {
    var id : Int
    
    var optionsList: [CASOption]
}

struct CASOption: Hashable, Codable, Identifiable{
    var id : Int
    var optionId: String
    var content : String
    var score : Int
}
