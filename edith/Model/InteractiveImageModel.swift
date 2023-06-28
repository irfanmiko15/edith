//
//  ChallengeImageModel.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 28/06/23.
//

import Foundation
struct InteractiveImageModel:Hashable{
    let id=UUID()
    let image:String
    var imageCount:Int?
    var isCorrect:Bool
}
