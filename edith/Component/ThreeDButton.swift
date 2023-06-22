//
//  ThreeDButton.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 22/06/23.
//

import SwiftUI

struct ThreeD: ButtonStyle {
    var foregroundColor:Color
    var shadowColor:Color
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            let offset=CGFloat(7)
            
            //shadowColor
            RoundedRectangle(cornerRadius: 20).foregroundColor(shadowColor).offset(y : offset)
            
            //foregroundColor
            RoundedRectangle(cornerRadius: 20).foregroundColor(foregroundColor).offset(y : configuration.isPressed ? offset : 0)
            
            configuration.label.offset(y : configuration.isPressed ? offset : 0)
        }.compositingGroup()
    }
}

struct ThreeDButton_Previews: PreviewProvider {
    static var previews: some View {
        
        //how to use
        Button("text"){
            
        }
        .foregroundColor(Color.white)
        .frame(width:100,height: 50)
        .buttonStyle(ThreeD(
            foregroundColor: Color.greenHill40, shadowColor: Color.greenHill30
        ))
    }
}
