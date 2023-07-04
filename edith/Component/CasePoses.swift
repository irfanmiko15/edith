//
//  CasePoses.swift
//  AnimationTrial
//
//  Created by Evelyn Megawati Tiffany on 04/07/23.
//

import SwiftUI

struct CasePoses: View {
    var switchPoses: String
    
    var body: some View {
        
        ZStack{
            
            Image("edithWavingArm")
                .resizable()
                .scaledToFit()
                .frame(width: 190)
                .offset(x:switchPoses == "edithStillArms" ? -45 : -200, y:switchPoses == "edithStillArms" ? -11 : -150)
                .rotationEffect(.degrees(switchPoses == "edithStillArms" ? 260 : 0), anchor: .leading)
            
            Image("edithWavingArm")
                .resizable()
                .scaledToFit()
                .frame(width: 190)
                .offset(x:switchPoses == "edithBothArms" ? -370 : -225, y:switchPoses == "edithBothArms" ? -170 : 170)
                .rotationEffect(.degrees(switchPoses == "edithBothArms" ? 120 : 220), anchor: .leading)
        }
        /*switch switchPoses{
        case "edithWavingArm":
            ZStack{

                Image("edithWavingArm")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 190)
                    .offset(x:-200, y:-150)
                    .rotationEffect(.degrees(0), anchor: .leading)

                Image("edithWavingArm")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 190)
                    .offset(x:-225, y:170)
                    .rotationEffect(.degrees(220), anchor: .leading)

//
////                Image("edithBodyStill")
////                    .resizable()
////                    .scaledToFit()
////                    .frame(width: 280)
            }
        case "edithStillArms":
            ZStack{
                Image("edithWavingArm")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 190)
                    .offset(x:-45, y:-11)
                    .rotationEffect(.degrees(260), anchor: .leading)
                
                Image("edithWavingArm")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 190)
                    .offset(x:-225, y:170)
                    .rotationEffect(.degrees(220), anchor: .leading)
//
//                Image("edithBodyStill")
//                                   .resizable()
//                                   .scaledToFit()
//                                   .frame(width: 280)
            }

        default:
            Text("")
        }*/
        
    }
        
    
    struct CasePoses_Previews: PreviewProvider {
        static var previews: some View {
            CasePoses(switchPoses: String("edithWavingArms"))
        }
    }
}
