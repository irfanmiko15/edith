//
//  CloseButton.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 06/07/23.
//

import SwiftUI

struct CloseButton: ButtonStyle {
   
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            let offset=CGFloat(8)
            
            //shadowColor
            Circle()
                .fill(Color.orangeFox50).offset(y : offset)
            
            //foregroundColor
            Circle()
                .strokeBorder(Color.white,lineWidth: 10)
                .background(Circle().foregroundColor(Color.orangeFox70)).offset(y : configuration.isPressed ? offset : 0)
            
            configuration.label.offset(y : configuration.isPressed ? offset : 0)
        }.compositingGroup()
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("a"){
            
        }.buttonStyle(CloseButton())
    }
}
