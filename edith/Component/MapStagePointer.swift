//
//  MapStagePointer.swift
//  edith
//
//  Created by Muhammad Luthfi on 11/07/23.
//

import SwiftUI

struct MapStagePointer: View {
    var textInside: String = "Start Here"
    var strokeWidth: CGFloat = CGFloat(20)
    var width: CGFloat = CGFloat(600)
    var height: CGFloat = CGFloat(300)
    var textSize: Int = 72
    
    var body: some View{
        ZStack (alignment: .center) {
            ZStack{
                Path { path in
                    path.move(to: CGPoint(x: (width*0.05), y: 0))
                    path.addLine(to: CGPoint(x: width-(width*0.05), y: 0))
                    path.addCurve(
                        to: CGPoint(x: width, y: 0+(width*0.05)),
                        control1: CGPoint(x: width-(width*0.025), y:0),
                        control2: CGPoint(x: width, y:0+(width*0.025)))
                    
                    path.addLine(to: CGPoint(x: width-(width*0.075), y: height-(width*0.05)))
                    path.addCurve(
                        to: CGPoint(x: width-(width*0.15), y: height),
                        control1: CGPoint(x: width-(width*0.075), y:height-(width*0.0125)),
                        control2: CGPoint(x: width-(width*0.125), y:height))
                    
                    path.addLine(to: CGPoint(x: (width*0.5)+(width*0.1), y: (height)))
                    path.addLine(to: CGPoint(x: (width*0.5), y: height+(height*0.25)))
                    path.addLine(to: CGPoint(x: (width*0.5)-(width*0.1), y: (height)))
                    
                    path.addLine(to: CGPoint(x: (width*0.15), y: height))
                    path.addCurve(
                        to: CGPoint(x: (width*0.075), y: height-(width*0.05)),
                        control1: CGPoint(x: (width*0.125), y:height),
                        control2: CGPoint(x: width*(0.075), y:height-(width*0.0125)))
                    path.addLine(to: CGPoint(x: 0, y: 0+(width*0.05)))
                    
                    path.addCurve(
                        to: CGPoint(x: (width*0.05), y: 0),
                        control1: CGPoint(x: 0, y:0+(width*0.025)),
                        control2: CGPoint(x: (width*0.025), y:0))
                    path.closeSubpath()
                }
                .fill(Color.orangeFox50)
            }
            .frame(width: width, height: height)
            .position(x: width*0.5, y: height*0.5)
            
            
            Text(textInside)
                .frame(width: width-(width*0.3), height: height)
                .multilineTextAlignment(.center)
                .font(.custom(Font.balooBold, size: CGFloat(textSize)))
                .foregroundColor(Color.white)
            
            
            ZStack{
                Path { path in
                    path.move(to: CGPoint(x: (width*0.05), y: 0))
                    path.addLine(to: CGPoint(x: width-(width*0.05), y: 0))
                    path.addCurve(
                        to: CGPoint(x: width, y: 0+(width*0.05)),
                        control1: CGPoint(x: width-(width*0.025), y:0),
                        control2: CGPoint(x: width, y:0+(width*0.025)))
                    
                    path.addLine(to: CGPoint(x: width-(width*0.05), y: height-(width*0.05)))
                    path.addCurve(
                        to: CGPoint(x: width-(width*0.1), y: height),
                        control1: CGPoint(x: width-(width*0.065), y:height-(width*0.0125)),
                        control2: CGPoint(x: width-(width*0.09), y:height))
                    
                    path.addLine(to: CGPoint(x: (width*0.5)+(width*0.1), y: (height)))
                    path.addLine(to: CGPoint(x: (width*0.5), y: height+(height*0.25)))
                    path.addLine(to: CGPoint(x: (width*0.5)-(width*0.1), y: (height)))
                    
                    path.addLine(to: CGPoint(x: (width*0.1), y: height))
                    path.addCurve(
                        to: CGPoint(x: (width*0.05), y: height-(width*0.05)),
                        control1: CGPoint(x: (width*0.09), y:height),
                        control2: CGPoint(x: width*(0.065), y:height-(width*0.0125)))
                    path.addLine(to: CGPoint(x: 0, y: 0+(width*0.05)))
                    
                    path.addCurve(
                        to: CGPoint(x: (width*0.05), y: 0),
                        control1: CGPoint(x: 0, y:0+(width*0.025)),
                        control2: CGPoint(x: (width*0.025), y:0))
                    path.closeSubpath()
                }
                .stroke(Color.white, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round, lineJoin: .round))
            }
            .frame(width: width, height: height)
            .position(x: width*0.5, y: height*0.5)
            
        }
        .frame(width: width, height: height)
        .ignoresSafeArea(.all)
    }
}

struct MapStagePointer_Previews: PreviewProvider {
    static var previews: some View {
        MapStagePointer()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
