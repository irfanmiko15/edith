//
//  UserModel.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 28/06/23.
//
import Foundation

import SwiftUI
struct UserModel:Hashable{
    let id=UUID()
    let child:ChildAvatarModel
    let parent:ParentAvatarModel
}
