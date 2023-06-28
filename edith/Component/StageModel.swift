//
//  ChallengeModel.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 28/06/23.
//

import Foundation
struct StageModel:Hashable{
    let id=UUID()
    let prompt:String
    var listImage:[InteractiveImageModel]=[]
    var resultParent:[InteractiveImageModel]=[]
    var resultChild:[InteractiveImageModel]=[]
}
