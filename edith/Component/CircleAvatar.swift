//
//  CircleAvatar.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 26/06/23.
//

import SwiftUI

struct CircleAvatar: View {
    var imageName="girlCrop1"
    var body: some View {
        Group{
            ZStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .background(Color.white).clipShape(Circle()).padding(8)
                    .clipShape(Circle()).overlay(Circle().stroke(.orange,lineWidth: 8))
            
                
            }
        }
    }
}

struct CircleAvatar_Previews: PreviewProvider {
    static var previews: some View {
        CircleAvatar()
    }
}
