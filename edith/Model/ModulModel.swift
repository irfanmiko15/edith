//
//  ModulModel.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 28/06/23.
//

import Foundation

struct ModulModel:Hashable{
    let id=UUID()
    let prompt:String
    let editImage:String
    var listImage:[InteractiveImageModel]=[]
}
