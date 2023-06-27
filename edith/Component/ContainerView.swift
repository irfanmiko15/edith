//
//  ContainerView.swift
//  edith
//
//  Created by Muhammad Luthfi on 28/06/23.
//

import SwiftUI

struct ContainerView: ButtonStyle {
    var foregroundColor:Color
    var shadowColor:Color
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(Color.white,lineWidth: 4)
                .background(Rectangle().foregroundColor(foregroundColor)).offset(y :  0)
                .cornerRadius(8)
            
            configuration.label.offset(y :  0)
        }.compositingGroup()
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        
        //how to use
        Button("a"){
            
        }
        .foregroundColor(.white)
        .frame(width: 100,height: 50)
        .buttonStyle(ContainerView(
            foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40
        ))
    }
}
