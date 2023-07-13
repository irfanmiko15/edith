//
//  WorldMapView.swift
//  edith
//
//  Created by Muhammad Luthfi on 27/06/23.
//

import SwiftUI

struct WorldMapView: View {
    @StateObject var userModel: UserViewModel
    @StateObject var stageViewModel: StageViewModel
    var body: some View {
        NavigationStack{
            GeometryReader { reader in
                ZStack {
                    // BACKGROUND
                    ZStack{
                        Image("mapBackground")
                            .resizable()
                            .scaledToFill()
                    }
                    
                    // AVATAR
                    ZStack{
                        CircleAvatar(imageName:userModel.dataUser.child.cropImage, color: Color.orangeFox50)
                            .frame(height: reader.size.width*0.12)
                        CircleAvatar(imageName:userModel.dataUser.parent.image, color: Color.blueTang70)
                            .frame(height: reader.size.width*0.08)
                            .offset(x:-(reader.size.width*0.06),y:reader.size.width*0.025)
                    }.position(x:(reader.size.width*0.94)-(reader.size.width*0.02),y:reader.size.width*0.06+(reader.size.width*0.02))
                    
                    // PATH
                    ZStack{
                        Path { path in
                            path.move(to: CGPoint(x: CGFloat(reader.size.width/4+(reader.size.width/6)+60), y: CGFloat(reader.size.height/3+reader.size.height/11)))
                            path.addCurve(to: CGPoint(x: CGFloat(reader.size.width*3/4-(reader.size.width/6)-30), y: CGFloat(reader.size.height*2/3-reader.size.height/7)),
                                          control1: CGPoint(x: CGFloat(reader.size.width/4+(reader.size.width/6)+80), y: CGFloat(reader.size.height/3+reader.size.height/10)),
                                          control2: CGPoint(x: CGFloat(reader.size.width*3/4-(reader.size.width/6)-70), y: CGFloat(reader.size.height*2/3-reader.size.height/5)))
                        }
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round, dash: [36]))
                        
                        Path { path in
                            path.move(to: CGPoint(x: CGFloat(reader.size.width*3/4-reader.size.width/6), y: CGFloat(reader.size.height*2/3-(reader.size.height/10)+50)))
                            path.addCurve(to: CGPoint(x: CGFloat(reader.size.width/4+(reader.size.width/20)+70), y: CGFloat(reader.size.height-reader.size.height*1/6)),
                                          control1: CGPoint(x: CGFloat(reader.size.width*3/4-reader.size.width/6), y: CGFloat(reader.size.height*2/3+reader.size.height/20)),
                                          control2: CGPoint(x: CGFloat(reader.size.width/4+reader.size.width/8), y: CGFloat(reader.size.height-reader.size.height/6)))
                        }
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round, dash: [36]))
                    }
                    
                    // ICON
                    Group{
                        MapButton(iconName: "mapsIcon1Active",
                                  size: CGFloat(reader.size.width/4),
                                  position: CGPoint(x: CGFloat(reader.size.width/4+reader.size.width/12),
                                                    y: CGFloat(reader.size.height/3-reader.size.height/12)))
                        
                        MapButton(iconName: stageViewModel.checkProgress(stageName: "Challenge 1") ? "mapsIcon2Active" : "mapsIcon2Inactive",
                                  size: CGFloat(reader.size.width/4),
                                  position: CGPoint(x: CGFloat(reader.size.width*3/4-reader.size.width/16),
                                                    y: CGFloat(reader.size.height*1/3+reader.size.height/8)))
                        
                        MapButton(iconName: stageViewModel.checkProgress(stageName: "Challenge 2") ? "mapsIcon3Active" : "mapsIcon3Inactive",
                                  size: CGFloat(reader.size.width/4),
                                  position: CGPoint(x: CGFloat(reader.size.width/4-reader.size.width/12),
                                                    y: CGFloat(reader.size.height-reader.size.height*1/4)))
                    }
                    
                    // CLICKABLE POINT
                    Group{
                        NavigationLink(destination:
                                        Map1View(userModel: UserViewModel())
                            .navigationBarBackButtonHidden(true)){
                                
                            }.foregroundColor(.white)
                            .frame(width: 60,height: 40)
                            .position(CGPoint(x: CGFloat(reader.size.width/4+reader.size.width/6), y: CGFloat(reader.size.height*0.4)))
                            .buttonStyle(MapStageButton(color: Color.orangeFox50, isActive: true, isCurrent: true))
                        
                        NavigationLink(destination:
                                        Map1View(userModel: UserViewModel())
                            .navigationBarBackButtonHidden(true)){
                                
                            }.foregroundColor(.white)
                            .frame(width: 60,height: 40)
                            .position(CGPoint(x: CGFloat(reader.size.width*3/4-reader.size.width/6), y: CGFloat(reader.size.height*2/3-(reader.size.height/10))))
                            .disabled(true)
                            .buttonStyle(MapStageButton(color: Color.neutral80, isActive: false, isCurrent: false))
                        
                        
                        NavigationLink(destination:
                                        Map1View(userModel: UserViewModel())
                            .navigationBarBackButtonHidden(true)){
                                
                            }.foregroundColor(.white)
                            .frame(width: 60,height: 40)
                            .position(CGPoint(x: CGFloat(reader.size.width*0.3), y: CGFloat(reader.size.height*0.84)))
                            .disabled(true)
                            .buttonStyle(MapStageButton(color: Color.neutral80, isActive: false, isCurrent: false))
                    }
                }
                .ignoresSafeArea()
            }.onAppear{
                userModel.load()
            }
        }.onAppear{
            SoundControl()
                .playMapSong()
        }
    }
}

struct WorldMapView_Previews: PreviewProvider {
    static var previews: some View {
        WorldMapView(userModel: UserViewModel(), stageViewModel: StageViewModel())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
