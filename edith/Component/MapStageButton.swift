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
    var isCurrent:Bool
    @State var pointerOffset: CGFloat = 0
    let offset = CGFloat(8)
    
    var width = CGFloat(250)
    
    func makeBody(configuration: Configuration) -> some View {
        VStack{
            VStack{
                if(isCurrent){
                    
                    Image("pinPointMap")
                        .resizable()
                        .scaledToFit()
                        .frame(width: width*0.45, height: width)
                        .offset(y: pointerOffset)
                    
                }
                
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
                
                
            }
            .task {
                withAnimation(Animation.easeOut(duration: 1).repeatForever()){
                    pointerOffset = width*0.1
                    
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
        .buttonStyle(MapStageButton(color: Color.orangeFox50, isActive: true, isCurrent: true))
    }
}
