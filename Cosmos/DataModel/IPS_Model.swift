//
//  IPS_Model.swift
//  Cosmos
//
//  Created by 😏 😏 on 14/1/2023.
//

import Foundation
class IPS_Model : ObservableObject{
    
    static func createModel() -> IPS {
        let description = "Each question in this section consists of five statements. Please read the question carefully and then select the one which best describes you."
        return IPS(IPSModel: IPS_Data, guidance: description)
    }
    
    @Published var model = IPS_Model.createModel()
    
}

extension IPS_Model
{
    static var IPS_Data: [IPSModel] {
        [
            IPSModel( id: 1,
                      question_content: "I delay tasks beyond what is reasonable.",
                      optionsList: [
                        IPSOption(id: 1, optionId: "a", content: "Very Seldom or Not True of Me", score: 1),
                        IPSOption(id: 2, optionId: "b", content: "Seldom True of Me", score: 2),
                        IPSOption(id: 3, optionId: "c", content: "Sometimes True of Me", score: 3),
                        IPSOption(id: 4, optionId: "d", content: "Often True of Me", score: 4),
                        IPSOption(id: 5, optionId: "e", content: "Very Often True, or True of Me", score: 5)
                      ]),
            IPSModel( id: 2,
                      question_content: "I do everything when I believe it needs to be done.",
                      optionsList: [
                        IPSOption(id: 1, optionId: "a", content: "Very Seldom or Not True of Me", score: 5),
                        IPSOption(id: 2, optionId: "b", content: "Seldom True of Me", score: 4),
                        IPSOption(id: 3, optionId: "c", content: "Sometimes True of Me", score: 3),
                        IPSOption(id: 4, optionId: "d", content: "Often True of Me", score: 2),
                        IPSOption(id: 5, optionId: "e", content: "Very Often True, or True of Me", score: 1)
                      ]),
            IPSModel( id: 3,
                      question_content: "I often regret not getting to tasks sooner.",
                      optionsList: [
                        IPSOption(id: 1, optionId: "a", content: "Very Seldom or Not True of Me", score: 1),
                        IPSOption(id: 2, optionId: "b", content: "Seldom True of Me", score: 2),
                        IPSOption(id: 3, optionId: "c", content: "Sometimes True of Me", score: 3),
                        IPSOption(id: 4, optionId: "d", content: "Often True of Me", score: 4),
                        IPSOption(id: 5, optionId: "e", content: "Very Often True, or True of Me", score: 5)
                      ]),
            IPSModel( id: 4,
                      question_content: "There are aspects of my life that I put off, though I know I shouldn't.",
                      optionsList: [
                        IPSOption(id: 1, optionId: "a", content: "Very Seldom or Not True of Me", score: 1),
                        IPSOption(id: 2, optionId: "b", content: "Seldom True of Me", score: 2),
                        IPSOption(id: 3, optionId: "c", content: "Sometimes True of Me", score: 3),
                        IPSOption(id: 4, optionId: "d", content: "Often True of Me", score: 4),
                        IPSOption(id: 5, optionId: "e", content: "Very Often True, or True of Me", score: 5)
                      ]),
            IPSModel( id: 5,
                      question_content: "If there is something I should do, I get to it before attending to lesser tasks.",
                      optionsList: [
                        IPSOption(id: 1, optionId: "a", content: "Very Seldom or Not True of Me", score: 5),
                        IPSOption(id: 2, optionId: "b", content: "Seldom True of Me", score: 4),
                        IPSOption(id: 3, optionId: "c", content: "Sometimes True of Me", score: 3),
                        IPSOption(id: 4, optionId: "d", content: "Often True of Me", score: 2),
                        IPSOption(id: 5, optionId: "e", content: "Very Often True, or True of Me", score: 1)
                      ]),
            IPSModel( id: 6,
                      question_content: "I put things off so long that my well-being or efficiency unnecessarily suffers.",
                      optionsList: [
                        IPSOption(id: 1, optionId: "a", content: "Very Seldom or Not True of Me", score: 1),
                        IPSOption(id: 2, optionId: "b", content: "Seldom True of Me", score: 2),
                        IPSOption(id: 3, optionId: "c", content: "Sometimes True of Me", score: 3),
                        IPSOption(id: 4, optionId: "d", content: "Often True of Me", score: 4),
                        IPSOption(id: 5, optionId: "e", content: "Very Often True, or True of Me", score: 5)
                      ]),
            IPSModel( id: 7,
                      question_content: "At the end of the day, I know I could have spent the time better.",
                      optionsList: [
                        IPSOption(id: 1, optionId: "a", content: "Very Seldom or Not True of Me", score: 1),
                        IPSOption(id: 2, optionId: "b", content: "Seldom True of Me", score: 2),
                        IPSOption(id: 3, optionId: "c", content: "Sometimes True of Me", score: 3),
                        IPSOption(id: 4, optionId: "d", content: "Often True of Me", score: 4),
                        IPSOption(id: 5, optionId: "e", content: "Very Often True, or True of Me", score: 5)
                      ]),
            IPSModel( id: 8,
                      question_content: "I spend my time wisely.",
                      optionsList: [
                        IPSOption(id: 1, optionId: "a", content: "Very Seldom or Not True of Me", score: 5),
                        IPSOption(id: 2, optionId: "b", content: "Seldom True of Me", score: 4),
                        IPSOption(id: 3, optionId: "c", content: "Sometimes True of Me", score: 3),
                        IPSOption(id: 4, optionId: "d", content: "Often True of Me", score: 2),
                        IPSOption(id: 5, optionId: "e", content: "Very Often True, or True of Me", score: 1)
                      ]),
            IPSModel( id: 9,
                      question_content: "When I should be doing one thing, I will do another.",
                      optionsList: [
                        IPSOption(id: 1, optionId: "a", content: "Very Seldom or Not True of Me", score: 1),
                        IPSOption(id: 2, optionId: "b", content: "Seldom True of Me", score: 2),
                        IPSOption(id: 3, optionId: "c", content: "Sometimes True of Me", score: 3),
                        IPSOption(id: 4, optionId: "d", content: "Often True of Me", score: 4),
                        IPSOption(id: 5, optionId: "e", content: "Very Often True, or True of Me", score: 5)
                      ])
        ]
    }
}


