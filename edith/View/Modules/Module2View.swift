//
//  Module2View.swift
//  edith
//
//  Created by Evelyn Megawati Tiffany on 03/07/23.
//

import SwiftUI

struct Module2View: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var modulViewModel: ModulViewModel
    @ObservedObject var userViewModel:UserViewModel
    @State var modul: ModulModel
    
    @State var indexPrompt:Int = 0
    @State var indexImage:Int = 0
    @State var indexImageExplainer:Int = 0
    @State var isExplaining: Bool = true
    @State var isPromptOnly: Bool = false
    @State var isWrong: Bool = false
    @State var isCorrect: Bool = false
    
    @State var currentObjectCompared = [InteractiveImageModel(image: "stageApple", x: CGFloat(0), y: CGFloat(0)),
                                        InteractiveImageModel(image: "stageWater", x: CGFloat(0), y: CGFloat(0))]
    
    @State var objectExplainer1: [InteractiveImageModel] = []
    @State var objectExplainer2: [InteractiveImageModel] = []
    
    @State var isExplainingStage: Int = 0
    
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
                            EdithFigure(pose: modulViewModel.listEdithPoseModul2[indexPrompt],
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
                                
                                if (isExplaining && (!isWrong || isCorrect)) || isPromptOnly {
                                    Button{
                                        if indexPrompt < modulViewModel.listPromptModul2.count-1 {
                                            if(indexPrompt < 6 || (indexPrompt > 9 && indexPrompt < modulViewModel.listPromptModul2.count - 2)){
                                                if (indexPrompt > 2){
                                                    indexImage += 2
                                                    currentObjectCompared = [modul.listImage[indexImage], modul.listImage[indexImage+1]]
                                                }
                                                isPromptOnly = false
                                            } else {
                                                isPromptOnly = true
                                            }
                                            
                                            isExplaining = false
                                            isWrong = false
                                            isCorrect = false
                                            indexPrompt += 1
                                            if (indexPrompt > 6 && indexPrompt < 11){
                                                withAnimation(.easeInOut){
                                                    if(indexPrompt == 9){
                                                        indexImageExplainer += 1
                                                    }
                                                }
                                            }
                                            
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
                            if ((indexPrompt > 0 && indexPrompt < 7) || (indexPrompt > 10 && indexPrompt < modulViewModel.listPromptModul2.count-1)){
                                HStack(spacing: reader.size.width*0.05){
                                    Button{
                                        if modulViewModel.imageCorrect.contains(where: {
                                            $0 == currentObjectCompared[0].image
                                        }){
                                            if(indexPrompt < modulViewModel.listPromptModul2.count - 1){
                                                if(isWrong || isPromptOnly){
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
                                        .disabled(modulViewModel.imageCorrect.contains(where: {
                                            $0 == currentObjectCompared[0].image
                                        }) ? isCorrect : isWrong || isCorrect)
                                    
                                    
                                    Button{
                                        if modulViewModel.imageCorrect.contains(where: {
                                            $0 == currentObjectCompared[1].image
                                        }){
                                            if(indexPrompt < modulViewModel.listPromptModul2.count - 1){
                                                if(isWrong || isPromptOnly){
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
                                        .disabled(modulViewModel.imageCorrect.contains(where: {
                                            $0 == currentObjectCompared[1].image
                                        }) ? isCorrect : isWrong || isCorrect)
                                }
                                .offset(x: reader.size.width*(0.025), y: (reader.size.height*0.25))
                            }
                            
                            // IMAGE EXPLAINER
                            if (indexPrompt > 6 && indexPrompt < 11){
                                
                                ForEach(objectExplainer1) { image in
                                    Image(image.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: indexImageExplainer == 0 ? reader.size.width*0.1 : 0)
                                        .position(x: image.x, y: image.y)
                                }
                                
                                ForEach(objectExplainer2) { image in
                                    Image(image.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: indexImageExplainer == 1 ? reader.size.width*0.1 : 0)
                                        .position(x: image.x, y: image.y)
                                }
                            }
                            
                            // LABEL AND EXPLAINING
                            if (isExplaining && indexPrompt > 1) {
                                Group{
                                    if modulViewModel.imageCorrect.contains(where: {
                                        $0 == currentObjectCompared[0].image
                                    }) && isCorrect {
                                        Image(systemName: "checkmark.circle.fill")
                                            .onAppear()
                                            .symbolRenderingMode(.palette)
                                            .foregroundStyle(.white,.green)
                                            .font(.system(size: 100))
                                            .bold()
                                            .offset(x: -reader.size.width*(0.025), y: (reader.size.height*0.35))
                                        
                                    } else if modulViewModel.imageCorrect.contains(where: {
                                        $0 == currentObjectCompared[1].image
                                    }) && isWrong{
                                        Image(systemName: "multiply.circle.fill")
                                            .symbolRenderingMode(.palette)
                                            .foregroundStyle(.white,.red)
                                            .font(.system(size: 100))
                                            .bold()
                                            .offset(x: -reader.size.width*(0.025), y: (reader.size.height*0.35))
                                    }
                                }
                                
                                Group{
                                    if modulViewModel.imageCorrect.contains(where: {
                                        $0 == currentObjectCompared[1].image
                                    }) && isCorrect {
                                        Image(systemName: "checkmark.circle.fill")
                                            .onAppear()
                                            .symbolRenderingMode(.palette)
                                            .foregroundStyle(.white,.green)
                                            .font(.system(size: 100))
                                            .bold()
                                            .offset(x: reader.size.width*(0.225), y: (reader.size.height*0.35))
                                        
                                    } else if modulViewModel.imageCorrect.contains(where: {
                                        $0 == currentObjectCompared[0].image
                                    }) && isWrong{
                                        Image(systemName: "multiply.circle.fill")
                                            .symbolRenderingMode(.palette)
                                            .foregroundStyle(.white,.red)
                                            .font(.system(size: 100))
                                            .bold()
                                            .offset(x: reader.size.width*(0.225), y: (reader.size.height*0.35))
                                    }
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
                        Image(systemName: "map")
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
                    
                    for (index, image) in modulViewModel.listImageModul2.enumerated(){
                        var x = CGFloat(0)
                        let y = reader.size.height*0.5
                        if index%2 == 0{
                            x = reader.size.width*0.2
                        }else{
                            x = reader.size.width*0.8
                        }
                        modul.listImage.append(InteractiveImageModel(image: image, x: x, y: y))
                    }
                    
                    
                    for (index, image) in modulViewModel.listImageExplainerModul2.enumerated(){
                        if(index < 4){
                            let x = reader.size.width*0.37 + reader.size.width*0.1*(CGFloat(Int(index)))
                            var y = reader.size.height*0.72
                            if index%2 != 0{
                                y += reader.size.height*0.1
                            }
                            objectExplainer1.append(InteractiveImageModel(image: image, x: x, y: y))
                        } else {
                            let index2 = index-4
                            let x = reader.size.width*0.37 + reader.size.width*0.1*(CGFloat(Int(index2)))
                            var y = reader.size.height*0.72
                            if index2%2 != 0{
                                y += reader.size.height*0.1
                            }
                            objectExplainer2.append(InteractiveImageModel(image: image, x: x, y: y))
                            
                        }
                    }
                }.onAppear{
                    userViewModel.load()
                    print()
                    modulViewModel.listPromptModul2[12]="\(userViewModel.dataUser.parent.name) bisa jelaskan mengapa kita tidak terlalu butuh mainan saat akan ada ujian."
                    modulViewModel.listPromptModul2[15]="\(userViewModel.dataUser.parent.name) bisa jelaskan mengapa kita tidak terlalu butuh pelampung saat akan ada ujian."
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
        Module2View( modulViewModel: ModulViewModel(),userViewModel: UserViewModel(), modul: ModulModel(modulName: "Modul 2", prompt: [], edithImage: [], listImage: []))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
