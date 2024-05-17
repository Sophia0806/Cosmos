//
//  ED15_Model.swift
//  Cosmos
//
//  Created by 😏 😏 on 16/1/2023.
//

import Foundation
class ED15_Model : ObservableObject{
    
    static func createModel() -> ED15 {
        let description = "This questionnaire considers your eating attitudes and behaviors over the last week. Please complete this measure by ticking the appropriate answers for all items."
        return ED15(ED15Model: ED15_Data, guidance: description)
    }
    
    @Published var model = ED15_Model.createModel()
    
}

extension ED15_Model
{
    static var ED15_Data: [ED15Model] {
        [
            ED15Model( id: 1,
                        question_content: "Worried about losing control over my eating."),
            ED15Model( id: 2,
                        question_content: "Avoided activities or people because of the way I look."),
            ED15Model( id: 3,
                        question_content: "Been preoccupied with thoughts of food and eating. "),
            ED15Model( id: 4,
                        question_content: "Compared my body negatively with others’."),
            ED15Model( id: 5,
                        question_content: "Avoided looking at my body (in mirrors; wearing baggy clothes) because of the way it makes me feel."),
            ED15Model( id: 6,
                        question_content: "Felt distressed about my weight."),
            ED15Model( id: 7,
                        question_content: "Checked my body to reassure myself about my appearance (e.g., weighing myself; using mirrors)"),
            ED15Model( id: 8,
                        question_content: "Felt distressed about my body shape."),
            ED15Model( id: 9,
                        question_content: "Followed strict rules about my eating."),
            ED15Model( id: 10,
                        question_content: "Worried that other people were judging me as a person because of my weight and appearance.")
        ]
    }
}
