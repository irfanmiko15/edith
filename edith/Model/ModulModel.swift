//
//  ModulModel.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 28/06/23.
//

import Foundation

struct ModulModel:Identifiable, Hashable, Codable{
    let id=UUID()
    var modulName: String
    let prompt:String
    let edithImage:String
    let buttonText:String
    var listImage:[InteractiveImageModel]=[]
    
    init(modulName: String, prompt: String, edithImage: String,buttonText:String, listImage: [InteractiveImageModel]) {
        self.modulName = modulName
        self.prompt = prompt
        self.edithImage = edithImage
        self.buttonText = buttonText
        self.listImage = listImage
    }
}
