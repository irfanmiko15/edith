//
//  ModulModel.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 28/06/23.
//

import Foundation

struct ModulModel:Identifiable, Hashable, Encodable, Decodable{
    let id=UUID()
    let prompt:String
    let editImage:String
    var listImage:[InteractiveImageModel]=[]
}
