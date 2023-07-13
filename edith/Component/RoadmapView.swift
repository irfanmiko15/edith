//
//  RoadmapView.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 22/06/23.
//

import SwiftUI

struct RoadmapView: View {
    let emptyImageModel:[InteractiveImageModel] = []
    @State var selection: Int? = nil
    @AppStorage("modul1Stage1") var modul1Stage1:Bool=false
    
    @ObservedObject var stageViewModel: StageViewModel
    @ObservedObject var modulViewModel: ModulViewModel
    
    var body: some View {
        GeometryReader{geo in
            ZStack{
                
                ZStack{
                    Group{
                        //modul1 to stage1
                        Path { path in
                            path.move(to: CGPoint(x:geo.size.width*0.18, y: geo.size.height*0.8))
                            path.addLine(to: CGPoint(x: geo.size.width*0.18, y: geo.size.height*0.45))
                            
                        }
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 55, lineCap: .round, lineJoin: .round))
                        
                        Path { path in
                            path.move(to: CGPoint(x:geo.size.width*0.18, y: geo.size.height*0.8))
                            path.addLine(to: CGPoint(x: geo.size.width*0.18, y: geo.size.height*0.45))
                            
                        }
                        .stroke(stageViewModel.checkProgress(stageName: "Modul 1") ? Color.greenGrass50 : Color.neutral80, style: StrokeStyle(lineWidth: 35, lineCap: .round, lineJoin: .round))
                        
                    }
                    
                    Group{
                        //stage 1 to modul 2
                        Path { path in
                            path.move(to: CGPoint(x:geo.size.width*0.18, y: geo.size.height*0.45))
                            path.addLine(to: CGPoint(x: geo.size.width*0.18, y: geo.size.height*0.25))
                            path.addCurve(
                                to: CGPoint(x: geo.size.width*0.38, y: geo.size.height*0.25),
                                control1: CGPoint(x: geo.size.width*0.18, y:geo.size.height*0.1 ),
                                control2: CGPoint(x: geo.size.width*0.38, y: geo.size.height*0.1))
                        }
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 55, lineCap: .round, lineJoin: .round))
                        
                        Path { path in
                            path.move(to: CGPoint(x:geo.size.width*0.18, y: geo.size.height*0.45))
                            path.addLine(to: CGPoint(x: geo.size.width*0.18, y: geo.size.height*0.25))
                            path.addCurve(
                                to: CGPoint(x: geo.size.width*0.38, y: geo.size.height*0.25),
                                control1: CGPoint(x: geo.size.width*0.18, y:geo.size.height*0.1 ),
                                control2: CGPoint(x: geo.size.width*0.38, y: geo.size.height*0.1))
                        }
                        .stroke(stageViewModel.checkProgress(stageName: "Stage 1") ? Color.greenGrass50 : Color.neutral80, style: StrokeStyle(lineWidth: 35, lineCap: .round, lineJoin: .round))
                        
                    }
                    
                    Group{
                        //modul 2 to stage 2
                        Path { path in
                            path.move(to: CGPoint(x:geo.size.width*0.38, y: geo.size.height*0.25))
                            path.addLine(to: CGPoint(x: geo.size.width*0.38, y: geo.size.height*0.6))
                            
                        }.stroke(Color.white, style: StrokeStyle(lineWidth: 55, lineCap: .round, lineJoin: .round))
                        Path { path in
                            path.move(to: CGPoint(x:geo.size.width*0.38, y: geo.size.height*0.25))
                            path.addLine(to: CGPoint(x: geo.size.width*0.38, y: geo.size.height*0.6))
                            
                        }.stroke(stageViewModel.checkProgress(stageName: "Modul 2") ? Color.greenGrass50 : Color.neutral80, style: StrokeStyle(lineWidth: 35, lineCap: .round, lineJoin: .round))
                        
                    }
                    
