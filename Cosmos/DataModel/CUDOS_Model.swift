//
//  CUDOS_Model.swift
//  Cosmos
//
//  Created by 😏 😏 on 16/11/2022.
//

import Foundation

class CUDOS_Model : ObservableObject{
    
    static func createModel() -> CUDOS {
        let description = "During the past week, including today...... "
        return CUDOS(CUDOSModel: CUDOS_Data, guidance: description)
    }
    
    @Published var model = CUDOS_Model.createModel()
    
}

extension CUDOS_Model
{
    static var CUDOS_Data: [CUDOSModel] {
        [
            CUDOSModel( id: 1,
                        question_content: "I felt sad or depressed"),
            CUDOSModel( id: 2,
                        question_content: "I was not as interested in my usual activities"),
            CUDOSModel( id: 3,
                        question_content: "My appetite was poor and I didn't feel like eating"),
            CUDOSModel( id: 4,
                        question_content: "My appetite was much greater than usual"),
            CUDOSModel( id: 5,
                        question_content: "I had difficulty sleeping"),
            CUDOSModel( id: 6,
                        question_content: "I was sleeping too much"),
            CUDOSModel( id: 7,
                        question_content: "I felt very fidgety, making it difficult to sit still"),
            CUDOSModel( id: 8,
                        question_content: "I felt physically slowed down, like my body was stuck in mud"),
            CUDOSModel( id: 9,
                        question_content: "My energy level was low"),
            CUDOSModel( id: 10,
                        question_content: "I felt guilty"),
            CUDOSModel( id: 11,
                        question_content: "I thought I was a failure"),
            CUDOSModel( id: 12,
                        question_content: "I had problems concentrating"),
            CUDOSModel( id: 13,
                        question_content: "I had more difficulties making decisions than usual"),
            CUDOSModel( id: 14,
                        question_content: "I wished I was dead"),
            CUDOSModel( id: 15,
                        question_content: "I thought about killing myself"),
            CUDOSModel( id: 16,
                        question_content: "I thought that the future looked hopeless")
            ]
    }
}
