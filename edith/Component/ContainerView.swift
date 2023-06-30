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
    
    var body: some View{
        GeometryReader {reader in
            ZStack{
                VStack{
                    Path { path in
                        path.move(to: CGPoint(x: 0+(reader.size.width*0.05), y: 0))
                        path.addLine(to: CGPoint(x: reader.size.width-(reader.size.width*0.05), y: 0))
                        path.addCurve(
                            to: CGPoint(x: reader.size.width, y: 0+(reader.size.width*0.05)),
                            control1: CGPoint(x: reader.size.width-(reader.size.width*0.05), y:0+(reader.size.width*0.03)),
                            control2: CGPoint(x: reader.size.width-(reader.size.width*0.03), y:0+(reader.size.width*0.05)))
                        
                        path.addLine(to: CGPoint(x: reader.size.width, y: reader.size.height-(reader.size.width*0.05)))
                        path.addCurve(
                            to: CGPoint(x: reader.size.width-(reader.size.width*0.05), y: reader.size.height),
                            control1: CGPoint(x: reader.size.width, y:reader.size.height),
                            control2: CGPoint(x: reader.size.width, y:reader.size.height))
                        
                        path.addLine(to: CGPoint(x: 0+(reader.size.width*0.05), y: reader.size.height))
                        path.addCurve(
                            to: CGPoint(x: 0, y: reader.size.height-(reader.size.width*0.05)),
                            control1: CGPoint(x: 0, y:reader.size.height),
                            control2: CGPoint(x: 0, y:reader.size.height))
                        path.addLine(to: CGPoint(x: 0, y: 0+(reader.size.width*0.05)))
                        
                        path.addCurve(
                            to: CGPoint(x: 0+(reader.size.width*0.05), y: 0),
                            control1: CGPoint(x: 0, y:0),
                            control2: CGPoint(x: 0, y:0))
                    }
                    .stroke(Color.orangeFox50, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.white)
                }
                Text(textInside)
                
            }
            .ignoresSafeArea(.all)
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView(textInside: "Tes")
        
    }
}
