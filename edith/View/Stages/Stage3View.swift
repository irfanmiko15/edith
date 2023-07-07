//
//  Stage3View.swift
//  edith
//
//  Created by Muhammad Luthfi on 06/07/23.
//

import SwiftUI

struct Stage3View: View {
    @StateObject var userModel: UserViewModel
    
    @State var stage: StageModel
    @State var isDragging = false
    @State var draggedObject = InteractiveImageModel(image: "stageApple", x: CGFloat(0), y: CGFloat(0))
    
    @ObservedObject var stageViewModel: StageViewModel
    var body: some View {
        NavigationStack{
            GeometryReader{reader in
                ZStack{
                    ZStack {
                        Image("bgModul")
                            .resizable()
                            .scaledToFill()
                            .blur(radius: 16)
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: reader.size.width, height: reader.size.height)
                            .opacity(0.2)
                    
                        ZStack{
                            ContainerView(textInside: "Saat bangun pagi untuk ke sekolah,\napa yang kamu butuhkan lebih dahulu?",
                                          strokeWidth: CGFloat(16),
                                          width: reader.size.width*0.9,
                                          height: reader.size.height*0.5)
                        }
                        .position(x: reader.size.width*0.5, y: reader.size.height*0.3)
                        
                        ForEach(stage.listImage) { image in
                            Image(image.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: reader.size.width*0.5*0.2)
                                .position(CGPoint(x: image.x, y: image.y))
                                .shadow(radius: 5)
                                .gesture(DragGesture()
                                    .onChanged { value in
                                        draggedObject.image = image.image
                                        draggedObject.x = value.location.x
                                        draggedObject.y = value.location.y
                                        isDragging = true
                                    }
                                    .onEnded { value in
                                        if(value.location.x < reader.size.width/2 && value.location.x > 0 && value.location.y > reader.size.height/2 && stage.resultParent.count < 3){
                                            
                                            let offset = ((CGFloat(Int(stage.resultParent.count)) - 1)*(reader.size.width*0.18*0.2+(reader.size.width/12)))
                                            let x = reader.size.width*0.25-(reader.size.width*0.005)+offset
                                            
                                            let y = reader.size.height*0.75
                                            
                                            let newObject = InteractiveImageModel(image: draggedObject.image, isCorrect: false, x: x, y: y)
                                            if(!stage.resultParent.contains(where: {$0.image == draggedObject.image})){
                                                stage.resultParent.append(newObject)
                                                print(stage.resultParent)
                                            }
                                            
                                        } else if(value.location.x > reader.size.width/2 && value.location.x < reader.size.width && value.location.y > reader.size.height/2 && stage.resultChild.count < 3){
                                            
                                            
                                            
                                            let offset = ((CGFloat(Int(stage.resultChild.count)) - 1)*(reader.size.width*0.18*0.2+(reader.size.width/12)))
                                            let x = reader.size.width*0.7-(reader.size.width*0.005)+offset
                                            
                                            let y = reader.size.height*0.75
                                            
                                            let newObject = InteractiveImageModel(image: draggedObject.image, isCorrect: false, x: x, y: y)
                                            if(!stage.resultChild.contains(where: {$0.image == draggedObject.image})){
                                                stage.resultChild.append(newObject)
                                                print(stage.resultChild)
                                            }
                                            
                                        }
                                        isDragging = false
                                        
                                    }
                                )
                        }
                        
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
                                        draggedObject.image = child.image
                                        draggedObject.x = value.location.x
                                        draggedObject.y = value.location.y
                                        isDragging = true
                                    }
                                    .onEnded { value in
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
                                        draggedObject.image = parent.image
                                        draggedObject.x = value.location.x
                                        draggedObject.y = value.location.y
                                        isDragging = true
                                    }
                                    .onEnded { value in
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
                                )
                        }
                        
                        if (isDragging) {
                            Image(draggedObject.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: reader.size.width*0.12)
                                .position(CGPoint(x: draggedObject.x, y: draggedObject.y))
                        }
                        
                    }
                    
                    .task{
                        userModel.load()
                        stageViewModel.load()
                        
                        stage = StageModel(prompt: stageViewModel.listPromptStage3, listImage: [], resultParent: [], resultChild: [])
                        for (index, image) in stageViewModel.listImagesStage3.enumerated() {
                            let x = reader.size.width*0.5 + ((CGFloat(Int(index)))-2)*reader.size.width*0.12
                            let y = reader.size.height*0.35
                            stage.listImage.append(InteractiveImageModel(image: image, isCorrect: false, x: CGFloat(x), y: y))
                        }
//                        stageViewModel.save(stages: [stage])
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

struct Stage3View_Previews: PreviewProvider {
    static var previews: some View {
        Stage3View(userModel: UserViewModel(),
                   stage: StageModel(prompt: [], listImage: [], resultParent: [], resultChild: []),
                   stageViewModel: StageViewModel())
        .previewInterfaceOrientation(.landscapeRight)
    }
}
