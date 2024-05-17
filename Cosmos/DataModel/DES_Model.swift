//
//  DES_Model.swift
//  Cosmos
//
//  Created by 😏 😏 on 16/1/2023.
//

import Foundation
class DES_Model : ObservableObject{
    
    static func createModel() -> DES {
        let description = "For each statement below, please choose the best answer to show how much each thing has happened to you in the past SEVEN (7) DAYS. "
        return DES(DESModel: DES_Data, guidance: description)
    }
    
    @Published var model = DES_Model.createModel()
    
}

extension DES_Model
{
    static var DES_Data: [DESModel] {
        [
            DESModel( id: 1,
                        question_content: "I find myself staring into space and thinking of nothing."),
            DESModel( id: 2,
                        question_content: "People, objects, or the world around me seem strange or unreal."),
            DESModel( id: 3,
                        question_content: "I find that I did things that I do not remember doing"),
            DESModel( id: 4,
                        question_content: "When I am alone, I talk out loud to myself."),
            DESModel( id: 5,
                        question_content: "I feel as though I were looking at the world through a fog so that people and things seem far away or unclear."),
            DESModel( id: 6,
                        question_content: "I am able to ignore pain."),
            DESModel( id: 7,
                        question_content: "I act so differently from one situation to another that it is almost as if I were two different people."),
            DESModel( id: 8,
                        question_content: "I can do things very easily that would usually be hard for me.")
        ]
    }
}
