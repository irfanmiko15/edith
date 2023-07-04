//
//  BackButton.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 27/06/23.
//

import SwiftUI

struct BackThreeD: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            let offset=CGFloat(8)
            
            //shadowColor
            Circle()
                .fill(Color.orangeFox50).offset(y : offset)
            
            //foregroundColor
            Circle()
                .strokeBorder(Color.orangeFox70,lineWidth: 10)
                .background(Circle().foregroundColor(Color.white)).offset(y : configuration.isPressed ? offset : 0)
            
            configuration.label.offset(y : configuration.isPressed ? offset : 0)
        }.compositingGroup()
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        Button{
            
        }label:{
            Image(systemName: "chevron.left").font(.system(size:900).bold())
                .frame(width:60,height: 60)
                .foregroundColor(Color.orangeFox50)
        }.buttonStyle(BackThreeD())
    }
}
