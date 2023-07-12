//
//  EdithFigure.swift
//  edith
//
//  Created by Muhammad Luthfi on 10/07/23.
//

import SwiftUI

struct EdithFigure: View {
    let pose: String
    @State var opacityCircle: CGFloat = 0.8
    @State var bodyOffset: CGFloat = 0
    @State var headOffset: CGFloat = 0
    
    @State var width: CGFloat = 300
    
    var edithEye = [
        "happy": "edithEyeHappy",
        "sad": "edithEyeSad",
        "normal": "edithEyeNormal",
        "wavingArm": "edithEyeNormal",
        "confuse": "edithEyeNormal"
    ]
    
    var edithArm = [
        "happy": "wavingArm",
        "sad": "normal",
        "normal": "normal",
        "wavingArm": "wavingArm",
        "confuse": "normal"
    ]
    
    var body: some View {
        VStack(alignment: .center){
            ZStack{
                ZStack{
                    Image("edithLeftHand")
                        .resizable()
                        .scaledToFit()
                        .frame(width: width*0.3)
                        .rotationEffect(edithArm[pose] == "wavingArm" ? .degrees(90) : .degrees(0))
                        .offset(x: edithArm[pose] == "wavingArm" ? -width*0.5 : -width*0.275, y: edithArm[pose] == "wavingArm" ? -width*0.35 : -width*0.1)
                    
                    Image("edithRightHand")
                        .resizable()
                        .scaledToFit()
                        .frame(width: width*0.3)
                        .offset(x: width*0.275, y: -width*0.1)
                    
                    Image("edithBody")
                        .resizable()
                        .scaledToFit()
                        .frame(width: width*0.58)
                    
                    Circle()
                        .stroke(RadialGradient(colors: [Color.white, Color.white, Color.white, Color.white, Color.clear], center: .center, startRadius: 0, endRadius: 45), lineWidth: 10)
                        .frame(width: width*0.25)
                        .offset(x:width*0.01, y:-width*0.135)
                        .opacity(opacityCircle)
                    
                }
                .frame(width: width*0.9)
                .offset(y:bodyOffset)
                .shadow(color: .white, radius: width*0.04)
                
                ZStack{
                    Image("edithQuestionMark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: pose == "confuse" ? width*150/500 : 0)
                        .offset(x: -width*0.45, y: -width*0.15)
                    
                    Image("edithHead")
                        .resizable()
                        .scaledToFit()
                        .frame(width: width)
                    
                    Image(edithEye[pose] ?? "happy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: width*0.5)
                        .offset(y: width*0.175)
                }
                .shadow(color: .white, radius: width*0.04)
                .frame(width: width)
                .rotationEffect(pose == "confuse" ? .degrees(10) : .degrees(0))
                .offset(y:headOffset)
                .offset(y: -width*0.825)
                .offset(x: pose == "confuse" ? width*0.05 : 0)
                
                
                Image("edithShadow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width*0.6)
                    .offset(y: width*0.5)
            }
            
        }
        .offset(y: width*0.4)
        .task {
            withAnimation(Animation.easeOut(duration: 1.6).repeatForever()){
                headOffset = 20
                
            }
            withAnimation(Animation.easeOut(duration: 1.75).repeatForever()){
                bodyOffset = 20
                opacityCircle = 0.1
            }
        }
    }
}

struct EdithFigure_Previews: PreviewProvider {
    static var previews: some View {
        EdithFigure(pose: "happy")
    }
}
