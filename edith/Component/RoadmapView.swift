//
//  RoadmapView.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 22/06/23.
//

import SwiftUI

struct RoadmapView: View {
    var body: some View {
        GeometryReader{geo in
            ZStack{
                
                    //introduction stage
                    Path { path in
                        path.move(to: CGPoint(x:geo.size.width*0.15, y: geo.size.height*0.7))
                        path.addLine(to: CGPoint(x: geo.size.width*0.15, y: geo.size.height*0.3))
                        path.addCurve(
                            to: CGPoint(x: geo.size.width*0.35, y: geo.size.height*0.3),
                            control1: CGPoint(x: geo.size.width*0.15, y:geo.size.height*0.15 ),
                            control2: CGPoint(x: geo.size.width*0.35, y: geo.size.height*0.15))
                    }
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 60, lineCap: .round, lineJoin: .round))
                    Path { path in
                        path.move(to: CGPoint(x:geo.size.width*0.15, y: geo.size.height*0.7))
                        path.addLine(to: CGPoint(x: geo.size.width*0.15, y: geo.size.height*0.3))
                        path.addCurve(
                            to: CGPoint(x: geo.size.width*0.35, y: geo.size.height*0.3),
                            control1: CGPoint(x: geo.size.width*0.15, y:geo.size.height*0.15 ),
                            control2: CGPoint(x: geo.size.width*0.35, y: geo.size.height*0.15))
                    }
                    .stroke(Color.greenGrass50, style: StrokeStyle(lineWidth: 35, lineCap: .round, lineJoin: .round))
                    Button{
                        
                    }label:{
                        Image( "Book").resizable().scaledToFit().frame(width: geo.size.width*0.1)
                    }
                    .frame(width:geo.size.width*0.15,height: geo.size.width*0.15)
                    .buttonStyle(StageButton(
                        foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40
                    )).position(x:geo.size.width*0.15, y: geo.size.height*0.7)
                
               
                    Path { path in
                        path.move(to: CGPoint(x:geo.size.width*0.35, y: geo.size.height*0.3))
                        path.addLine(to: CGPoint(x: geo.size.width*0.35, y: geo.size.height*0.6)
                        )
                        path.addCurve(to: CGPoint(x: geo.size.width*0.6, y: geo.size.height*0.6),
                                      control1: CGPoint(x: geo.size.width*0.35, y:geo.size.height*0.8 ),
                                      control2: CGPoint(x: geo.size.width*0.6, y: geo.size.height*0.8))
                    }
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 60, lineCap: .round, lineJoin: .round))
                    
                    Path { path in
                        path.move(to: CGPoint(x:geo.size.width*0.35, y: geo.size.height*0.3))
                        path.addLine(to: CGPoint(x: geo.size.width*0.35, y: geo.size.height*0.6)
                        )
                        path.addCurve(to: CGPoint(x: geo.size.width*0.6, y: geo.size.height*0.6),
                                      control1: CGPoint(x: geo.size.width*0.35, y:geo.size.height*0.8 ),
                                      control2: CGPoint(x: geo.size.width*0.6, y: geo.size.height*0.8))
                    }
                    .stroke(Color.greenGrass50, style: StrokeStyle(lineWidth: 35, lineCap: .round, lineJoin: .round))
                    VStack{
                        Star(starValue: "3")
                        Button{
                            
                        }label:{
                            Text("1").font(.custom(Font.balooBold, size: 80)).foregroundColor(Color.white).font(.system(size:40))
                        }
                        .frame(width:geo.size.width*0.13,height: geo.size.width*0.13)
                        .buttonStyle(StageButton(
                            foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40
                        ))
                    }.position(x:geo.size.width*0.35, y: geo.size.height*0.3)
                
                
               
                    Path { path in
                        path.move(to: CGPoint(x:geo.size.width*0.6, y: geo.size.height*0.6))
                        path.addLine(to: CGPoint(x: geo.size.width*0.6, y: geo.size.height*0.3))
                        path.addCurve(
                            to: CGPoint(x: geo.size.width*0.8, y: geo.size.height*0.3),
                            control1: CGPoint(x: geo.size.width*0.6, y:geo.size.height*0.15 ),
                            control2: CGPoint(x: geo.size.width*0.8, y: geo.size.height*0.15))
                    }
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 60, lineCap: .round, lineJoin: .round))
                
                
                    Path { path in
                        path.move(to: CGPoint(x:geo.size.width*0.6, y: geo.size.height*0.6))
                        path.addLine(to: CGPoint(x: geo.size.width*0.6, y: geo.size.height*0.3))
                        path.addCurve(
                            to: CGPoint(x: geo.size.width*0.8, y: geo.size.height*0.3),
                            control1: CGPoint(x: geo.size.width*0.6, y:geo.size.height*0.15 ),
                            control2: CGPoint(x: geo.size.width*0.8, y: geo.size.height*0.15))
                    }
                    .stroke(Color.neutral80, style: StrokeStyle(lineWidth: 35, lineCap: .round, lineJoin: .round))
            
            }
            
            Path { path in
                path.move(to: CGPoint(x:geo.size.width*0.8, y: geo.size.height*0.3))
                path.addLine(to: CGPoint(x: geo.size.width*0.8, y: geo.size.height*0.7))
                
            }
            .stroke(Color.white, style: StrokeStyle(lineWidth: 60, lineCap: .round, lineJoin: .round))
            Path { path in
                path.move(to: CGPoint(x:geo.size.width*0.8, y: geo.size.height*0.3))
                path.addLine(to: CGPoint(x: geo.size.width*0.8, y: geo.size.height*0.7))
                
            }
            .stroke(Color.neutral80, style: StrokeStyle(lineWidth: 35, lineCap: .round, lineJoin: .round))
            
            VStack{
                Star(starValue: "1")
                Button{
                    
                }label:{
                    Text("2").font(.custom(Font.balooBold, size: 80)).foregroundColor(Color.white).font(.system(size:40))
                }
                .frame(width:geo.size.width*0.13,height: geo.size.width*0.13)
                .buttonStyle(StageButton(
                    foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40
                ))
            }.position(x: geo.size.width*0.6, y: geo.size.height*0.6)
            
            VStack{
                
                Button{
                    
                }label:{
                    Text("3").font(.custom(Font.balooBold, size: 80)).foregroundColor(Color.white).font(.system(size:40))
                }
                .frame(width:geo.size.width*0.13,height: geo.size.width*0.13)
                .buttonStyle(StageButton(
                    foregroundColor: Color.neutral50, shadowColor: Color.neutral40
                ))
            }.position(x: geo.size.width*0.8, y: geo.size.height*0.35)
            VStack{
                
                Button{
                    
                }label:{
                    Image( "Mountain").resizable().scaledToFit().frame(width: geo.size.width*0.1)
                }
                .frame(width:geo.size.width*0.15,height: geo.size.width*0.15)
                .buttonStyle(StageButton(
                    foregroundColor: Color.neutral50, shadowColor: Color.neutral40
                ))
            }.position(x: geo.size.width*0.8, y: geo.size.height*0.7)
            
            
            
        }
        
    }
        
        
        
    }

