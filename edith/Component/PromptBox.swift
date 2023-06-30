//
//  PromptBox.swift
//  edith
//
//  Created by Muhammad Luthfi on 30/06/23.
//

import SwiftUI

struct PromptBox: View {
    var textInside: String = "Testing teks banyak banget sampai gamuat gitu karena promptnya gitu kan coba lagi biar tau kalau gamuat gimana"
    var strokeWidth: CGFloat = CGFloat(20)
    var width: CGFloat = CGFloat(600)
    var height: CGFloat = CGFloat(300)
    var textSize: Int = 24
    
    var body: some View{
        ZStack (alignment: .center) {
            VStack{
                Path { path in
                    path.move(to: CGPoint(x: (width*0.1)+(width*0.05), y: 0))
                    path.addLine(to: CGPoint(x: width-(width*0.05), y: 0))
                    path.addCurve(
                        to: CGPoint(x: width, y: 0+(width*0.05)),
                        control1: CGPoint(x: width-(width*0.025), y:0),
                        control2: CGPoint(x: width, y:0+(width*0.025)))
                    
                    path.addLine(to: CGPoint(x: width, y: height-(width*0.05)))
                    path.addCurve(
                        to: CGPoint(x: width-(width*0.05), y: height),
                        control1: CGPoint(x: width, y:height-(width*0.025)),
                        control2: CGPoint(x: width-(width*0.025), y:height))
                    
                    path.addLine(to: CGPoint(x: (width*0.1)+(width*0.05), y: height))
                    path.addCurve(
                        to: CGPoint(x: (width*0.1), y: height-(width*0.05)),
                        control1: CGPoint(x: (width*0.1)+(width*0.025), y:height),
                        control2: CGPoint(x: (width*0.1), y:height-(width*0.025)))
                    path.addLine(to: CGPoint(x: (width*0.1), y: (height*0.5)+(height*0.1)))
                    path.addLine(to: CGPoint(x: (width*0), y: (height*0.5)))
                    path.addLine(to: CGPoint(x: (width*0.1), y: (height*0.5)-(height*0.1)))
                    path.addLine(to: CGPoint(x: (width*0.1), y: 0+(width*0.05)))
                    
                    path.addCurve(
                        to: CGPoint(x: (width*0.1)+(width*0.05), y: 0),
                        control1: CGPoint(x: (width*0.1), y:0+(width*0.025)),
                        control2: CGPoint(x: (width*0.1)+(width*0.025), y:0))
                    path.closeSubpath()
                }
                .fill(Color.white)
            }
            .frame(width: width, height: height)
            
            
            
            Text(textInside)
                .frame(width: width-(width*0.3), height: height)
                .offset(x: (width*0.1)/2)
                .multilineTextAlignment(.center)
                .font(.custom(Font.balooBold, size: CGFloat(textSize)))
            
            
            VStack{
                Path { path in
                    path.move(to: CGPoint(x: (width*0.1)+(width*0.05), y: 0))
                    path.addLine(to: CGPoint(x: width-(width*0.05), y: 0))
                    path.addCurve(
                        to: CGPoint(x: width, y: 0+(width*0.05)),
                        control1: CGPoint(x: width-(width*0.025), y:0),
                        control2: CGPoint(x: width, y:0+(width*0.025)))
                    
                    path.addLine(to: CGPoint(x: width, y: height-(width*0.05)))
                    path.addCurve(
                        to: CGPoint(x: width-(width*0.05), y: height),
                        control1: CGPoint(x: width, y:height-(width*0.025)),
                        control2: CGPoint(x: width-(width*0.025), y:height))
                    
                    path.addLine(to: CGPoint(x: (width*0.1)+(width*0.05), y: height))
                    path.addCurve(
                        to: CGPoint(x: (width*0.1), y: height-(width*0.05)),
                        control1: CGPoint(x: (width*0.1)+(width*0.025), y:height),
                        control2: CGPoint(x: (width*0.1), y:height-(width*0.025)))
                    path.addLine(to: CGPoint(x: (width*0.1), y: (height*0.5)+(height*0.1)))
                    path.addLine(to: CGPoint(x: (width*0), y: (height*0.5)))
                    path.addLine(to: CGPoint(x: (width*0.1), y: (height*0.5)-(height*0.1)))
                    path.addLine(to: CGPoint(x: (width*0.1), y: 0+(width*0.05)))
                    
                    path.addCurve(
                        to: CGPoint(x: (width*0.1)+(width*0.05), y: 0),
                        control1: CGPoint(x: (width*0.1), y:0+(width*0.025)),
                        control2: CGPoint(x: (width*0.1)+(width*0.025), y:0))
                    path.closeSubpath()
                }
                .stroke(Color.orangeFox70, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round, lineJoin: .round))
            }
            .frame(width: width, height: height)
            
            
        }
        .ignoresSafeArea(.all)
    }
}

struct PromptBox_Previews: PreviewProvider {
    static var previews: some View {
        PromptBox()
    }
}
