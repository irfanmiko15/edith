//
//  MapButton.swift
//  edith
//
//  Created by Muhammad Luthfi on 27/06/23.
//

import SwiftUI

struct MapButton: View {
    var iconName: String
    var size: CGFloat
    var position: CGPoint
    var body: some View {
            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width: size)
                .position(position)
       
    }
}
//
//struct MapButton_Previews: PreviewProvider {
//    static var previews: some View {
//        MapButton()
//    }
//}
