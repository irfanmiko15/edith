//
//  CloudView.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 22/06/23.
//

import SwiftUI

struct CloudView: View {
            @Binding var image:String
            @State var move=false
            @Binding var moveOffsetLeft:CGFloat
            @Binding var moveOffsetRight:CGFloat
            
            var body: some View {
                Image(image).resizable().scaledToFit().frame(height: 80).offset(x: move ? moveOffsetLeft : moveOffsetRight ).task{
                    withAnimation(.easeInOut(duration: 1).speed(0.5).repeatForever()){
                        move.toggle()
                    }
                }
            }
}


