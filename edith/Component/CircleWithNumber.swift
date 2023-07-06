//
//  CircleWithNumber.swift
//  edith
//
//  Created by Muhammad Luthfi on 06/07/23.
//

import SwiftUI

struct CircleWithNumber: View {
    var textInside="1"
    var color=Color.blueTang70
    var strokeWidth=8
    var size: CGFloat = CGFloat(200)
    var fontSize: CGFloat = CGFloat(64)
    var body: some View {
        
        VStack(spacing: size*0.35){
                Text(textInside)
                    .font(.custom(Font.balooBold, size: fontSize))
                    .frame(width: size, height: size)
                    .foregroundColor(.white)
                    .background(color)
                    .clipShape(Circle()).overlay(Circle().stroke(Color.white,lineWidth: CGFloat(strokeWidth)))
                ZStack{
                    
                    RoundedRectangle(cornerRadius: size/2)
                        .fill(Color.white)
                        .frame(width: size*2, height: size*2)
                    
                    RoundedRectangle(cornerRadius: size/2)
                        .stroke(color, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round, lineJoin: .round))
                        .frame(width: size*2, height: size*2)
//                        .blur(radius: 8)
//                        .clipShape(
//                            RoundedRectangle(cornerRadius: size/2)
//                                .fill(Color.white)
//                                .frame(width: size*2, height: size*2))
                }
                
                
            }
        
    }
}

struct CircleWithNumber_Previews: PreviewProvider {
    static var previews: some View {
        CircleWithNumber()
    }
}
