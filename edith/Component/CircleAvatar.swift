//
//  CircleAvatar.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 26/06/23.
//

import SwiftUI

struct CircleAvatar: View {
    var imageName="girlCrop1"
    var color=Color.blueTang70
    var strokeWidth=8
    var body: some View {
        
            ZStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .background(Color.white).clipShape(Circle()).padding(8)
                    .clipShape(Circle()).overlay(Circle().stroke(color,lineWidth: CGFloat(strokeWidth))).background(Color.white).clipShape(Circle())
                
                
            }
        
    }
}

struct CircleAvatar_Previews: PreviewProvider {
    static var previews: some View {
        CircleAvatar()
    }
}
