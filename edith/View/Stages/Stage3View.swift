//
//  Stage3View.swift
//  edith
//
//  Created by Muhammad Luthfi on 06/07/23.
//

import SwiftUI

struct Stage3View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var userModel: UserViewModel
    
    @State var isConfirming = false
    @State var isDiscussing = false
    @State var currentPrompt = ""
    
    @State var stage: StageModel
    @State var isDragging = false
    @State var draggedObject = InteractiveImageModel(image: "stageApple", x: CGFloat(0), y: CGFloat(0))
    
    @ObservedObject var stageViewModel: StageViewModel
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
                    
                    ZStack {
                    
                        // CONTAINER
                        Group {
                            ZStack{
                                ContainerView(textInside: currentPrompt,
                                              strokeWidth: CGFloat(16),
                                              width: reader.size.width*0.9,
                                              height: reader.size.height*0.5,
                                              textSize: (isDiscussing ? 30 : 24),
                                              isCenter: isDiscussing)
                            }
                            .position(x: reader.size.width*0.5, y: reader.size.height*0.3)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 32)
                                    .fill(Color.blueTang95)
                                    .frame(width: reader.size.width*0.42, height: reader.size.height*0.25)
                                
                                RoundedRectangle(cornerRadius: 32)
                                    .stroke(Color.white, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                                    .frame(width: reader.size.width*0.42, height: reader.size.height*0.25)
                                
                                HStack(spacing: reader.size.width*0.1*0.2){
                                    CircleWithNumber(textInside: "1", color: Color.blueTang70, strokeWidth: 8, size: reader.size.width*0.05, fontSize: CGFloat(48))
                                    CircleWithNumber(textInside: "2", color: Color.blueTang70, strokeWidth: 8, size: reader.size.width*0.05, fontSize: CGFloat(48))
                                    CircleWithNumber(textInside: "3", color: Color.blueTang70, strokeWidth: 8, size: reader.size.width*0.05, fontSize: CGFloat(48))
                                }
                                .position(x: reader.size.width*0.42*0.5, y: reader.size.height*0.18)
                                
                                CircleAvatar(imageName:userModel.dataUser.parent.image, color: Color.white, strokeWidth: 16)
                                    .frame(width: reader.size.width*0.1, height: reader.size.width*0.1)
                                    .offset(x: -reader.size.width*0.4*0.5, y: reader.size.height*0.13)
                                
                                
                            }
                            .frame(width: reader.size.width*0.4, height: reader.size.height*0.45)
                            .position(x: reader.size.width*0.25, y: reader.size.height*0.75)
                            .offset(x: reader.size.width*0.025)
                            
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 32)
                                    .fill(Color.cardinal95)
                                    .frame(width: reader.size.width*0.42, height: reader.size.height*0.25)
                                
                                RoundedRectangle(cornerRadius: 32)
                                    .stroke(Color.white, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                                    .frame(width: reader.size.width*0.42, height: reader.size.height*0.25)
                                
                                HStack(spacing: reader.size.width*0.1*0.2){
                                    CircleWithNumber(textInside: "1", color: Color.cardinal70, strokeWidth: 8, size: reader.size.width*0.05, fontSize: CGFloat(48))
                                    CircleWithNumber(textInside: "2", color: Color.cardinal70, strokeWidth: 8, size: reader.size.width*0.05, fontSize: CGFloat(48))
                                    CircleWithNumber(textInside: "3", color: Color.cardinal70, strokeWidth: 8, size: reader.size.width*0.05, fontSize: CGFloat(48))
                                }
                                .position(x: reader.size.width*0.42*0.5, y: reader.size.height*0.18)
                                
                                CircleAvatar(imageName:userModel.dataUser.child.cropImage, color: Color.white, strokeWidth: 16)
                                    .frame(width: reader.size.width*0.1, height: reader.size.width*0.1)
                                    .offset(x: reader.size.width*0.4*0.5, y: reader.size.height*0.13)
                                
                                
                            }
                            .frame(width: reader.size.width*0.4, height: reader.size.height*0.45)
                            .position(x: reader.size.width*0.75, y: reader.size.height*0.75)
                            .offset(x: -reader.size.width*0.025)
                        }
                        
                        // OBJECT
                        if(!isDiscussing){
                            ForEach(stage.listImage.indices, id: \.self) { index in
                                Image(stage.listImage[index].image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: reader.size.width*0.5*0.2)
                                    .position(CGPoint(x: stage.listImage[index].x, y: stage.listImage[index].y))
                                    .shadow(radius: 5)
                                    .opacity(stage.listImage[index].imageCount == 0 ? 0.5 : 1)
                                    .gesture(DragGesture()
                                        .onChanged { value in
                                            draggedObject.image = stage.listImage[index].image
                                            draggedObject.x = value.location.x
                                            draggedObject.y = value.location.y
                                            if(stage.listImage[index].imageCount ?? 99 > 0){
                                                isDragging = true
                                            }
                                        }
                                        .onEnded { value in
                                            if(value.location.x < reader.size.width/2 && value.location.x > 0 && value.location.y > reader.size.height/2 && stage.resultParent.count < 3){
                                                
                                                let offset = ((CGFloat(Int(stage.resultParent.count)) - 1)*(reader.size.width*0.18*0.2+(reader.size.width/12)))
                                                let x = reader.size.width*0.25-(reader.size.width*0.005)+offset
                                                
                                                let y = reader.size.height*0.75
                                                
                                                if(!stage.resultParent.contains(where: {$0.image == draggedObject.image})){
                                                    
                                                    let newObject = InteractiveImageModel(image: draggedObject.image, isCorrect: false, x: x, y: y)
                                                    stage.resultParent.append(newObject)
                                                    
                                                    stage.listImage[index].imageCount! -= 1
                                                    if(stage.resultChild.count == 3 && stage.resultParent.count == 3){
                                                        isConfirming = true
                                                    }
                                                }
                                                
                                            } else if(value.location.x > reader.size.width/2 && value.location.x < reader.size.width && value.location.y > reader.size.height/2 && stage.resultChild.count < 3){
                                                
                                                
                                                
                                                let offset = ((CGFloat(Int(stage.resultChild.count)) - 1)*(reader.size.width*0.18*0.2+(reader.size.width/12)))
                                                let x = reader.size.width*0.7-(reader.size.width*0.005)+offset
                                                
                                                let y = reader.size.height*0.75
                                                
                                                if(!stage.resultChild.contains(where: {$0.image == draggedObject.image})){
                                                    let newObject = InteractiveImageModel(image: draggedObject.image, isCorrect: false, x: x, y: y)
                                                    stage.resultChild.append(newObject)
                                                    stage.listImage[index].imageCount! -= 1
                                                    if(stage.resultChild.count == 3 && stage.resultParent.count == 3){
                                                        isConfirming = true
                                                    }
                                                }
                                                
                                            }
                                            isDragging = false
                                            
                                        }
                                    )
                            }
                        }
                        
                        ForEach(stage.resultChild) { child in
                            Image(child.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: reader.size.width/12)
                                .position(CGPoint(x: child.x, y: child.y))
                                .offset(x: reader.size.width*0.03)
                                .shadow(radius: 3)
                                .gesture(DragGesture()
                                    .onChanged { value in
                                        if(!isDiscussing){
                                            draggedObject.image = child.image
                                            draggedObject.x = value.location.x
                                            draggedObject.y = value.location.y
                                            isDragging = true
                                            
                                        }
                                    }
                                    .onEnded { value in
                                        if(!isDiscussing){
                                            withAnimation(.spring()){
                                                if(!(value.location.x > reader.size.width/2 && value.location.x < reader.size.width && value.location.y > reader.size.height/2)){
                                                    
                                                    if(stage.resultChild.contains(where: {$0.image == draggedObject.image})){
                                                        let index = stage.resultChild.firstIndex(where: {$0.image == draggedObject.image})
                                                        if((stage.resultChild.count-1) > index ?? 3){
                                                            for i in (((index ?? 0)+1)...(stage.resultChild.count-1)).reversed() {
                                                                stage.resultChild[i].x = stage.resultChild[i-1].x
                                                                stage.resultChild[i].y = stage.resultChild[i-1].y
                                                            }
                                                        }
                                                        stage.resultChild.remove(at: index ?? 0)
                                                    }
                                                }
                                                isDragging = false
                                            }
                                            
                                        }
                                        
                                    }
                                )
                        }
                        
                        ForEach(stage.resultParent) { parent in
                            Image(parent.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: reader.size.width/12)
                                .position(CGPoint(x: parent.x, y: parent.y))
                                .offset(x: reader.size.width*0.03)
                                .shadow(radius: 3)
                                .gesture(DragGesture()
                                    .onChanged { value in
                                        if(!isDiscussing){
                                            draggedObject.image = parent.image
                                            draggedObject.x = value.location.x
                                            draggedObject.y = value.location.y
                                            isDragging = true
                                        }
                                    }
                                    .onEnded { value in
                                        if(!isDiscussing){
                                            withAnimation(.spring()){
                                                if(!(value.location.x < reader.size.width/2 && value.location.x > 0 && value.location.y > reader.size.height/2)){
                                                    
                                                    if(stage.resultParent.contains(where: {$0.image == draggedObject.image})){
                                                        let index = stage.resultParent.firstIndex(where: {$0.image == draggedObject.image})
                                                        if((stage.resultParent.count-1) > index ?? 3){
                                                            for i in (((index ?? 0)+1)...(stage.resultParent.count-1)).reversed() {
                                                                stage.resultParent[i].x = stage.resultParent[i-1].x
                                                                stage.resultParent[i].y = stage.resultParent[i-1].y
                                                            }
                                                        }
                                                        stage.resultParent.remove(at: index ?? 0)
                                                    }
                                                }
                                                isDragging = false
                                            }
                                        }
                                        
                                    }
                                )
                        }
                        
                        // DRAGGABLE OBJECT
                        if (isDragging) {
                            Image(draggedObject.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: reader.size.width*0.12)
                                .position(CGPoint(x: draggedObject.x, y: draggedObject.y))
                        }
                        
                        // CLOSE BUTTON
                        Button{
                            presentationMode.wrappedValue.dismiss()
                        }label: {
                            Image(systemName: "map")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: reader.size.width*0.025, height: reader.size.width*0.025)
                                .font(Font.title.weight(.black))
                        }.frame(width: reader.size.width*0.065, height: reader.size.width*0.65)
                            .position(CGPoint(x: reader.size.width-(45)-reader.size.width*0.025, y: 45+(reader.size.width*0.025)))
                            .buttonStyle(CloseButton())
                        
                        // DIALOG CONFIRMING DRAG N DROP END
                        if(isConfirming){
                            ZStack{
                                ZStack{
                                    Rectangle()
                                        .fill(Color.black)
                                        .frame(maxWidth: .infinity)
                                        .opacity(0.6)
                                }
                                .position(x: reader.size.width*0.5,
                                          y: reader.size.height*0.5)
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 24)
                                        .fill(Color.white)
                                        .frame(width: reader.size.width*0.5,
                                               height: reader.size.height*0.6)
                                    
                                    RoundedRectangle(cornerRadius: 24)
                                        .stroke(Color.orangeFox70, style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round))
                                        .frame(width: reader.size.width*0.5,
                                               height: reader.size.height*0.6)
                                    
                                    VStack(spacing: 0){
                                        
                                        Image("edithBertanya")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: reader.size.height*0.35)
                                        Text("Apakah kalian sudah yakin atau ingin\nmengganti urutan benda-bendanya?")
                                            .frame(width: reader.size.width*0.5, height: reader.size.height*0.15)
                                            .multilineTextAlignment(.center)
                                            .font(.custom(Font.balooBold, size: CGFloat(32)))
                                    }
                                    
                                }
                                .position(x: reader.size.width*0.5, y: reader.size.height*0.5)
                                
                                ZStack{
                                    Button{
                                        isConfirming = false
                                        isDiscussing = true
                                        currentPrompt = stageViewModel.listPromptStage1[1]
                                    }label:{
                                        Text("Yakin")
                                            .font(.custom(Font.balooBold, size: 32))
                                            .foregroundColor(.white)
                                    }.buttonStyle(ThreeD(foregroundColor: .orangeFox70, shadowColor: .orangeFox50))
                                        .frame(width: reader.size.width/6,
                                               height: reader.size.height/10)
                                        .position(x: reader.size.width*0.5 + reader.size.width*0.1,
                                                  y: reader.size.height*0.5 + reader.size.height*0.3)
                                    
                                    Button{
                                        isConfirming = false
                                    }label:{
                                        Text("Ganti")
                                            .font(.custom(Font.balooBold, size: 32))
                                            .foregroundColor(.white)
                                    }.buttonStyle(ThreeD(foregroundColor: .orangeDeer60, shadowColor: .orangeDeer40))
                                        .frame(width: reader.size.width/6, height: reader.size.height/10)
                                        .position(x: reader.size.width*0.5 - reader.size.width*0.1,
                                                  y: reader.size.height*0.3 + reader.size.height*0.5)
                                }
                            }
                        }
                        
                        // END BUTTON
                        if(isDiscussing){
                            Button{
                                presentationMode.wrappedValue.dismiss()
                                stageViewModel.saveProgress(stageName: "Stage 3")
                            }label:{
                                Text("AKHIRI DISKUSI")
                                    .font(.custom(Font.balooBold, size: 36))
                                    .foregroundColor(.white)
                            }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                                .frame(width: reader.size.width*0.25, height: reader.size.height/10)
                                .position(x: reader.size.width*0.5 + reader.size.width*0.3,
                                          y: reader.size.height*0.5 + reader.size.height*0.01)
                        }
                        
                    }
                    
                    
                }
                
                // LOGIC
                .task{
                    userModel.load()
//                        stageViewModel.load()
                    
                    stage = StageModel(stagename: "Stage 3", prompt: stageViewModel.listPromptStage3, listImage: [], resultParent: [], resultChild: [])
                    for (index, image) in stageViewModel.listImagesStage3.enumerated() {
                        let x = reader.size.width*0.5 + ((CGFloat(Int(index)))-2)*reader.size.width*0.12
                        let y = reader.size.height*0.35
                        stage.listImage.append(InteractiveImageModel(image: image, imageCount: 2, isCorrect: false, x: CGFloat(x), y: y))
                    }
                    currentPrompt = stageViewModel.listPromptStage3[0]
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
            .ignoresSafeArea(.all)
        }
    }
}

struct Stage3View_Previews: PreviewProvider {
    static var previews: some View {
        Stage3View(userModel: UserViewModel(),
                   stage: StageModel(stagename: "", prompt: [], listImage: [], resultParent: [], resultChild: []),
                   stageViewModel: StageViewModel())
        .previewInterfaceOrientation(.landscapeRight)
    }
}