                    Group{
                        //stage 2 to modul 3
                        Path { path in
                            path.move(to: CGPoint(x: geo.size.width*0.38, y: geo.size.height*0.6))
                            path.addLine(to: CGPoint(x: geo.size.width*0.38, y: geo.size.height*0.6)
                            )
                            path.addCurve(to: CGPoint(x: geo.size.width*0.6, y: geo.size.height*0.6),
                                          control1: CGPoint(x: geo.size.width*0.38, y:geo.size.height*0.85 ),
                                          control2: CGPoint(x: geo.size.width*0.6, y: geo.size.height*0.85))
                        }
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 55, lineCap: .round, lineJoin: .round))
                        Path { path in
                            path.move(to: CGPoint(x: geo.size.width*0.38, y: geo.size.height*0.6))
                            path.addLine(to: CGPoint(x: geo.size.width*0.38, y: geo.size.height*0.6)
                            )
                            path.addCurve(to: CGPoint(x: geo.size.width*0.6, y: geo.size.height*0.6),
                                          control1: CGPoint(x: geo.size.width*0.38, y:geo.size.height*0.85 ),
                                          control2: CGPoint(x: geo.size.width*0.6, y: geo.size.height*0.85))
                        }
                        .stroke(stageViewModel.checkProgress(stageName: "Stage 2") ? Color.greenGrass50 : Color.neutral80, style: StrokeStyle(lineWidth: 35, lineCap: .round, lineJoin: .round))
                        
                    }
                    
                    Group{
                        
                        Path { path in
                            path.move(to: CGPoint(x:geo.size.width*0.6, y: geo.size.height*0.6))
                            path.addLine(to: CGPoint(x: geo.size.width*0.6, y: geo.size.height*0.25))
                            path.addCurve(
                                to: CGPoint(x: geo.size.width*0.8, y: geo.size.height*0.25),
                                control1: CGPoint(x: geo.size.width*0.6, y:geo.size.height*0.1 ),
                                control2: CGPoint(x: geo.size.width*0.8, y: geo.size.height*0.1))
                        }
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 55, lineCap: .round, lineJoin: .round))
                        Path { path in
                            path.move(to: CGPoint(x:geo.size.width*0.6, y: geo.size.height*0.6))
                            path.addLine(to: CGPoint(x: geo.size.width*0.6, y: geo.size.height*0.25))
                            path.addCurve(
                                to: CGPoint(x: geo.size.width*0.8, y: geo.size.height*0.25),
                                control1: CGPoint(x: geo.size.width*0.6, y:geo.size.height*0.1 ),
                                control2: CGPoint(x: geo.size.width*0.8, y: geo.size.height*0.1))
                        }
                        .stroke(stageViewModel.checkProgress(stageName: "Modul 3") ? Color.greenGrass50 : Color.neutral80, style: StrokeStyle(lineWidth: 35, lineCap: .round, lineJoin: .round))
                    }
                    
                    Group{
                        
                        Path { path in
                            path.move(to: CGPoint(x:geo.size.width*0.8, y: geo.size.height*0.3))
                            path.addLine(to: CGPoint(x: geo.size.width*0.8, y: geo.size.height*0.7))
                            
                        }
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 55, lineCap: .round, lineJoin: .round))
                        Path { path in
                            path.move(to: CGPoint(x:geo.size.width*0.8, y: geo.size.height*0.3))
                            path.addLine(to: CGPoint(x: geo.size.width*0.8, y: geo.size.height*0.8))
                            
                        }
                        .stroke(stageViewModel.checkProgress(stageName: "Stage 3") ? Color.greenGrass50 : Color.neutral80, style: StrokeStyle(lineWidth: 35, lineCap: .round, lineJoin: .round))
                    }
                    
                }
                
                ZStack{
                    //modul1
                    NavigationLink(destination: Module1View(modulViewModel: ModulViewModel())){
                        
                        Image("book-open").resizable().scaledToFit().frame(width: geo.size.width*0.07)
                        
                        
                    }
                    .frame(width:geo.size.width*0.14,height: geo.size.width*0.14)
                    .buttonStyle(StageButton(
                        foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40
                    ))
                    .position(x:geo.size.width*0.18, y: geo.size.height*0.8)
                    
                    //stage1
                    VStack{
                        if(stageViewModel.checkProgress(stageName: "Modul 1")){
                            NavigationLink(destination: Stage1View(userModel: UserViewModel(), stage: StageModel(stagename: "Stage 1", prompt: [], listImage: emptyImageModel, resultParent: emptyImageModel, resultChild: emptyImageModel), stageViewModel: StageViewModel())){
                                Text("1").font(.custom(Font.balooBold, size: 80)).foregroundColor(Color.white).font(.system(size:35))
                            }
                            .frame(width:geo.size.width*0.12,height: geo.size.width*0.12)
                            .buttonStyle(StageButton(
                                foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40
                            ))
                        }
                        else{
                            Button{
                                
                            }label:{
                                Text("1").font(.custom(Font.balooBold, size: 80)).foregroundColor(Color.white).font(.system(size:35))
                            }
                            .frame(width:geo.size.width*0.12,height: geo.size.width*0.12)
                            .buttonStyle(StageButtonDisable(
                            ))
                        }
                    }.position(x:geo.size.width*0.18, y: geo.size.height*0.45)
                    
                    
                    //modul 2
                    if(modulViewModel.checkProgress(modulName: "Stage 1")){
                        
                        NavigationLink(destination: Module2View(modulViewModel: ModulViewModel(),userViewModel:UserViewModel(), modul: ModulModel(modulName: "Modul 2", prompt: [], edithImage: [], listImage: []))){
                            
                            Image("book-open").resizable().scaledToFit().frame(width: geo.size.width*0.07)
                        }
                        .frame(width:geo.size.width*0.14,height: geo.size.width*0.14)
                        .buttonStyle(StageButton(foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40))
                        .position(x: geo.size.width*0.38, y: geo.size.height*0.25)
                    } else {
                        
                        Button{
                            
                        }label:{
                            
                            Image("book-open").resizable().scaledToFit().frame(width: geo.size.width*0.07)
                        }
                        .frame(width:geo.size.width*0.14,height: geo.size.width*0.14)
                        .buttonStyle(StageButtonDisable())
                        .position(x: geo.size.width*0.38, y: geo.size.height*0.25)
                    }
                    
                    //            stage 2
                    
                    if(modulViewModel.checkProgress(modulName: "Modul 2")){
                        
                        NavigationLink(destination: Stage2View(userModel: UserViewModel(), stage: StageModel(stagename: "Stage 2", prompt: [], listImage: [], resultParent: [], resultChild: []), stageViewModel: StageViewModel())){
                            Text("2").font(.custom(Font.balooBold, size: 80)).foregroundColor(Color.white).font(.system(size:35))
                        }
                        .frame(width:geo.size.width*0.12,height: geo.size.width*0.12)
                        .buttonStyle(StageButton(foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40))
                        .position(x:geo.size.width*0.38, y: geo.size.height*0.6)
                        
                    } else {
                        
                        Button{
                            
                        }label:{
                            Text("2").font(.custom(Font.balooBold, size: 80)).foregroundColor(Color.white).font(.system(size:35))
                        }
                        .frame(width:geo.size.width*0.12,height: geo.size.width*0.12)
                        .buttonStyle(StageButtonDisable())
                        .position(x:geo.size.width*0.38, y: geo.size.height*0.6)
                    }
                    
                    //modul 3
                    
                    if(modulViewModel.checkProgress(modulName: "Stage 2")){
                        
                        NavigationLink(destination: Module3View(modulViewModel: ModulViewModel(), modul: ModulModel(modulName: "Modul 3", prompt: [], edithImage: [], listImage: []))){
                            
                            Image("book-open").resizable().scaledToFit().frame(width: geo.size.width*0.07)
                        }
                        .frame(width:geo.size.width*0.14,height: geo.size.width*0.14)
                        .buttonStyle(StageButton(foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40))
                        .position(x: geo.size.width*0.6, y: geo.size.height*0.6)
                        
                        
                    } else {
                        
                        Button{
                            
                        }label:{
                            
                            Image("book-open").resizable().scaledToFit().frame(width: geo.size.width*0.07)
                        }
                        .frame(width:geo.size.width*0.14,height: geo.size.width*0.14)
                        .buttonStyle(StageButtonDisable())
                        .position(x: geo.size.width*0.6, y: geo.size.height*0.6)
                    }
                    
                    
                    //stage 3
                    
                    if(modulViewModel.checkProgress(modulName: "Modul 3")){
                        NavigationLink(destination: Stage3View(userModel: UserViewModel(), stage: StageModel(stagename: "Stage 3", prompt: [], listImage: [], resultParent: [], resultChild: []), stageViewModel: StageViewModel())){
                            Text("3").font(.custom(Font.balooBold, size: 80)).foregroundColor(Color.white).font(.system(size:40))
                        }
                        .frame(width:geo.size.width*0.13,height: geo.size.width*0.13)
                        .buttonStyle(StageButton(foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40))
                        .position(x: geo.size.width*0.8, y: geo.size.height*0.3)
                        
                        
                    } else {
                        
                        
                        Button{
                            
                        }label:{
                            Text("3").font(.custom(Font.balooBold, size: 80)).foregroundColor(Color.white).font(.system(size:40))
                        }
                        .frame(width:geo.size.width*0.13,height: geo.size.width*0.13)
                        .buttonStyle(StageButtonDisable())
                        .position(x: geo.size.width*0.8, y: geo.size.height*0.3)
                    }
                    
                    
                    //challenge
                    if(modulViewModel.checkProgress(modulName: "Stage 3")){
                        
                        
                        NavigationLink(destination: Challenge1View()){
                            Image( "flag").resizable().scaledToFit().frame(width: geo.size.width*0.07)
                        }
                        .frame(width:geo.size.width*0.14,height: geo.size.width*0.14)
                        .buttonStyle(StageButton(foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40))
                        .position(x: geo.size.width*0.8, y: geo.size.height*0.8)
                        
                        
                        
                    } else {
                        
                        
                        Button{
                            
                        }label:{
                            Image( "flag").resizable().scaledToFit().frame(width: geo.size.width*0.07)
                        }
                        .frame(width:geo.size.width*0.14,height: geo.size.width*0.14)
                        .buttonStyle(StageButtonDisable())
                        .position(x: geo.size.width*0.8, y: geo.size.height*0.8)
                    }
                    
                }
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
        RoadmapView(stageViewModel: StageViewModel(), modulViewModel: ModulViewModel()).previewInterfaceOrientation(.landscapeRight)
    }
}
