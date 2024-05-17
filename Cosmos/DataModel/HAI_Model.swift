//
//  HAI_Model.swift
//  Cosmos
//
//  Created by 😏 😏 on 11/11/2022.
//

import Foundation
import SwiftUI
import Combine


class HAI_Model : ObservableObject{
    
    static func createModel() -> HAI {
        let description = "Each question in this section consists of four statements. Please read each group of statements carefully and then select the one which best describes your feelings, over the past six months. "
        return HAI(HAIModel: HAI_Data, guidance: description)
    }
    
    @Published var model = HAI_Model.createModel()
    
}

extension HAI_Model
{
    static var HAI_Data: [HAIModel] {
        [
            HAIModel( id: 1,
                      optionsList: [
                        HAIOption(id: 1, optionId: "a", content: "I do not worry about my health", score: 0),
                        HAIOption(id: 2, optionId: "b", content: "I occasionally worry about my health", score: 1),
                        HAIOption(id: 3, optionId: "c", content: "I spend much of my time worrying about my health", score: 2),
                        HAIOption(id: 4, optionId: "d", content: "I spend most of my time worrying about my health", score: 3)
                      ]),
            HAIModel( id: 2,
                      optionsList: [
                        HAIOption(id: 1, optionId: "a", content: "I notice aches / pains less than most other people (of my age)", score: 0),
                        HAIOption(id: 2, optionId: "b", content: "I notice aches / pain a much as most other people (of my age)", score: 1),
                        HAIOption(id: 3, optionId: "c", content: "I notice aches/ pains more than most other people (of my age)", score: 2),
                        HAIOption(id: 4, optionId: "d", content: "I am aware of aches / pains in my body all the time", score: 3)
                      ]),
            HAIModel( id: 3,
                      optionsList: [
                        HAIOption(id: 1, optionId: "a", content: "As a rule I am not aware of bodily sensations or changes", score: 0),
                        HAIOption(id: 2, optionId: "b", content: "Sometimes I am aware of bodily sensations or changes", score: 1),
                        HAIOption(id: 3, optionId: "c", content: "I am often aware of bodily sensations or changes)", score: 2),
                        HAIOption(id: 4, optionId: "d", content: "I am constantly aware of bodily sensations or changes", score: 3)
                      ]),
            HAIModel( id: 4,
                      optionsList: [
                        HAIOption(id: 1, optionId: "a", content: "Resisting thoughts of illness is never a problem", score: 0),
                        HAIOption(id: 2, optionId: "b", content: "Most of the time I can resist thoughts of illness", score: 1),
                        HAIOption(id: 3, optionId: "c", content: "I try to resist thoughts of illness but am often unable to do so", score: 2),
                        HAIOption(id: 4, optionId: "d", content: "Thoughts of illness are so strong that I no longer even try to resist them", score: 3)
                      ]),
            HAIModel( id: 5,
                      optionsList: [
                        HAIOption(id: 1, optionId: "a", content: "As a rule I am not afraid that I have a serious illness", score: 0),
                        HAIOption(id: 2, optionId: "b", content: "I am sometimes afraid that I have a serious illness", score: 1),
                        HAIOption(id: 3, optionId: "c", content: " I am often afraid that I have a serious illness", score: 2),
                        HAIOption(id: 4, optionId: "d", content: "I am always afraid that I have a serious illness", score: 3)
                      ]),
            HAIModel( id: 6,
                      optionsList: [
                        HAIOption(id: 1, optionId: "a", content: "I do not have images (mental pictures) of myself being ill", score: 0),
                        HAIOption(id: 2, optionId: "b", content: "I occasionally have images of myself being ill", score: 1),
                        HAIOption(id: 3, optionId: "c", content: " I frequently have images of myself being ill", score: 2),
                        HAIOption(id: 4, optionId: "d", content: "I constantly have images of myself being ill", score: 3)
                      ]),
            HAIModel( id: 7,
                      optionsList: [
                        HAIOption(id: 1, optionId: "a", content: "I do not have any difficulty taking my mind off thoughts about my health", score: 0),
                        HAIOption(id: 2, optionId: "b", content: "I sometimes have difficulty taking my mind off thoughts about my health", score: 1),
                        HAIOption(id: 3, optionId: "c", content: "I often have difficulty in taking my mind off thoughts about my health", score: 2),
                        HAIOption(id: 4, optionId: "d", content: "Nothing can take my mind off thoughts about my health", score: 3)
                      ]),
            HAIModel( id: 8,
                      optionsList: [
                        HAIOption(id: 1, optionId: "a", content: "I am lastingly relieved if my doctor tells me there is nothing wrong", score: 0),
                        HAIOption(id: 2, optionId: "b", content: "I am initially relieved but the worries sometimes return later", score: 1),
                        HAIOption(id: 3, optionId: "c", content: "I am initially relieved but the worries always return later", score: 2),
                        HAIOption(id: 4, optionId: "d", content: " I am not relieved if my doctor tells me there is nothing wrong", score: 3)
                      ]),
            HAIModel( id: 9,
                      optionsList: [
                        HAIOption(id: 1, optionId: "a", content: "If I hear about an illness I never think I have it myself", score: 0),
                        HAIOption(id: 2, optionId: "b", content: "If I hear about an illness I sometimes think I have it myself", score: 1),
                        HAIOption(id: 3, optionId: "c", content: "If I hear about an illness I often think I have it myself", score: 2),
                        HAIOption(id: 4, optionId: "d", content: "If I hear about an illness I always think I have it myself", score: 3)
                      ]),
            HAIModel( id: 10,
                      optionsList: [
                        HAIOption(id: 1, optionId: "a", content: "If I have a bodily sensation or change I rarely wonder what it means", score: 0),
                        HAIOption(id: 2, optionId: "b", content: "If I have a bodily sensation or change I often wonder what it means", score: 1),
                        HAIOption(id: 3, optionId: "c", content: "If I have a bodily sensation or change I always wonder what it means", score: 2),
                        HAIOption(id: 4, optionId: "d", content: "If I have a bodily sensation or change I must know what it means", score: 3)
                      ]),
            HAIModel( id: 11,
                      optionsList: [
                        HAIOption(id: 1, optionId: "a", content: "I usually feel at very low risk for developing a serious illness", score: 0),
                        HAIOption(id: 2, optionId: "b", content: "I usually feel at fairly low risk for developing a serious illness", score: 1),
                        HAIOption(id: 3, optionId: "c", content: "I usually feel at moderate risk for developing a serious illness", score: 2),
                        HAIOption(id: 4, optionId: "d", content: " I usually feel at high risk for developing a serious illness", score: 3)
                      ]),
            HAIModel( id: 12,
                      optionsList: [
                        HAIOption(id: 1, optionId: "a", content: "I never think I have a serious illness", score: 0),
                        HAIOption(id: 2, optionId: "b", content: "I sometimes think I have a serious illness", score: 1),
                        HAIOption(id: 3, optionId: "c", content: "I often think I have a serious illness", score: 2),
                        HAIOption(id: 4, optionId: "d", content: "I usually think that I am seriously ill", score: 3)
                      ]),
            HAIModel( id: 13,
                      optionsList: [
                        HAIOption(id: 1, optionId: "a", content: "If I notice an unexplained bodily sensation I don’t find it difficult to think about other things", score: 0),
                        HAIOption(id: 2, optionId: "b", content: " If I notice an unexplained bodily sensation I sometimes find it difficult to think about other things", score: 1),
                        HAIOption(id: 3, optionId: "c", content: "If I notice an unexplained bodily sensation I often find it difficult to think about other things", score: 2),
                        HAIOption(id: 4, optionId: "d", content: "If I notice an unexplained bodily sensation I always find it difficult to think about other things", score: 3)
                      ]),
            HAIModel( id: 14,
                      optionsList: [
                        HAIOption(id: 1, optionId: "a", content: "My family / friends would say I do not worry enough about my health", score: 0),
                        HAIOption(id: 2, optionId: "b", content: "My family / friends would say I have a normal attitude towards my health", score: 1),
                        HAIOption(id: 3, optionId: "c", content: "My family / friends would say I worry too much about my health", score: 2),
                        HAIOption(id: 4, optionId: "d", content: "My family / friends would say I am a hypochondriac", score: 3)
                      ]),
            HAIModel( id: 15,
                      optionsList: [
                        HAIOption(id: 1, optionId: "a", content: "If I had a serious illness I would still be able to enjoy things in my life quite a lot", score: 0),
                        HAIOption(id: 2, optionId: "b", content: "If I had a serious illness I would still be able to enjoy things in my life a little", score: 1),
                        HAIOption(id: 3, optionId: "c", content: "If I had a serious illness I would be almost completely unable to enjoy things in my life", score: 2),
                        HAIOption(id: 4, optionId: "d", content: "If I had a serious illness I would be completely unable to enjoy my life at all", score: 3)
                      ]),
            HAIModel( id: 16,
                      optionsList: [
                        HAIOption(id: 1, optionId: "a", content: "If I developed a serious illness there is a good chance that modern medicine would be able to cure me", score: 0),
                        HAIOption(id: 2, optionId: "b", content: "If I developed a serious illness there is a moderate chance that modern medicine would be able to cure me", score: 1),
                        HAIOption(id: 3, optionId: "c", content: "If I developed a serious illness there is a very small chance that modern medicine would be able to cure me", score: 2),
                        HAIOption(id: 4, optionId: "d", content: "If I developed a serious illness there is no chance that modern medicine would be able to cure me", score: 3)
                      ]),
            HAIModel( id: 17,
                      optionsList: [
                        HAIOption(id: 1, optionId: "a", content: "A serious illness would ruin some aspects of my life", score: 0),
                        HAIOption(id: 2, optionId: "b", content: "A serious illness would ruin many aspects of my life", score: 1),
                        HAIOption(id: 3, optionId: "c", content: "A serious illness would ruin almost every aspect of my life", score: 2),
                        HAIOption(id: 4, optionId: "d", content: "A serious illness would ruin every aspect of my life", score: 3)
                      ]),
            HAIModel( id: 18,
                      optionsList: [
                        HAIOption(id: 1, optionId: "a", content: "If I had a serious illness I would not feel that I had lost my dignity", score: 0),
                        HAIOption(id: 2, optionId: "b", content: "If I had a serious illness I would feel that I had lost a little of my dignity", score: 1),
                        HAIOption(id: 3, optionId: "c", content: "If I had a serious illness I would feel that I had lost quite a lot of my dignity", score: 2),
                        HAIOption(id: 4, optionId: "d", content: "If I had a serious illness I would feel that I had totally lost my dignity", score: 3)
                      ])
            
        ]
    }
}


