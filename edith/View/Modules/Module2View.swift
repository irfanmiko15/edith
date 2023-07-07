//
//  Module2View.swift
//  edith
//
//  Created by Evelyn Megawati Tiffany on 03/07/23.
//

import SwiftUI

struct Module2View: View {
    
    @State var modul: ModulModel
    
    @ObservedObject var modulViewModel: ModulViewModel
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("modul1Stage1") var modul1Stage1:Bool=false
    
    
    
    @State var indexPrompt:Int = 0
    
    @State var yOffset: CGFloat = 0
    @State var yOffsett: CGFloat = 0
    @State var scaleEffect: CGFloat = 0.8
    @State var opacityCircle: CGFloat = 0.8
    
    
    
    @State var indexHead: Int = 0
    @State var indexArm: Int = 0
    @State var indexImage: Int = 0
    
    @State var currentObjectCompared = [InteractiveImageModel(image: "stageApple", x: CGFloat(0), y: CGFloat(0)), InteractiveImageModel(image: "stageWater", x: CGFloat(0), y: CGFloat(0))]
    
    @State var isExplaining: Bool = true
    @State var isWrong: Bool = false
    @State var isCorrect: Bool = false
    
    var body: some View {
        GeometryReader{reader in
            ZStack{
                Image("bgModul")
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 10)
                
                Button{
                    
                    modul1Stage1=true
                    self.presentationMode.wrappedValue.dismiss()
                    
                }label:{
                    ZStack{
                        
                        Circle()
                            .fill(Color.orangeSomething)
                        Image(systemName: "multiply")
                            .font(.system(size:40)
                                .bold())
                            .frame(width:60,height: 60)
                            .foregroundColor(Color.white)
                    }
                }.frame(width:70)
                    .offset(x: 555,y: -400)
                
                if (indexPrompt > 0){
                    Button{
                        
                        if modulViewModel.imageCorrect.contains(where: {
                            $0 == currentObjectCompared[0].image
                        }){
                            if(isWrong){
                                indexPrompt += 1
                            } else {
                                indexPrompt += 2
                            }
                            isCorrect = true
                        }else{
                            indexPrompt += 1
                            isWrong = true
                        }
                    
                        isExplaining = true
                        
//                        if indexPrompt < modulViewModel.listPromptModul2.count-1 {
//                            indexPrompt += 2
//                            indexArm += 2
//                            indexHead += 2
//                        }else{
//
//                        }
                        
                    }label:{
                        
                        ZStack{
                            
                            Circle()
                                .fill(Color.orangeFox50)
                                .offset(x:20, y:20)
                            
                            Circle()
                                .fill(Color.white)
                                .overlay(
                                    Circle()
                                        .stroke(Color.orangeSomething, lineWidth: 15))
                            
                            Image(currentObjectCompared[0].image)
                                .resizable()
                                .scaledToFit()
                                .frame(width:170)
                        }
                    }.frame(width: 250)
                        .offset(x:100, y:250)
                        .onAppear{
                            indexPrompt = 1
                        }
                    
                    
                    Button{
                        
//                        if indexPrompt < modulViewModel.listPromptModul2.count-1 {
//                            indexPrompt += 1
//                            indexArm += 1
//                            indexHead += 1
//                        }else{
//
//                        }
                        if modulViewModel.imageCorrect.contains(where: {
                            $0 == currentObjectCompared[1].image
                        }){
                            if(isWrong){
                                indexPrompt += 1
                            } else {
                                indexPrompt += 2
                            }
                            isCorrect = true
                        }else{
                            indexPrompt += 1
                            isWrong = true
                        }
                        
                        isExplaining = true
                        
                    }label:{
                        
                        ZStack{
                            
                            Circle()
                                .fill(Color.orangeFox50)
                                .offset(x:20, y:20)
                            
                            Circle()
                                .fill(Color.white)
                                .overlay(
                                    Circle()
                                        .stroke(Color.orangeSomething, lineWidth: 15))
                            
                            Image(currentObjectCompared[1].image)
                                .resizable()
                                .scaledToFit()
                                .frame(width:170)
                                .offset(x:10, y:8)
                        }
                    }.frame(width: 250)
                        .offset(x:450, y:250)
                }
                
                
                
                if (isExplaining && indexPrompt > 1) {
                    
                    if isCorrect {
                        Image(systemName: "checkmark.circle.fill")
                            .onAppear()
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white,.green)
                            .font(.system(size: 100))
                            .bold()
                            .offset(x:200, y: 350)

                    }
                    
               
               
                    if isWrong{
                        Image(systemName: "multiply.circle.fill")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white,.red)
                            .font(.system(size: 100))
                            .bold()
                            .offset(x:550, y: 350)
                    }
                }
                
                
                
                
                HStack{
                    
//                    VStack {
//                        VStack{
//                            Image(listHead[indexHead])
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 475)
//                                .offset(y:yOffset)
//                                .task{
//                                    withAnimation(Animation.easeOut(duration: 1.6).repeatForever()){
//                                        yOffset = 20
//                                    }
//                                }
//
//
//                            ZStack{
//
//                                CasePoses(switchPoses: listArm[indexArm])
//
//                                Image("edithBodyStill")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 280)
//
//                                Circle()
//                                    .stroke(RadialGradient(colors: [Color("orangeSomething"), Color("orangeSomething"), Color.white, Color.white, Color.clear], center: .center, startRadius: 30, endRadius: 50), lineWidth: 25)
//                                    .frame(width: 95)
//                                    .offset(x:3, y:-55)
//                                    .opacity(opacityCircle)
//                            }.offset(y:yOffsett)
//                                .task{
//                                    withAnimation(Animation.easeOut(duration: 1.75).repeatForever()){
//                                        yOffsett = 20
//                                        opacityCircle = 0.1
//                                    }
//
//                                }
//                        }.shadow(color: .white, radius: 20)
//                            .shadow(color: .white, radius: 20)
//
//
//                        Image("edithShadow")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 300)
//                            .scaleEffect(scaleEffect)
//                            .task {
//                                withAnimation(Animation.easeOut(duration: 1.75).repeatForever()){
//                                    scaleEffect = 1.2
//                                }
//
//                            }
//
//                    }
                    
