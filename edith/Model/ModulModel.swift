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
    let prompt:[String]
    let edithImage: [String]
    var listImage:[InteractiveImageModel]=[]
    
    
    init(modulName: String, prompt: [String], edithImage: [String], listImage: [InteractiveImageModel]) {
        self.modulName = modulName
        self.prompt = prompt
        self.edithImage = edithImage
        self.listImage = listImage
    }
}
