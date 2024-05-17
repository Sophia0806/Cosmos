//
//  HRS_Model.swift
//  Cosmos
//
//  Created by 😏 😏 on 14/1/2023.
//

import Foundation
class HRS_Model : ObservableObject{
    
    static func createModel() -> HRS {
        let description = "Please use the following scale when answering items below:"
        return HRS(HRSModel: HRS_Data, guidance: description)
    }
    
    @Published var model = HRS_Model.createModel()
    
}

extension HRS_Model
{
    static var HRS_Data: [HRSModel] {
        [
            HRSModel( id: 1,
                        question_content: "Because of the clutter or number of possessions, how difficult is it for you to use the rooms in your home?"),
            HRSModel( id: 2,
                        question_content: "To what extent do you have difficulty discarding (or recycling, selling, giving away) ordinary things that other people would get rid of?"),
            HRSModel( id: 3,
                        question_content: "To what extent do you currently have a problem with collecting free things or buying more things than you need or can use or can afford?"),
            HRSModel( id: 4,
                        question_content: "To what extent do you experience emotional distress because of clutter, difficulty discarding or problems with buying or acquiring things?"),
            HRSModel( id: 5,
                        question_content: "To what extent do you experience impairment in your life (daily routine, job / school, social activities, family activities, financial difficulties) because of clutter, difficulty discarding, or problems with buying or acquiring things?")
            
            ]
    }
}
