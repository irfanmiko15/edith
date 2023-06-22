//
//  ThreeDIconButton.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 22/06/23.
//

import SwiftUI

struct ThreeDButtonIcon: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            let offset=CGFloat(7)
            
            //shadowColor
            RoundedRectangle(cornerRadius: 20).foregroundColor(Color.).offset(y : offset)
            
            //foregroundColor
            RoundedRectangle(cornerRadius: 20).foregroundColor(foregroundColor).offset(y : configuration.isPressed ? offset : 0)
            
            configuration.label.offset(y : configuration.isPressed ? offset : 0)
        }.compositingGroup()
    }
}

struct ThreeDIconButton_Previews: PreviewProvider {
    static var previews: some View {
        Button{
            
        }label:{
            
        }
    }
}
