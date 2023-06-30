//
//  ModulModel.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 28/06/23.
//

import Foundation

struct ModulModel:Identifiable, Hashable, Codable{
    let id=UUID()
    let prompt:String
    let editImage:String
    var listImage:[InteractiveImageModel]=[]
    
    init(prompt: String, editImage: String, listImage: [InteractiveImageModel]) {
        self.prompt = prompt
        self.editImage = editImage
        self.listImage = listImage
    }
}
