//
//  ChallengeImageModel.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 28/06/23.
//

import Foundation

struct InteractiveImageModel:Hashable, Identifiable, Codable{
    let id=UUID()
    let image:String
    var imageCount:Int?
    var isCorrect:Bool?
    var x: CGFloat
    var y: CGFloat
    
    init(image: String, imageCount: Int? = nil, isCorrect: Bool? = nil, x: CGFloat, y: CGFloat) {
        self.image = image
        self.imageCount = imageCount
        self.isCorrect = isCorrect
        self.x = x
        self.y = y
    }
}
