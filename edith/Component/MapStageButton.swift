//
//  MapStageButton.swift
//  edith
//
//  Created by Muhammad Luthfi on 27/06/23.
//
//
import SwiftUI

struct MapStageButton: ButtonStyle {
    var color:Color
    var isActive:Bool
    var textStage:String
    
    func makeBody(configuration: Configuration) -> some View {
        VStack{
            let offset=CGFloat(8)
            VStack(spacing: 20){
                ZStack{
                    if(isActive){
                        Ellipse()
                            .fill(color).offset(y : offset)
                            .blur(radius: 16, opaque: false)
                    }
                    //shadowColor
                    Ellipse()
                        .fill(color)
                        .offset(y : offset)
                    
                    //foregroundColor
                    Ellipse()
                        .strokeBorder(Color.white,lineWidth: 10)
                        .background(Circle().foregroundColor(color))
                        .background(Circle().foregroundColor(color)).offset(y : isActive ? (configuration.isPressed ? offset : 0): 0)
                }
                .frame(width: 60, height: 40)
                
                if(isActive){
                    Text(textStage)
                        .foregroundColor(.white)
                        .font(.custom(Font.balooBold, size: 24))
                        .frame(width: 140,height: 50)
                        .background(RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.white,lineWidth: 4)
                            .background(Rectangle().foregroundColor(color)).offset(y :  0)
                            .cornerRadius(8))
                }
                
            }
            
        }
    }
    
    
}

struct MapStageButton_Previews: PreviewProvider {
    static var previews: some View {
        Button(""){
            
        }
        .foregroundColor(.white)
        .frame(width: 50,height: 50)
        .buttonStyle(MapStageButton(color: Color.orangeFox50, isActive: true, textStage: "Stage 1"))
    }
}
