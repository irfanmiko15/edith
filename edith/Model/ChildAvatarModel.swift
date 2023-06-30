//
//  ChildAvatarModel.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 26/06/23.
//

import Foundation
import SwiftUI
struct ChildAvatarModel:Identifiable, Hashable, Encodable, Decodable{
    let id=UUID()
    let fullImage:String
    let cropImage:String
    var isSelected:Bool
}


