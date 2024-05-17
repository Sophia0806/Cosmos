//
//  ESS_Model.swift
//  Cosmos
//
//  Created by 😏 😏 on 17/11/2022.
//

import Foundation

class ESS_Model : ObservableObject{
    
    static func createModel() -> ESS {
        let description = "Refers to your usual way of life in recent times, how likely are you to doze off or fall asleep in the situations described below? Even if you haven’t done some of these things recently try to work out how they would have affected you. "
        return ESS(ESSModel: ESS_Data, guidance: description)
    }
    
    @Published var model = ESS_Model.createModel()
    
}

extension ESS_Model
{
    static var ESS_Data: [ESSModel] {
        [
            ESSModel( id: 1,
                        question_content: "Sitting and reading"),
            ESSModel( id: 2,
                        question_content: "Watching TV"),
            ESSModel( id: 3,
                        question_content: "Sitting, inactive in a public place (e.g. a theatre or a meeting)"),
            ESSModel( id: 4,
                        question_content: "As a passenger in a car for an hour without a break"),
            ESSModel( id: 5,
                        question_content: "Lying down to rest in the afternoon when circumstances permit"),
            ESSModel( id: 6,
                        question_content: "Sitting and talking to someone"),
            ESSModel( id: 7,
                        question_content: "Sitting quietly after a lunch without alcohol"),
            ESSModel( id: 8,
                        question_content: "In a car, while stopped for a few minutes in the traffic")
            ]
    }
}
