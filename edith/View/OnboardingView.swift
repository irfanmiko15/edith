//
//  OnboardingView.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 10/07/23.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var userModel: UserViewModel
    @State var opacityCircle: CGFloat = 0
    @State var isRotating = 0.0
    var width: CGFloat = CGFloat(600)
    var height: CGFloat = CGFloat(300)
    
    var body: some View {
        NavigationStack{
            GeometryReader{reader in
                ZStack{
                    Image("onboardingRotation")
                        .resizable()
                        .scaleEffect(2)
                        .rotationEffect(.degrees(isRotating))
                        .onAppear {
                            withAnimation(.linear(duration: 1)
                                .speed(0.1).repeatForever(autoreverses: false)) {
                                    isRotating = 360.0
                                }
                        }
                    
                    Image("onboardingBackground").resizable().scaledToFill()
                        .position(x: reader.size.width*0.5,
                                  y: reader.size.height*0.55)
                    
                    ZStack{
                        EdithFigure(pose: "happy", width: reader.size.width*0.33)
                            .position(x: reader.size.width*0.5,
                                      y: reader.size.height*0.5 - (reader.size.height*0.05))
                    }
                    
                    
                    Ellipse()
                        .fill(.radialGradient(colors: [Color.white.opacity(0.2)],
                                              center: .center,
                                              startRadius: 300,
                                              endRadius: 300))
                        .shadow(color:Color.white.opacity(0.5),radius: 40)
                        .frame(width: 800, height: 400)
                        .position(x: reader.size.width*0.5,
                                  y:reader.size.height*0.5 + (reader.size.height*0.18))
                    
                    VStack(spacing: 0){
                        Image("adventureWith").resizable().scaledToFit().frame(width: reader.size.width*0.25)
                        Image("editText").resizable().scaledToFit().frame(width: reader.size.width*0.4)
                        if(userModel.dataUser.name.isEmpty){
                            NavigationLink(destination:  ChooseAvatarView(userModel: UserViewModel()).navigationBarBackButtonHidden(true)){
                                Text("PLAY").font(.custom(Font.balooBold, size: 40)).foregroundColor(.white)
                            }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                                .frame(width: reader.size.width*0.25, height: reader.size.height*0.1)
                        }
                        else{
                            NavigationLink(destination: WorldMapView(userModel: UserViewModel(), stageViewModel: StageViewModel()).navigationBarBackButtonHidden(true)){
                                Text("PLAY").font(.custom(Font.balooBold, size: 40)).foregroundColor(.white)
                            }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                                .frame(width: reader.size.width*0.25, height: reader.size.height*0.1)
                        }
                        
                    }.position(x: reader.size.width*0.5,
                               y:reader.size.height*0.5 + (reader.size.height*0.18))
                }
                .ignoresSafeArea()
            }
            
        }.onAppear{
            userModel.load()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(userModel: UserViewModel()).previewInterfaceOrientation(.landscapeRight)
    }
}
