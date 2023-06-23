//
//  Map1View.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 22/06/23.
//

import SwiftUI

struct Map1View: View {
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Image("map-1")
                    .resizable()
                    .scaledToFill()
                HStack{
                    CloudView(
                        
                        image: .constant(String("cloud")),
                        moveOffsetLeft:.constant(CGFloat(-50)), moveOffsetRight: .constant(CGFloat(50))
                    )
                }.offset(x:350,y:-370)
                HStack{
                    CloudView(
                        
                        image: .constant(String("cloud")),
                        moveOffsetLeft:.constant(CGFloat(-50)), moveOffsetRight: .constant(CGFloat(50))
                    )
                }.offset(x:-350,y:-250)
                HStack{
                    CloudView(
                        
                        image: .constant(String("cloud")),
                        moveOffsetLeft:.constant(CGFloat(-50)), moveOffsetRight: .constant(CGFloat(50))
                    )
                }.offset(x:-150,y:-350)
                HStack{
                    CloudView(
                        
                        image: .constant(String("cloud-flip")),
                        moveOffsetLeft:.constant(CGFloat(50)), moveOffsetRight: .constant(CGFloat(-50))
                    )
                }.offset(x:200,y:-250)
                HStack{
                    CloudView(
                        
                        image: .constant(String("cloud-flip")),
                        moveOffsetLeft:.constant(CGFloat(-50)), moveOffsetRight: .constant(CGFloat(50))
                    )
                }.offset(x:0,y:-180)
                Rectangle().fill(Color.white.opacity(0.6)).frame(maxWidth: .infinity,maxHeight: .infinity)
                
                RoadmapView().padding(.leading)
                
                
                
            }
            
        }.ignoresSafeArea()
    }
    }

struct Map1View_Previews: PreviewProvider {
    static var previews: some View {
        Map1View()
    }
}
