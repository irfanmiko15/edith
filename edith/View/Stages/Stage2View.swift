//
//  Stage2View.swift
//  edith
//
//  Created by Muhammad Luthfi on 30/06/23.
//

import SwiftUI
import CoreMotion

struct Stage2View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var userModel: UserViewModel
    
    @State var stage: StageModel
    @ObservedObject var stageViewModel: StageViewModel
    
    @State var ballPositionX: CGFloat = CGFloat(0)
    @State var ballPositionY: CGFloat = CGFloat(0)
    @State var ballOrientation: CGFloat = CGFloat(0)
    
    @State var boardBallOrientation: CGFloat = CGFloat(0)
    
    @State var deviceOrientation: CGFloat = CGFloat(0)
    @State var deviceGyroSpeed: CGFloat = CGFloat(0)
    
    @State var currentIndex: Int = 0
    @State var currentObjectIndex: Int = 0
    @State var currentObjectCompared: [InteractiveImageModel] = [InteractiveImageModel(image: "stageBag", x: CGFloat(0), y: CGFloat(0)), InteractiveImageModel(image: "stageBag", x: CGFloat(0), y: CGFloat(0))]
    @State var currentPrompt: String = "Saat lapar,\nmana yang lebih dibutuhkan?"
    
    @State var isPlay = false
    @State var isRight = true
    @State var statusSelectedObject = ""
    @State var isDone = false
    @State var isTutorial = true
    
    var body: some View {
        NavigationStack{
            GeometryReader{reader in
                // VIEW
                ZStack{
                    // BACKGROUND
                    ZStack{
                        Image("bgModul")
                            .resizable()
                            .scaledToFill()
                            .blur(radius: 16)
                        Rectangle()
                            .fill(Color.white)
                            .frame(maxWidth: .infinity)
                            .opacity(0.2)
                    }
                    
                    // PROMPT BOX
                    ZStack{
                        RoundedRectangle(cornerRadius: 32)
                            .fill(Color.white)
                            .frame(width: reader.size.width*0.5, height: reader.size.height*0.15)
                        
                        RoundedRectangle(cornerRadius: 32)
                            .stroke(Color.orangeFox70, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                            .frame(width: reader.size.width*0.5, height: reader.size.height*0.15)
                        
                        Text(currentPrompt)
                            .frame(width: reader.size.width*0.5, height: reader.size.height*0.15)
                            .multilineTextAlignment(.center)
                            .font(.custom(Font.balooBold, size: CGFloat(32)))
                    }
                    .position(x: reader.size.width*0.5, y: reader.size.height*0.15)
                    
                    // BASKET
                    Group{
                        ZStack{
                            Image("basketBack")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: reader.size.width*0.5)
                        .position(x: reader.size.width*0.75, y: reader.size.height*0.75)
                        
                        ZStack{
                            Image("basketBack")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: reader.size.width*0.5)
                        .position(x: reader.size.width*0.25, y: reader.size.height*0.75)
                    }
                    
                    // OBJECT COMPARED
                    Group{
                        Group{
                            
                            ZStack{
                                Image("basketBoard")
                                    .resizable()
                                    .scaledToFit()
                            }
                            .frame(width: reader.size.width*0.175)
                            .position(x: reader.size.width*0.75, y: reader.size.height*0.575)
                            
                            ZStack{
                                Image(currentObjectCompared[1].image)
                                    .resizable()
                                    .scaledToFit()
                            }
                            .frame(width: reader.size.width*0.1)
                            .position(x: reader.size.width*0.75, y: reader.size.height*0.575)
                            
                            
                            if(!isPlay && isRight){
                                ZStack{
                                    Image(statusSelectedObject)
                                        .resizable()
                                        .scaledToFit()
                                }
                                .frame(width: reader.size.width*0.15)
                                .position(x: reader.size.width*0.75, y: reader.size.height*0.575)
                            }
                            
                        }
                        
                        Group{
                            
                            ZStack{
                                Image("basketBoard")
                                    .resizable()
                                    .scaledToFit()
                            }
                            .frame(width: reader.size.width*0.175)
                            .position(x: reader.size.width*0.25, y: reader.size.height*0.575)
                            
                            ZStack{
                                Image(currentObjectCompared[0].image)
                                    .resizable()
                                    .scaledToFit()
                            }
                            .frame(width: reader.size.width*0.1)
                            .position(x: reader.size.width*0.25, y: reader.size.height*0.575)
                            
                            if(!isPlay && !isRight){
                                
                                ZStack{
                                    Image(statusSelectedObject)
                                        .resizable()
                                        .scaledToFit()
                                }
                                .frame(width: reader.size.width*0.15)
                                .position(x: reader.size.width*0.25, y: reader.size.height*0.575)
                                
                            }
                            
                            
                        }
                        
                    }
                    
                    // BALL
                    ZStack{
                        
                        Image("ballBoard")
                            .resizable()
                            .scaledToFit()
                            .frame(width: (reader.size.height*0.04)*(374/39))
                            .rotationEffect(.degrees(boardBallOrientation))
                            .position(x: reader.size.width*0.5, y: reader.size.height*0.5)
                        
                        if(!isTutorial){
                            Image("ball")
                                .resizable()
                                .scaledToFit()
                                .frame(width: reader.size.width*0.1, height: reader.size.width*0.1)
                                .rotationEffect(.degrees(ballOrientation))
                                .position(x: ballPositionX, y: ballPositionY)
                        }
                        
                    }
                    
                    // BASKET
                    Group{
                        ZStack{
                            Image("basketFront")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: reader.size.width*0.5)
                        .position(x: reader.size.width*0.25, y: reader.size.height*0.75)
                        ZStack{
                            Image("basketFront")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: reader.size.width*0.5)
                        .position(x: reader.size.width*0.25, y: reader.size.height*0.75)
                    }
                    
                    // CLOSE BUTTON
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    }label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: reader.size.width*0.025, height: reader.size.width*0.025)
                            .font(Font.title.weight(.black))
                    }.frame(width: reader.size.width*0.065, height: reader.size.width*0.65)
                        .position(CGPoint(x: reader.size.width-(45)-reader.size.width*0.025, y: 45+(reader.size.width*0.025)))
                        .buttonStyle(CloseButton())
                    
                    // IS DONE
                    if(isDone){
                        ZStack{
                            Rectangle()
                                .fill(Color.black)
                                .frame(maxWidth: .infinity)
                                .opacity(0.6)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(Color.white)
                                    .frame(width: reader.size.width*0.5,
                                           height: reader.size.height*0.6)
                                    .position(x: reader.size.width*0.5,
                                              y: reader.size.height*0.5)
                                
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(Color.orangeFox70, style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round))
                                    .frame(width: reader.size.width*0.5,
                                           height: reader.size.height*0.6)
                                    .position(x: reader.size.width*0.5,
                                              y: reader.size.height*0.5)
                                
                                VStack(spacing: 0){
                                    Image("edithBahagia")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: reader.size.height*0.35)
                                    Text("Selamat, kalian telah berhasil\nmenyelesaikan tahap ini!")
                                        .frame(width: reader.size.width*0.5, height: reader.size.height*0.15)
                                        .multilineTextAlignment(.center)
                                        .font(.custom(Font.balooBold, size: CGFloat(32)))
                                }
                                .position(x: reader.size.width*0.5,
                                          y: reader.size.height*0.5)
                                
                                Button{
                                    presentationMode.wrappedValue.dismiss()
                                    stageViewModel.saveProgress(stageName: "Stage 2")
                                }label:{
                                    Text("SELESAI")
                                        .font(.custom(Font.balooBold, size: 36))
                                        .foregroundColor(.white)
                                }.buttonStyle(ThreeD(foregroundColor: .orangeSomething,
                                                     shadowColor: .orangeFox50))
                                    .frame(width: reader.size.width*0.25,
                                           height: reader.size.height*0.1)
                                    .position(x: reader.size.width*0.5,
                                              y: (reader.size.height*0.5) + (reader.size.height*0.3))
                            }
                            .position(x: reader.size.width*0.5, y: reader.size.height*0.5)
                        }
                    }
                    
                    // TUTORIAL
                    if(isTutorial){
                        ZStack{
                            Rectangle()
                                .fill(Color.black)
                                .frame(maxWidth: .infinity)
                                .opacity(0.6)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(Color.white)
                                    .frame(width: reader.size.width*0.5,
                                           height: reader.size.height*0.6)
                                    .position(x: reader.size.width*0.5,
                                              y: reader.size.height*0.5)
                                
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(Color.orangeFox70, style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round))
                                    .frame(width: reader.size.width*0.5,
                                           height: reader.size.height*0.6)
                                    .position(x: reader.size.width*0.5,
                                              y: reader.size.height*0.5)
                                
                                ZStack {
                                    ZStack{
                                        // BALL
                                        ZStack{
                                            Image("ballBoard")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: (reader.size.height*0.04)*(374/39))
                                                .rotationEffect(.degrees(boardBallOrientation))
                                                .position(x: reader.size.width*0.5, y: reader.size.height*0.5)
                                            
                                            Image("ball")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: reader.size.width*0.1, height: reader.size.width*0.1)
                                                .rotationEffect(.degrees(ballOrientation))
                                                .position(x: ballPositionX, y: ballPositionY)
                                            
                                        }
                                    }
                                    .frame(height: reader.size.height*0.5)
                                    .offset(y: -reader.size.height*0.175)
                                    
                                    Text("Gerakkan Device-mu ke Kiri dan\nke Kanan untuk menjawab.")
                                        .frame(width: reader.size.width*0.5, height: reader.size.height*0.15)
                                        .multilineTextAlignment(.center)
                                        .font(.custom(Font.balooBold, size: CGFloat(32)))
                                        .offset(y: reader.size.height*0.175)
                                }
                                .position(x: reader.size.width*0.5,
                                          y: reader.size.height*0.5)
                                
                                Button{
                                    isTutorial = false
                                    isPlay = true
                                }label:{
                                    Text("OK!")
                                        .font(.custom(Font.balooBold, size: 36))
                                        .foregroundColor(.white)
                                }.buttonStyle(ThreeD(foregroundColor: .orangeSomething,
                                                     shadowColor: .orangeFox50))
                                    .frame(width: reader.size.width*0.25,
                                           height: reader.size.height*0.1)
                                    .position(x: reader.size.width*0.5,
                                              y: (reader.size.height*0.5) + (reader.size.height*0.3))
                            }
                            .position(x: reader.size.width*0.5, y: reader.size.height*0.5)
                        }
                    }
                    
                }
                
                // LOGIC
                .task {
                    userModel.load()
//                    stageViewModel.load()
                    
                    stage = StageModel(stagename: "Stage 2", prompt: stageViewModel.listPromptStage2, listImage: [], resultParent: [], resultChild: [])
                    for (index, image) in stageViewModel.listImagesStage2.enumerated() {
                        var x = CGFloat(0)
                        let y = reader.size.height*0.575
                        if(index%2 == 0){
                            x = reader.size.width*0.75
                        } else {
                            x = reader.size.width*0.25
                        }
                        stage.listImage.append(InteractiveImageModel(image: image, isCorrect: false, x: CGFloat(x), y: y))
                    }
                    currentObjectCompared = [stage.listImage[currentObjectIndex], stage.listImage[currentObjectIndex+1]]
                    currentPrompt = stage.prompt[currentIndex]
                    
                    ballPositionX = reader.size.width*0.5
                    ballPositionY = (reader.size.height*0.5)-(reader.size.width*0.05+reader.size.height*0.02)
                    
                    let manager = CMMotionManager()
                    
                    var motionY = manager.accelerometerData?.acceleration.y ?? 0.0
                    var motionZ = manager.accelerometerData?.acceleration.z ?? 0.0
                    
                    manager.accelerometerUpdateInterval = 0.1
                    manager.startAccelerometerUpdates(to: .main){(data, error) in
                        
                        motionY = manager.accelerometerData?.acceleration.y ?? 0.0
                        motionZ = manager.accelerometerData?.acceleration.z ?? 0.0
                        
                        if(isPlay && !isDone){
                            
                            withAnimation(.spring()){
                                if(motionZ < 0.5 && motionZ > -0.5){
                                    if(motionY > 0.1 || motionY < -0.1){
                                        ballPositionX = ballPositionX - motionY*90
                                        ballOrientation = ballOrientation - motionY*90
                                        
                                    }
                                } else if((motionZ > 0.5 && motionZ < 0.8) || (motionZ < -0.5 && motionZ > -0.8)){
                                    if(motionY > 0.05 || motionY < -0.05){
                                        ballPositionX = ballPositionX - motionY*180
                                        ballOrientation = ballOrientation - motionY*180
                                    }
                                } else {
                                    if(motionY < 0.05 || motionY > -0.05){
                                        ballPositionX = ballPositionX - motionY*225
                                        ballOrientation = ballOrientation - motionY*225
                                        
                                    }
                                }
                                
                                if(ballPositionX > (reader.size.width*0.5) + ((reader.size.height*0.04)*(374/39)/2) + (reader.size.width*0.1*0.4)){
                                    ballPositionY = ballPositionY + reader.size.height*0.25
                                    
                                } else if(ballPositionX < (reader.size.width*0.5) - ((reader.size.height*0.04)*(374/39)/2) - (reader.size.width*0.1*0.4)){
                                    ballPositionY = ballPositionY + reader.size.height*0.25
                                    
                                } else if(ballPositionX > reader.size.width*0.5-((reader.size.height*0.04)*(374/39)/2) && ballPositionX < reader.size.width*0.5+((reader.size.height*0.04)*(374/39)/2)){
                                    ballPositionY = (reader.size.height*0.5)-(reader.size.width*0.05+reader.size.height*0.02)
                                }
                            }
                            
                            if(ballPositionY > reader.size.height){
                                currentIndex += 1
                                currentObjectIndex += 2
                                
                                if(ballPositionX < reader.size.width/2){
                                    isRight = false
                                    if(stageViewModel.listRightImagesStage2.contains(where: {$0 == currentObjectCompared[0].image})) {
                                        statusSelectedObject = "stageCorrect"
                                    } else {
                                        statusSelectedObject = "stageWrong"
                                    }
                                } else {
                                    isRight = true
                                    if(stageViewModel.listRightImagesStage2.contains(where: {$0 == currentObjectCompared[1].image})) {
                                        statusSelectedObject = "stageCorrect"
                                    } else {
                                        statusSelectedObject = "stageWrong"
                                    }
                                }
                                
                                isPlay = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                                    isPlay = true
                                    if(currentIndex < stage.prompt.count){
                                        withAnimation(.spring()){
                                            currentObjectCompared = [stage.listImage[currentObjectIndex], stage.listImage[currentObjectIndex+1]]
                                            currentPrompt = stage.prompt[currentIndex]
                                        }
                                    } else {
                                        isDone = true
                                    }
                                }
                                ballPositionX = reader.size.width*0.5
                                ballPositionY = (reader.size.height*0.5)-(reader.size.width*0.05+reader.size.height*0.02)
                            }
                        }
                        
                        
                        if(isTutorial){
                            withAnimation(.spring()){
                                
                                if(motionZ < 0.5 && motionZ > -0.5){
                                    if(motionY > 0.1 || motionY < -0.1){
                                        ballPositionX = ballPositionX - motionY*90
                                        
                                    }
                                } else if((motionZ > 0.5 && motionZ < 0.8) || (motionZ < -0.5 && motionZ > -0.8)){
                                    if(motionY > 0.05 || motionY < -0.05){
                                        ballPositionX = ballPositionX - motionY*180
                                    }
                                } else {
                                    if(motionY < 0.05 || motionY > -0.05){
                                        ballPositionX = ballPositionX - motionY*225
                                        
                                    }
                                }


                                ballPositionY = (reader.size.height*0.5)-(reader.size.width*0.05+reader.size.height*0.02)

                                if(ballPositionX > (reader.size.width*0.5) + ((reader.size.height*0.04)*(374/39)/2)){
                                    ballPositionX = (reader.size.width*0.5) + ((reader.size.height*0.04)*(374/39)/2)
                                    ballOrientation = ballOrientation

                                } else if(ballPositionX < (reader.size.width*0.5) - ((reader.size.height*0.04)*(374/39)/2)){
                                    ballPositionX = (reader.size.width*0.5) - ((reader.size.height*0.04)*(374/39)/2)
                                    ballOrientation = ballOrientation
                                } else {
                                    if(motionZ < 0.5 && motionZ > -0.5){
                                        if(motionY > 0.1 || motionY < -0.1){
                                            ballOrientation = ballOrientation - motionY*90
                                            
                                        }
                                    } else if((motionZ > 0.5 && motionZ < 0.8) || (motionZ < -0.5 && motionZ > -0.8)){
                                        if(motionY > 0.05 || motionY < -0.05){
                                            ballOrientation = ballOrientation - motionY*180
                                        }
                                    } else {
                                        if(motionY < 0.05 || motionY > -0.05){
                                            ballOrientation = ballOrientation - motionY*225
                                            
                                        }
                                    }
                                }
                            }
                            
                        }
                        
                    }
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
            .ignoresSafeArea(.all)
        }
    }
}

struct Stage2View_Previews: PreviewProvider {
    static var previews: some View {
        Stage2View(userModel: UserViewModel(), stage: StageModel(stagename: "", prompt: [], listImage: [], resultParent: [], resultChild: []), stageViewModel: StageViewModel())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
