//
//  CAS_Model.swift
//  Cosmos
//
//  Created by 😏 😏 on 12/1/2023.
//

import Foundation
import SwiftUI
import Combine

class CAS_Model : ObservableObject{
    
    static func createModel() -> CAS {
        let description = "For each cluster of items, read and identify the statement that best reflects how you feel. "
        return CAS(CASModel: CAS_Data, guidance: description)
    }
    
    @Published var model = CAS_Model.createModel()
    
}

extension CAS_Model
{
    static var CAS_Data: [CASModel] {
        [
            CASModel( id: 1,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "I do not feel angry.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "I feel angry.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "I am angry most of the time now.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "I am so angry and hostile all the time that I can't stand it.", score: 3)
                      ]),
            CASModel( id: 2,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "I am not particularly angry about my future.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "When I think about my future, I feel angry.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "I feel angry about what I have to look forward to.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "I feel intensely angry about my future, since it cannot be improved.", score: 3)
                      ]),
            CASModel( id: 3,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "It makes me angry that I feel like such a failure.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "It makes me angry that I have failed more than the average person.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "As I look back on my life, I feel angry about my failures.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "It makes me angry to feel like a complete failure as a person.", score: 3)
                      ]),
            CASModel( id: 4,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "I am not all that angry about things.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "I am becoming more hostile about things than I used to be.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "I am pretty angry about things these days.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "I am angry and hostile about everything.", score: 3)
                      ]),
            CASModel( id: 5,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "I don't feel particularly hostile at others.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "I feel hostile a good deal of the time.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "I feel quite hostile most of the time.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "I feel hostile all of the time.", score: 3)
                      ]),
            CASModel( id: 6,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "I don't feel that others are trying to annoy me.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "At times I think people are trying to annoy me.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "More people than usual are beginning to make me feel angry.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "I feel that others are constantly and intentionally making me angry.", score: 3)
                      ]),
            CASModel( id: 7,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "I don't feel angry when I think about myself.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "I feel more angry about myself these days than I used to.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "I feel angry about myself a good deal of the time.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "When I think about myself, I feel intense anger.", score: 3)
                      ]),
            CASModel( id: 8,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "I don't have angry feelings about others having screwed up my life.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "It's beginning to make me angry that others are screwing up my life.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "I feel angry that others prevent me from having a good life.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "I am constantly angry because others have made my life totally miserable.", score: 3)
                      ]),
            CASModel( id: 9,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "I don't feel angry enough to hurt someone.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "Sometimes I am so angry that I feel like hurting others, but I would not really do it.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "My anger is so intense that I sometimes feel like hurting others.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "I'm so angry that I would like to hurt someone.", score: 3)
                      ]),
            CASModel( id: 10,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "I don't shout at people any more than usual.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "I shout at others more now than I used to.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "I shout at people all the time now.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "I shout at others so often that sometimes I just can't stop.", score: 3)
                      ]),
            CASModel( id: 11,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "Things are not more irritating to me now than usual.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "I feel slightly more irritated now than usual.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "I feel irritated a good deal of the time.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "I'm irritated all the time now.", score: 3)
                      ]),
            CASModel( id: 12,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "My anger does not interfere with my interest in other people.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "My anger sometimes interferes with my interest in others.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "I am becoming so angry that I don't want to be around others.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "I'm so angry that I can't stand being around people.", score: 3)
                      ]),
            CASModel( id: 13,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "I don't have any persistent angry feelings that influence my ability to make decisions.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "My feelings of anger occasionally undermine my ability to make decisions.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "I am angry to the extent that it interferes with my making good decisions.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "I'm so angry that I can't make good decisions anymore.", score: 3)
                      ]),
            CASModel( id: 14,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "I'm not so angry and hostile that others dislike me.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "People sometimes dislike being around me since I become angry.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "More often than not, people stay away from me because I'm so hostile and angry.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "People don't like me anymore because I'm constantly angry all the time.", score: 3)
                      ]),
            CASModel( id: 15,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "My feelings of anger do not interfere with my work.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "From time to time my feelings of anger interfere with my work.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "I feel so angry that it interferes with my capacity to work.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "My feelings of anger prevent me from doing any work at all.", score: 3)
                      ]),
            CASModel( id: 16,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "My anger does not interfere with my sleep.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "Sometimes I don't sleep very well because I'm feeling angry.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "My anger is so great that I stay awake 1—2 hours later than usual.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "I am so intensely angry that I can't get much sleep during the night.", score: 3)
                      ]),
            CASModel( id: 17,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "My anger does not make me feel anymore tired than usual.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "My feelings of anger are beginning to tire me out.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "My anger is intense enough that it makes me feel very tired.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "My feelings of anger leave me too tired to do anything.", score: 3)
                      ]),
            CASModel( id: 18,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "My appetite does not suffer because of my feelings of anger.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "My feelings of anger are beginning to affect my appetite.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "My feelings of anger leave me without much of an appetite.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "My anger is so intense that it has taken away my appetite.", score: 3)
                      ]),
            CASModel( id: 19,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "My feelings of anger don't interfere with my health.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "My feelings of anger are beginning to interfere with my health.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "My anger prevents me from devoting much time and attention to my health.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "I'm so angry at everything these days that I pay no attention to my health and well- being.", score: 3)
                      ]),
            CASModel( id: 20,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "My ability to think clearly is unaffected by my feelings of anger.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "Sometimes my feelings of anger prevent me from thinking in a clear-headed way.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "My anger makes it hard for me to think of anything else.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "I'm so intensely angry and hostile that it completely interferes with my thinking.", score: 3)
                      ]),
            CASModel( id: 21,
                      optionsList: [
                        CASOption(id: 1, optionId: "a", content: "I don't feel so angry that it interferes with my interest in sex.", score: 0),
                        CASOption(id: 2, optionId: "b", content: "My feelings of anger leave me less interested in sex than I used to be.", score: 1),
                        CASOption(id: 3, optionId: "c", content: "My current feelings of anger undermine my interest in sex.", score: 2),
                        CASOption(id: 4, optionId: "d", content: "I'm so angry about my life that I've completely lost interest in sex.", score: 3)
                      ])
        ]
    }
}


