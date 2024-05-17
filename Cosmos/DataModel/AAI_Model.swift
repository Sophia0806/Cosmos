//
//  AAI_Model.swift
//  Cosmos
//
//  Created by 😏 😏 on 16/1/2023.
//

import Foundation
class AAI_Model : ObservableObject{
    
    static func createModel() -> AAI {
        let description = "Please answer how often each of the following applies to you. "
        return AAI(AAIModel: AAI_Data, guidance: description)
    }
    
    @Published var model = AAI_Model.createModel()
    
}

extension AAI_Model
{
    static var AAI_Data: [AAIModel] {
        [
            AAIModel( id: 1,
                        question_content: "I check my appearance (e.g. in mirrors, by touching with my fingers or by taking photos of myself)."),
            AAIModel( id: 2,
                        question_content: "I compare aspects of my appearance to others."),
            AAIModel( id: 3,
                        question_content: "I avoid situations or people because of my appearance."),
            AAIModel( id: 4,
                        question_content: "I think about how to camouflage or alter my appearance."),
            AAIModel( id: 5,
                        question_content: "I avoid reflective surfaces, photos, or videos of myself."),
            AAIModel( id: 6,
                        question_content: "I try to camouflage or alter aspects of my appearance."),
            AAIModel( id: 7,
                        question_content: "I brood about past events or reasons to explain why I look the way I do."),
            AAIModel( id: 8,
                        question_content: "I am focused on how I feel I look rather than on my surroundings."),
            AAIModel( id: 9,
                        question_content: "I discuss my appearance with others or question them about it."),
            AAIModel( id: 10,
                        question_content: "I try to prevent people from seeing aspects of my appearance within particular situations (e.g., by changing my posture, avoiding bright lights).")
        ]
    }
}
