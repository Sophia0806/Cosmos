//
//  CPAQ_Model.swift
//  Cosmos
//
//  Created by 😏 😏 on 16/1/2023.
//

import Foundation
class CPAQ_Model : ObservableObject{
    
    static func createModel() -> CPAQ {
        let description = "Please rate the truth of each statement as it applies to you. Use the following rating scale to make your choices."
        return CPAQ(CPAQModel: CPAQ_Data, guidance: description)
    }
    
    @Published var model = CPAQ_Model.createModel()
    
}

extension CPAQ_Model
{
    static var CPAQ_Data: [CPAQModel] {
        [
            CPAQModel( id: 1,
                        question_content: "I am getting on with the business of living no matter what my level of pain is."),
            CPAQModel( id: 2,
                        question_content: "My life is going well, even though I have chronic pain."),
            CPAQModel( id: 3,
                        question_content: "It’s OK to experience pain."),
            CPAQModel( id: 4,
                        question_content: "I would gladly sacrifice important things in my life to control this pain better."),
            CPAQModel( id: 5,
                        question_content: "It’s not necessary for me to control my pain in order to handle my life well."),
            CPAQModel( id: 6,
                        question_content: "Although things have changed, I am living a normal life despite my chronic pain."),
            CPAQModel( id: 7,
                        question_content: "I need to concentrate on getting ride of my pain."),
            CPAQModel( id: 8,
                        question_content: "There are many activities I do when I feel pain."),
            CPAQModel( id: 9,
                        question_content: "I lead a full life even though I have chronic pain."),
            CPAQModel( id: 10,
                        question_content: "Controlling my pain is less important than any other goals in my life."),
            CPAQModel( id: 11,
                        question_content: "My thoughts and feelings about pain must change before I can take important steps in my life."),
            CPAQModel( id: 12,
                        question_content: "Despite the pain, I am now sticking to a certain course in my life."),
            CPAQModel( id: 13,
                        question_content: "Keeping my pain level under control takes first priority whenever I’m doing something."),
            CPAQModel( id: 14,
                        question_content: "Before I can make any serious plans, I have to get some control over my pain."),
            CPAQModel( id: 15,
                        question_content: "When my pain increases, I can still take care of my responsibilities."),
            CPAQModel( id: 16,
                        question_content: "I will have better control over my life if I can control my negative thoughts about pain."),
            CPAQModel( id: 17,
                        question_content: "I avoid putting myself in situations where my pain might increase."),
            CPAQModel( id: 18,
                        question_content: "My worries and fears about what pain will do to me are true."),
            CPAQModel( id: 19,
                        question_content: "It’s a great relief to realize that I don’t have to change my pain to get on with life."),
            CPAQModel( id: 20,
                        question_content: "I have to struggle to do things when I have pain.")

        ]
    }
}
