//
//  ChallengeModel.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 28/06/23.
//

import Foundation
struct StageModel:Identifiable, Hashable, Codable{
    var id=UUID()
    let stagename: String
    let prompt:[String]
    var listImage:[InteractiveImageModel]=[]
    var resultParent:[InteractiveImageModel]=[]
    var resultChild:[InteractiveImageModel]=[]
    
    init(stagename: String, prompt: [String], listImage: [InteractiveImageModel], resultParent: [InteractiveImageModel], resultChild: [InteractiveImageModel]) {
        self.stagename = stagename
        self.prompt = prompt
        self.listImage = listImage
        self.resultParent = resultParent
        self.resultChild = resultChild
    }
}
