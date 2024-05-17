//
//  MDQ_Model.swift
//  Cosmos
//
//  Created by 😏 😏 on 17/11/2022.
//

import Foundation

class MDQ_Model : ObservableObject{
    
    static func createModel() -> MDQ {
        let description = "Has there ever been a period of time when you were not your usual self and ......"
        return MDQ(MDQModel: MDQ_Data, guidance: description, lastQ: lastMDQ(id: 15))
    }
    
    @Published var model = MDQ_Model.createModel()
    
}

extension MDQ_Model
{
    static var MDQ_Data: [MDQModel] {
        [
            MDQModel( id: 1,
                        question_content: "you felt so good or so hyper that other people thought you were not your normal self or you were so hyper that you got into trouble?"),
            MDQModel( id: 2,
                        question_content: "you were so irritable that you shouted at people or started fights or arguments?"),
            MDQModel( id: 3,
                        question_content: "you felt much more self-confident than usual?"),
            MDQModel( id: 4,
                        question_content: "you got much less sleep than usual and found you didn’t really miss it?"),
            MDQModel( id: 5,
                        question_content: "you were much more talkative or spoke faster than usual?"),
            MDQModel( id: 6,
                        question_content: "thoughts raced through your head or you couldn’t slow your mind down?"),
            MDQModel( id: 7,
                        question_content: "you were so easily distracted by things around you that you had trouble concentrating or staying on track?"),
            MDQModel( id: 8,
                        question_content: "you had much more energy than usual?"),
            MDQModel( id: 9,
                        question_content: "you were much more active or did many more things than usual?"),
            MDQModel( id: 10,
                        question_content: "you were much more social or outgoing than usual, for example, you telephoned friends in the middle of the night?"),
            MDQModel( id: 11,
                        question_content: "you were much more interested in sex than usual?"),
            MDQModel( id: 12,
                        question_content: "you did things that were unusual for you or that other people might have thought were excessive, foolish, or risky?"),
            MDQModel( id: 13,
                        question_content: "spending money got you or your family into trouble?"),
            MDQModel( id: 14,
                        question_content: "If you chose YES to more than one of the above, have several of these ever happened during the same period of time?")
            ]
    }
}