struct Stage1: Shape {
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            
            path.move(to: CGPoint(x:0, y: rect.maxX*0.67))
            path.addLine(to: CGPoint(x: rect.minX, y: 200))
            path.addCurve(
                to: CGPoint(x: 250, y: 180),
                control1: CGPoint(x: 0, y: 0),
                control2: CGPoint(x: 250, y: 0))
            
            
        }
    }
}
struct Stage2:Shape{
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            
            path.move(to: CGPoint(x:350, y: -180))
            path.addLine(to: CGPoint(x: 350, y: -50))
            path.addCurve(
                to: CGPoint(x:600, y: -50),
                control1: CGPoint(x: 350, y: 80),
                control2: CGPoint(x: 600, y: 80)
            )
            
            
        }
    }
}
struct Stage3:Shape{
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            
            path.move(to: CGPoint(x:600, y: -400))
            path.addLine(to: CGPoint(x: 600, y: -500))
            path.addCurve(
                to: CGPoint(x:850, y: -500),
                control1: CGPoint(x: 600, y: -680),
                control2: CGPoint(x: 850, y: -680)
            )
            
            
        }
    }
}
struct FinalStage:Shape{
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            
            path.move(to: CGPoint(x:850, y: -680))
            path.addLine(to: CGPoint(x:850, y: -480))
            
            
            
        }
    }
}
struct RoadmapView_Previews: PreviewProvider {
    static var previews: some View {
        RoadmapView()
    }
}
