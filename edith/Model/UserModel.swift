//
//  UserModel.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 28/06/23.
//
import Foundation

import SwiftUI
struct UserModel:Hashable,Codable{
    var name:String
    var child:ChildAvatarModel
    var parent:ParentAvatarModel
    init( name:String, child: ChildAvatarModel, parent: ParentAvatarModel) {
    
        self.name=name
            self.child = child
            self.parent = parent
           
        }
}

