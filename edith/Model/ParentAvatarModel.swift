//
//  ParentAvatarModel.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 27/06/23.
//

import Foundation

import SwiftUI
struct ParentAvatarModel:Identifiable, Hashable, Encodable, Decodable{
    let id=UUID()
    let name:String
    let image:String
    var isSelected:Bool
}
