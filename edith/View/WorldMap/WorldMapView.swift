//
//  WorldMapView.swift
//  edith
//
//  Created by Muhammad Luthfi on 27/06/23.
//

import SwiftUI

struct WorldMapView: View {
    
    var body: some View {
        NavigationStack{
            GeometryReader { geo in
                ZStack {
                    Image("maps")
                        .resizable()
                        .scaledToFill()
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
                        
                        
                        NavigationLink(destination: Map1View()){
                            
                        }.foregroundColor(.white)
                            .frame(width: 60,height: 40)
                            .position(CGPoint(x: CGFloat(geo.size.width/4+geo.size.width/6), y: CGFloat(geo.size.height/3+geo.size.height/14)))
                            .buttonStyle(MapStageButton(
                                foregroundColor: Color.orangeFox50, shadowColor: Color.orangeFox50, isActive: true, outlineColor: Color.orangeFox50
                            ))
                        
                        NavigationLink(destination: Map1View()){
                            
                        }.foregroundColor(.white)
                            .frame(width: 60,height: 40)
                            .position(CGPoint(x: CGFloat(geo.size.width*3/4-geo.size.width/6), y: CGFloat(geo.size.height*2/3-geo.size.height/10)))
                            .buttonStyle(MapStageButton(
                                foregroundColor: Color.neutral80, shadowColor: Color.neutral80, isActive: false, outlineColor: Color.neutral80
                            ))
                        
                        NavigationLink(destination: Map1View()){
                            
                        }.foregroundColor(.white)
                            .frame(width: 60,height: 40)
                            .position(CGPoint(x: CGFloat(geo.size.width/4+geo.size.width/20), y: CGFloat(geo.size.height-geo.size.height*1/6)))
                            .buttonStyle(MapStageButton(
                                foregroundColor: Color.neutral80, shadowColor: Color.neutral80, isActive: false, outlineColor: Color.neutral80
                            ))
                        Button("Starts Here"){
                            
                        }
                        .foregroundColor(.white)
                        .font(.custom(Font.balooBold, size: 18))
                        .frame(width: 150,height: 40)
                        .buttonStyle(ContainerView(
                            foregroundColor: Color.orangeFox50, shadowColor: Color.orangeFox50
                        ))
                        .position(CGPoint(x: CGFloat(geo.size.width/4+geo.size.width/6), y: CGFloat(geo.size.height/3+(geo.size.height/8)+10)))
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
}

struct WorldMapView_Previews: PreviewProvider {
    static var previews: some View {
        WorldMapView()
    }
}
