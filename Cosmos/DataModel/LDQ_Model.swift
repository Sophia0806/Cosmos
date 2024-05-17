//
//  LDQ_Model.swift
//  Cosmos
//
//  Created by 😏 😏 on 12/1/2023.
//

import Foundation
class LDQ_Model : ObservableObject{
    
    static func createModel() -> LDQ {
        let description = "Think about your drinking/other drug use in the last week and answer each question ticking the closest answer to how you see yourself."
        return LDQ(LDQModel: LDQ_Data, guidance: description)
    }
    
    @Published var model = LDQ_Model.createModel()
    
}

extension LDQ_Model
{
    static var LDQ_Data: [LDQModel] {
        [
            LDQModel( id: 1,
                        question_content: "Do you find yourself thinking about when you will next be able to have another drink or take more drugs?"),
            LDQModel( id: 2,
                        question_content: "Is drinking or taking drugs more important than anything else you might do during the day?"),
            LDQModel( id: 3,
                        question_content: "Do you feel that your need for drink or drugs is too strong to control?"),
            LDQModel( id: 4,
                        question_content: "Do you plan your days around getting and taking drink or drugs?"),
            LDQModel( id: 5,
                        question_content: "Do you drink or take drugs in a particular way in order to increase the effect it gives you?"),
            LDQModel( id: 6,
                        question_content: "Do you take drink or other drugs morning, afternoon and evening?"),
            LDQModel( id: 7,
                        question_content: "Do you feel you have to carry on drinking or taking drugs once you have started?"),
            LDQModel( id: 8,
                        question_content: "Is getting the effect you want more important than the particular drink or drug you use?"),
            LDQModel( id: 9,
                        question_content: "Do you want to take more drink or drugs when the effect starts to wear off?"),
            LDQModel( id: 10,
                        question_content: "Do you find it difficult to cope with life without drink or drugs?")
        ]}
}
