//
//  Module2View.swift
//  edith
//
//  Created by Evelyn Megawati Tiffany on 03/07/23.
//

import SwiftUI

struct Module2View: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var modulViewModel: ModulViewModel
    @State var modul: ModulModel
    
    @State var indexPrompt:Int = 0
    @State var indexImage:Int = 0
    @State var isExplaining: Bool = true
    @State var isWrong: Bool = false
    @State var isCorrect: Bool = false
    
    @State var currentObjectCompared = [InteractiveImageModel(image: "stageApple", x: CGFloat(0), y: CGFloat(0)), InteractiveImageModel(image: "stageWater", x: CGFloat(0), y: CGFloat(0))]
    
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
                            .fill(Color.black)
                            .frame(maxWidth: .infinity)
                            .opacity(0.2)
                    }
                    
                    // CONTENT
                    ZStack{
                        
                        // EDITH
                        ZStack{
                            EdithFigure(pose: modulViewModel.listEdithPoseModul1[indexPrompt],
                                        width: (reader.size.width/3)-(reader.size.width*0.05))
                        }
                        .position(x: ((reader.size.width*2/5)*0.5)+reader.size.width*0.05,
                                  y: reader.size.height*0.5)
                        
                        ZStack{
                            // PROMPT
                            ZStack{
                                PromptBox(textInside: modulViewModel.listPromptModul2[indexPrompt],
                                          width: reader.size.width*3/5 - (reader.size.width*0.1),
                                          height: reader.size.height/3,
                                          textSize: 35)
                                .position(x: reader.size.width*3/5*(0.5),
                                          y: reader.size.height*0.5 - (reader.size.height*0.125))
                                
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
                                            
                                        } else{
                                            modulViewModel.saveProgress(modulName: "Modul 2")
                                            self.presentationMode.wrappedValue.dismiss()
                                        }
                                    } label:{
                                        Text("OK!")
                                            .font(.custom(Font.balooBold, size: 50))
                                            .foregroundColor(.white)
                                    }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                                        .frame(width: reader.size.width/6, height: reader.size.height/10)
                                        .position(x: reader.size.width*0.5*(3/5), y: reader.size.height*(2/3))
                                        .offset(x: reader.size.width*(0.025), y: -reader.size.height/3*(0.375))
                                }
                            }
                            .frame(width: reader.size.width*3/5)
                            
                            // QUIZ
                            if (indexPrompt > 0){
                                HStack(spacing: reader.size.width*0.05){
                                    Button{
                                        if modulViewModel.imageCorrect.contains(where: {
                                            $0 == currentObjectCompared[0].image
                                        }){
                                            if(indexPrompt < modulViewModel.listPromptModul2.count - 1){
                                                if(isWrong){
                                                    indexPrompt += 1
                                                }
                                                else {
                                                    indexPrompt += 2
                                                }
                                                
                                                isCorrect = true
                                            }
                                        }else{
                                            indexPrompt += 1
                                            isWrong = true
                                        }
                                        isExplaining = true
                                    } label: {
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
                                                .frame(width: reader.size.width*0.1)
                                        }
                                    }.frame(width: reader.size.width*0.2)
                                    
                                    
                                    Button{
                                        if modulViewModel.imageCorrect.contains(where: {
                                            $0 == currentObjectCompared[1].image
                                        }){
                                            if(indexPrompt < modulViewModel.listPromptModul2.count - 1){
                                                if(isWrong){
                                                    indexPrompt += 1
                                                }
                                                else {
                                                    indexPrompt += 2
                                                }
                                                
                                                isCorrect = true
                                            }
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
                                                .frame(width: reader.size.width*0.1)
                                        }
                                    }.frame(width: reader.size.width*0.2)
                                        .disabled(isCorrect||isWrong)
                                }
                                .offset(x: reader.size.width*(0.025), y: (reader.size.height*0.25))
                            }
                            
                            // LABEL AND EXPLAINING
                            if (isExplaining && indexPrompt > 1) {
                                if isCorrect {
                                    Image(systemName: "checkmark.circle.fill")
                                        .onAppear()
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(.white,.green)
                                        .font(.system(size: 100))
                                        .bold()
                                        .offset(x: -reader.size.width*(0.025), y: (reader.size.height*0.35))
                                    
                                }
                                if isWrong{
                                    Image(systemName: "multiply.circle.fill")
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(.white,.red)
                                        .font(.system(size: 100))
                                        .bold()
                                        .offset(x: reader.size.width*(0.225), y: (reader.size.height*0.35))
                                }
                            }
                        }
                        .position(x: ((reader.size.width*3/5)*0.5)+reader.size.width*2/5,
                                  y: reader.size.height*0.5)
                    }
                    
                    
                    // CLOSE BUTTON
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    }label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .foregroundColor(.white)
                            .font(Font.title.weight(.black))
                            .frame(width: 30,height: 30)
                    }.frame(width: reader.size.height*0.1, height: 90)
                        .position(CGPoint(x: reader.size.width-(45)-reader.size.width*0.025,
                                          y: 45+(reader.size.width*0.025)))
                        .buttonStyle(CloseButton())
                    
                }
                
                // LOGIC
                .task{
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
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
            }
            .ignoresSafeArea(.all)
        }
    }
}

struct Module2View_Previews: PreviewProvider {
    static var previews: some View {
        Module2View(modulViewModel: ModulViewModel(), modul: ModulModel(modulName: "Modul 2", prompt: [], edithImage: [], listImage: []))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
