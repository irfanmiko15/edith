//
//  Star.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 22/06/23.
//

import SwiftUI

struct Star: View {
    var starValue:String
    var body: some View {
        VStack{
            switch starValue{
            case "":
                 HStack{
                    Image("star-disabled").resizable().scaledToFit().frame(height: 80).offset(x:30,y:20)
                    Image("star-disabled").resizable().scaledToFit().frame(height: 100)
                    Image("star-disabled").resizable().scaledToFit().frame(height: 80).offset(x:-30,y:20)
                }
            case "1":
                 HStack{
                    Image("star-enabled").resizable().scaledToFit().frame(height: 80).offset(x:30,y:20)
                    Image("star-disabled").resizable().scaledToFit().frame(height: 100)
                    Image("star-disabled").resizable().scaledToFit().frame(height: 80).offset(x:-30,y:20)
                }
            case "2":
                 HStack{
                    Image("star-enabled").resizable().scaledToFit().frame(height: 80).offset(x:30,y:20)
                    Image("star-enabled").resizable().scaledToFit().frame(height: 100)
                    Image("star-disabled").resizable().scaledToFit().frame(height: 80).offset(x:-30,y:20)
                }
            case "3":
                 HStack{
                    Image("star-enabled").resizable().scaledToFit().frame(height: 80).offset(x:30,y:20)
                    Image("star-enabled").resizable().scaledToFit().frame(height: 100)
                    Image("star-enabled").resizable().scaledToFit().frame(height: 80).offset(x:-30,y:20)
                }
            default:
                 HStack{}
            }
        }
    }
}

struct Star_Previews: PreviewProvider {
    static var previews: some View {
        Star(starValue: "1")
    }
}
