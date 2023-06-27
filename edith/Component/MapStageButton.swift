//
//  MapStageButton.swift
//  edith
//
//  Created by Muhammad Luthfi on 27/06/23.
//
//
import SwiftUI

struct MapStageButton: ButtonStyle {
    var foregroundColor:Color
    var shadowColor:Color
    var isActive:Bool
    var outlineColor:Color
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            let offset=CGFloat(8)
            if(isActive){
                Ellipse()
                   .fill(outlineColor).offset(y : offset)
                   .blur(radius: 16, opaque: false)
            }
            //shadowColor
            Ellipse()
               .fill(shadowColor).offset(y : offset)
            //foregroundColor
            Ellipse()
                .strokeBorder(Color.white,lineWidth: 10)
                .background(Circle().foregroundColor(foregroundColor)).offset(y : configuration.isPressed ? offset : 0)
            
            configuration.label.offset(y : configuration.isPressed ? offset : 0)
        }.compositingGroup()
    }
}

struct MapStageButton_Previews: PreviewProvider {
    static var previews: some View {
        
        //how to use
        Button("a"){
            
        }
        .foregroundColor(.white)
        .frame(width: 50,height: 30)
        .buttonStyle(MapStageButton(
            foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40, isActive: true, outlineColor: Color.orangeFox50
        ))
    }
}
