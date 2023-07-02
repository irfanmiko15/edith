//
//  ContainerView.swift
//  edith
//
//  Created by Muhammad Luthfi on 28/06/23.
//

import SwiftUI

struct ContainerView: View {
    var textInside: String = "Testing teks banyak"
    var strokeWidth: CGFloat = CGFloat(20)
    var width = CGFloat(600)
    var height = CGFloat(300)
    var textSize: Int = 24
    var ratio = 0.001
    
    var body: some View{
        ZStack(alignment: .center){
            VStack{
                Path { path in
                    path.move(to: CGPoint(x: 0+(width*0.05), y: 0))
                    path.addLine(to: CGPoint(x: width-(width*0.1), y: 0))
                    path.addCurve(
                        to: CGPoint(x: width, y: 0+(width*0.1)),
                        control1: CGPoint(x: width-(width*0.1), y:0+(width*0.1)-(width*0.025)),
                        control2: CGPoint(x: width-(width*0.1)+(width*0.025), y:0+(width*0.1)))
                    
                    path.addLine(to: CGPoint(x: width, y: height-(width*0.05)))
                    path.addCurve(
                        to: CGPoint(x: width-(width*0.05), y: height),
                        control1: CGPoint(x: width, y:height-(width*ratio)),
                        control2: CGPoint(x: width-(width*ratio), y:height))
                    
                    path.addLine(to: CGPoint(x: 0+(width*0.05), y: height))
                    path.addCurve(
                        to: CGPoint(x: 0, y: height-(width*0.05)),
                        control1: CGPoint(x: 0+(width*ratio), y:height),
                        control2: CGPoint(x: 0, y:height-(width*ratio)))
                    path.addLine(to: CGPoint(x: 0, y: 0+(width*0.05)))
                    
                    path.addCurve(
                        to: CGPoint(x: 0+(width*0.05), y: 0),
                        control1: CGPoint(x: 0, y:0+(width*ratio)),
                        control2: CGPoint(x: 0+(width*ratio), y:0))
                    path.closeSubpath()
                }
                .fill(Color.white)
            }
            .frame(width: width, height: height)
            
            Text(textInside)
                .frame(width: width-(width*0.3), height: height)
                .offset(x: 0-(width*0.1)/2, y: 0-(height/3))
                .multilineTextAlignment(.center)
                .font(.custom(Font.balooBold, size: CGFloat(textSize)))
            
            
            VStack{
                Path { path in
                    path.move(to: CGPoint(x: 0+(width*0.05), y: 0))
                    path.addLine(to: CGPoint(x: width-(width*0.1), y: 0))
                    path.addCurve(
                        to: CGPoint(x: width, y: 0+(width*0.1)),
                        control1: CGPoint(x: width-(width*0.1), y:0+(width*0.1)-(width*0.025)),
                        control2: CGPoint(x: width-(width*0.1)+(width*0.025), y:0+(width*0.1)))
                    
                    path.addLine(to: CGPoint(x: width, y: height-(width*0.05)))
                    path.addCurve(
                        to: CGPoint(x: width-(width*0.05), y: height),
                        control1: CGPoint(x: width, y:height-(width*ratio)),
                        control2: CGPoint(x: width-(width*ratio), y:height))
                    
                    path.addLine(to: CGPoint(x: 0+(width*0.05), y: height))
                    path.addCurve(
                        to: CGPoint(x: 0, y: height-(width*0.05)),
                        control1: CGPoint(x: 0+(width*ratio), y:height),
                        control2: CGPoint(x: 0, y:height-(width*ratio)))
                    path.addLine(to: CGPoint(x: 0, y: 0+(width*0.05)))
                    
                    path.addCurve(
                        to: CGPoint(x: 0+(width*0.05), y: 0),
                        control1: CGPoint(x: 0, y:0+(width*ratio)),
                        control2: CGPoint(x: 0+(width*ratio), y:0))
                    path.closeSubpath()
                }
                .stroke(Color.orangeFox70, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round, lineJoin: .round))
            }
            .frame(width: width, height: height)
        }
        .ignoresSafeArea(.all)
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView(textInside: "Tes")
        
    }
}
