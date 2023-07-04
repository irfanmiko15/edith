//
//  CounterObject.swift
//  edith
//
//  Created by Muhammad Luthfi on 04/07/23.
//

import SwiftUI

struct CounterObject: View {
    var counter = 0
    var maxCount = 4
    var color = Color.blueTang70
    
    var width = CGFloat(200)
    var height = CGFloat(100)
    var fontSize = 20
    var cornerRadius = CGFloat(16)
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.white)
                .frame(width: width, height: height)
            HStack(spacing: 0){
                Text(String(counter))
                    .foregroundColor(color)
                    .font(.custom(Font.balooBold, size: CGFloat(fontSize)))
                Text("/" + String(maxCount))
                    .foregroundColor(Color.neutral80)
                    .font(.custom(Font.balooBold, size: CGFloat(fontSize)))
                
            }
        }
    }
}

struct CounterObject_Previews: PreviewProvider {
    static var previews: some View {
        CounterObject()
    }
}
