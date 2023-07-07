//
//  ChallengeModel.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 07/07/23.
//

import Foundation
struct ChallengeModel:Identifiable, Hashable, Codable{
    let id=UUID()
    let prompt:String
    let edithImage:String
    let buttonText:String
    var listImage:[InteractiveImageModel]=[]
    
    init(prompt: String, edithImage: String,buttonText:String, listImage: [InteractiveImageModel]) {
        self.prompt = prompt
        self.edithImage = edithImage
        self.buttonText = buttonText
        self.listImage = listImage
    }
}
