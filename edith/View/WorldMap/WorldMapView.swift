//
//  WorldMapView.swift
//  edith
//
//  Created by Muhammad Luthfi on 27/06/23.
//

import SwiftUI

struct WorldMapView: View {
    @ObservedObject var userModel: UserViewModel
    var body: some View {
        NavigationStack{
            GeometryReader { geo in
                ZStack {
                    Image("maps")
                        .resizable()
                        .scaledToFill()
                    ZStack{
                        CircleAvatar(imageName:userModel.dataUser.child.cropImage, color: Color.orangeFox50).frame(height: geo.size.width*0.13)
                        CircleAvatar(imageName:userModel.dataUser.parent.image, color: Color.blueTang70).frame(height: geo.size.width*0.10).offset(x:-80,y:80)
                    }.position(x:geo.size.width*0.9,y:geo.size.height*0.15)
                    ZStack{
                        Path { path in
                            path.move(to: CGPoint(x: CGFloat(geo.size.width/4+(geo.size.width/6)+60), y: CGFloat(geo.size.height/3+geo.size.height/11)))
                            path.addCurve(to: CGPoint(x: CGFloat(geo.size.width*3/4-(geo.size.width/6)-30), y: CGFloat(geo.size.height*2/3-geo.size.height/7)),
                                          control1: CGPoint(x: CGFloat(geo.size.width/4+(geo.size.width/6)+80), y: CGFloat(geo.size.height/3+geo.size.height/10)),
                                          control2: CGPoint(x: CGFloat(geo.size.width*3/4-(geo.size.width/6)-70), y: CGFloat(geo.size.height*2/3-geo.size.height/5)))
                        }
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round, dash: [36]))
                        
                        Path { path in
                            path.move(to: CGPoint(x: CGFloat(geo.size.width*3/4-geo.size.width/6), y: CGFloat(geo.size.height*2/3-(geo.size.height/10)+50)))
                            path.addCurve(to: CGPoint(x: CGFloat(geo.size.width/4+(geo.size.width/20)+70), y: CGFloat(geo.size.height-geo.size.height*1/6)),
                                          control1: CGPoint(x: CGFloat(geo.size.width*3/4-geo.size.width/6), y: CGFloat(geo.size.height*2/3+geo.size.height/20)),
                                          control2: CGPoint(x: CGFloat(geo.size.width/4+geo.size.width/8), y: CGFloat(geo.size.height-geo.size.height/6)))
                        }
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round, dash: [36]))
                        
                        MapButton(iconName: "mapsIcon1", size: CGFloat(geo.size.width/4), position: CGPoint(x: CGFloat(geo.size.width/4+geo.size.width/12), y: CGFloat(geo.size.height/3-geo.size.height/12)))
                        
                        MapButton(iconName: "mapsIcon2", size: CGFloat(geo.size.width/4), position: CGPoint(x: CGFloat(geo.size.width*3/4-geo.size.width/12), y: CGFloat(geo.size.height*1/3+geo.size.height/12)))
                        
                        MapButton(iconName: "mapsIcon3", size: CGFloat(geo.size.width/4), position: CGPoint(x: CGFloat(geo.size.width/4-geo.size.width/12), y: CGFloat(geo.size.height-geo.size.height*1/4)))
                        
                        NavigationLink(destination:
                                        Map1View(userModel: UserViewModel())
                            .navigationBarBackButtonHidden(true)){

                        }.foregroundColor(.white)
                            .frame(width: 60,height: 40)
                            .position(CGPoint(x: CGFloat(geo.size.width/4+geo.size.width/6), y: CGFloat(geo.size.height/3+geo.size.height/14+25)))
                            .buttonStyle(MapStageButton(color: Color.orangeFox50, isActive: true, textStage: "Hutan"))
//
//                        NavigationLink(destination: Stage2View(userModel: UserViewModel(), stage: StageModel(prompt: [], listImage: [], resultParent: [], resultChild: []), stageViewModel: StageViewModel())){
//                        }.foregroundColor(.white)
//                            .frame(width: 60,height: 40)
//                            .position(CGPoint(x: CGFloat(geo.size.width*3/4-geo.size.width/6), y: CGFloat(geo.size.height*2/3-(geo.size.height/10)+35)))
//                            .disabled(true)
//                            .buttonStyle(MapStageButton(color: Color.orangeFox50, isActive: true, textStage: "Desa"))
//                        
                    }
                }
                .ignoresSafeArea()
            }
        }.onAppear{
            userModel.load()
        }
    }
}

struct WorldMapView_Previews: PreviewProvider {
    static var previews: some View {
        WorldMapView(userModel: UserViewModel())
    }
}