                    VStack{
                        PromptBox(textInside: modulViewModel.listPromptModul2[indexPrompt], width: reader.size.width/2, height: reader.size.height/3, textSize: 35)
                            .offset(y: -125)
                        
                        if isExplaining && !isWrong || isCorrect{
                            Button{
                                
                                if indexPrompt < modulViewModel.listPromptModul2.count-1 {
                                    
                                    if (indexPrompt > 2){
                                        indexImage += 2
                                        currentObjectCompared = [modul.listImage[indexImage], modul.listImage[indexImage+1]]
                                    }
                                    
                                    isExplaining = false
                                    isWrong = false
                                    isCorrect = false
                             
                                    indexPrompt += 1
                                    indexArm += 1
                                    indexHead += 1
                                    
                                } else{
                                    modul1Stage1=true
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                                
                            }label:{
                                Text("OK!")
                                    .font(.custom(Font.balooBold, size: 50))
                                    .foregroundColor(.white)
                            }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                                .frame(width: reader.size.width/6, height: reader.size.height/10)
                                .offset(x:45, y:-175)
                        }
                    }
                    
                }
                
            }
            .task{
//                modulViewModel.load()
                
                modul = ModulModel(modulName: "Modul 1", prompt: modulViewModel.listPromptModul2, edithImage: [], listImage: [])
                
                for (index, image) in modulViewModel.imageLeftRight.enumerated(){
                    var x = CGFloat(0)
                    let y = reader.size.height*0.5
                    if index%2 == 0{
                        x = reader.size.width*0.2
                    }else{
                        x = reader.size.width*0.8
                    }
                    modul.listImage.append(InteractiveImageModel(image: image, x: x, y: y))
                    
                    
                }
            }
            
        }
        .ignoresSafeArea(.all)
    }
}

struct Module2View_Previews: PreviewProvider {
    static var previews: some View {
        Module2View(modul: ModulModel(modulName: "Modul 2", prompt: [], edithImage: [], listImage: []), modulViewModel: ModulViewModel())
    }
}
