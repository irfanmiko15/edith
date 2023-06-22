//
//  StageButton.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 22/06/23.
//

import SwiftUI

struct StageButton: ButtonStyle {
    var foregroundColor:Color
    var shadowColor:Color
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            let offset=CGFloat(5)
            
            //shadowColor
            Circle()
               .fill(shadowColor).offset(y : offset)
            
            //foregroundColor
            Circle()
                .strokeBorder(Color.white,lineWidth: 4)
                .background(Circle().foregroundColor(foregroundColor)).offset(y : configuration.isPressed ? offset : 0)
            
            configuration.label.offset(y : configuration.isPressed ? offset : 0)
        }.compositingGroup()
    }
}

struct StageButton_Previews: PreviewProvider {
    static var previews: some View {
        
        //how to use
        Button("a"){
            
        }
        .foregroundColor(.white)
        .frame(width: 50,height: 50)
        .buttonStyle(StageButton(
            foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40
        ))
    }
}
