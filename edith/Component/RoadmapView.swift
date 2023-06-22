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
            HStack{
               
                ZStack {
                    
                    VStack(alignment: .leading){
                        ZStack{
                            Stage1()
                                .stroke(Color.white, style: StrokeStyle(lineWidth: 60, lineCap: .round, lineJoin: .round))
                            //.frame(width: 184, height: 140)
                                .offset(x: 80, y: -10)
                            Stage1()
                                .stroke(Color.greenHill50, style: StrokeStyle(lineWidth: 35, lineCap: .round, lineJoin: .round))
                            //.frame(width: 184, height: 140)
                                .offset(x: 80, y: -10)
                        }.padding()
                        Button{
                            
                        }label:{
                            Image(systemName: "book").foregroundColor(Color.white).font(.system(size:40))
                        }
                        .frame(width:200,height: 200)
                        .buttonStyle(StageButton(
                            foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40
                        )).position(x: 100, y: 180)
                        
                        
                    }
                    ZStack{
                        Stage2().stroke(Color.white, style: StrokeStyle(lineWidth: 60, lineCap: .round, lineJoin: .round)).offset(x: 0, y: 500)
                        Stage2().stroke(Color.greenHill50, style: StrokeStyle(lineWidth: 35, lineCap: .round, lineJoin: .round)).offset(x: 0, y: 500)
                        Button{
                            
                        }label:{
                            Text("1").font(.custom(Font.balooBold, size: 80)).foregroundColor(Color.white).font(.system(size:40))
                        }
                        .frame(width:170,height: 170)
                        .buttonStyle(StageButton(
                            foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40
                        )).position(x: 350, y: 260)
                    }
                    ZStack{
                        Stage3().stroke(Color.greenHill50, style: StrokeStyle(lineWidth: 35, lineCap: .round, lineJoin: .round)).offset(x: 0, y: 700)
                        Button{
                            
                        }label:{
                            Text("2").font(.custom(Font.balooBold, size: 80)).foregroundColor(Color.white).font(.system(size:40))
                        }
                        .frame(width:170,height: 170)
                        .buttonStyle(StageButton(
                            foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40
                        )).position(x: 600, y: 360)
                        
                        
                        
                    }
                    ZStack{
                        FinalStage().stroke(Color.greenHill50, style: StrokeStyle(lineWidth: 35, lineCap: .round, lineJoin: .round)).offset(x: 0, y: 1000)
                        Button{
                            
                        }label:{
                            Text("3").font(.custom(Font.balooBold, size: 80)).foregroundColor(Color.white).font(.system(size:40))
                        }
                        .frame(width:170,height: 170)
                        .buttonStyle(StageButton(
                            foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40
                        )).position(x: 850, y: 250)
                    }
                    ZStack{
                        Button{
                            
                        }label:{
                            Image(systemName: "star").foregroundColor(Color.white).font(.system(size:40))
                        }
                        .frame(width:200,height: 200)
                        .buttonStyle(StageButton(
                            foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40
                        )).position(x: 850, y: 580)
                    }
                    
                }.frame(width:geo.size.width*0.7)
               
            }
            
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
