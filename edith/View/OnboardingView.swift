//
//  OnboardingView.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 10/07/23.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var userModel: UserViewModel
    var body: some View {
        NavigationStack{
            GeometryReader{reader in
                ZStack{
                    Image("onboardingBackground").resizable().scaledToFill()
                    Image("edithBahagia").resizable().scaledToFit().frame(height: reader.size.height*0.8).offset(x:-20,y:-80)
                    ZStack{
                        Ellipse()
                            .fill(.radialGradient(colors: [Color.white.opacity(0.2)],  center: .center, startRadius: 300, endRadius: 525)).shadow(color:Color.white.opacity(0.5),radius: 40)
                            .frame(width: 700, height: 380)
                        VStack(spacing: 0){
                            Image("adventureWith").resizable().scaledToFit().frame(width: reader.size.width*0.25)
                            Image("editText").resizable().scaledToFit().frame(width: reader.size.width*0.4)
                            NavigationLink(destination: WorldMapView(userModel: UserViewModel())){
                                Text("PLAY").font(.custom(Font.balooBold, size: 40)).foregroundColor(.white)
                            }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                                .frame(width: reader.size.width*0.25, height: reader.size.height*0.1)
                        }
                    }.offset(y:reader.size.height*0.2)
                    
                }.ignoresSafeArea()
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(userModel: UserViewModel()).previewInterfaceOrientation(.landscapeRight)
    }
}
