//
//  Stage1View.swift
//  edith
//
//  Created by Muhammad Luthfi on 30/06/23.
//
import SwiftUI

struct Stage1View: View {
    @StateObject var userModel: UserViewModel
    
    @State var stage: StageModel
    @State var isDragging = false
    @State var draggedObject = InteractiveImageModel(image: "stageApple", x: CGFloat(0), y: CGFloat(0))
    
    @ObservedObject var stageViewModel: StageViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var isTutorial = true
    @State var isConfirming = false
    @State var isDiscussing = false
    
    @State var currentPrompt = ""
    @State var pointerPosition = CGPoint(x: 0, y: 0)
    
    var body: some View {
        NavigationStack{
            GeometryReader { reader in
                //VIEW
                ZStack {
                    // BACKGROUND
                    ZStack{
                        Image("bgModul")
                            .resizable()
                            .scaledToFill()
                            .blur(radius: 16)
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: .infinity)
                            .opacity(0.2)
                    }
                    
                    // CONTAINERS
                    Group{
                        
                        ZStack{
                            ContainerView(textInside: currentPrompt,
                                          strokeWidth: CGFloat(16),
                                          width: reader.size.width*0.9,
                                          height: reader.size.height*0.42,
                                          textSize: (isDiscussing ? 30 : 24),
                                          isCenter: isDiscussing)
                        }
                        .position(x: reader.size.width*0.5, y: reader.size.height*0.25)
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 32)
                                .fill(Color.blueTang95)
                                .frame(width: reader.size.width*0.42)
                            
                            RoundedRectangle(cornerRadius: 32)
                                .stroke(Color.white, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                                .frame(width: reader.size.width*0.42)
                            
                            CircleAvatar(imageName:userModel.dataUser.parent.image, color: Color.white, strokeWidth: 16)
                                .frame(width: reader.size.width*0.1, height: reader.size.width*0.1)
                                .offset(x: -reader.size.width*0.4*0.5, y: reader.size.height*0.45*0.4)
                            
                            CounterObject(counter: stage.resultParent.count, maxCount: 4, color: Color.blueTang70, width: reader.size.width*0.06, height: reader.size.height*0.05, fontSize: 32, cornerRadius: reader.size.height*0.015)
                                .offset(x: -reader.size.width*0.3*0.5, y: reader.size.height*0.45*0.5)
                            
                        }
                        .frame(width: reader.size.width*0.4, height: reader.size.height*0.45)
                        .position(x: reader.size.width*0.25, y: reader.size.height*0.75)
                        .offset(x: reader.size.width*0.025, y: -reader.size.height*0.025)
                        
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 32)
                                .fill(Color.cardinal95)
                                .frame(width: reader.size.width*0.42)
                            
                            RoundedRectangle(cornerRadius: 32)
                                .stroke(Color.white, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                                .frame(width: reader.size.width*0.42)
                            
                            CircleAvatar(imageName:userModel.dataUser.child.cropImage, color: Color.white, strokeWidth: 16)
                                .frame(width: reader.size.width*0.1, height: reader.size.width*0.1)
                                .offset(x: reader.size.width*0.4*0.5, y: reader.size.height*0.45*0.4)
                            
                            CounterObject(counter: stage.resultChild.count, maxCount: 4, color: Color.cardinal70, width: reader.size.width*0.06, height: reader.size.height*0.05, fontSize: 32, cornerRadius: reader.size.height*0.015)
                                .offset(x: reader.size.width*0.3*0.5, y: reader.size.height*0.45*0.5)
                            
                        }
                        .frame(width: reader.size.width*0.4, height: reader.size.height*0.45)
                        .position(x: reader.size.width*0.75, y: reader.size.height*0.75)
                        .offset(x: -reader.size.width*0.025, y: -reader.size.height*0.025)
                    }
                    
                    // OBJECTS
                    Group{
                        
                        if(!isDiscussing){
                            
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
                                            let pos = [-0.5, 0.5]
                                            if(value.location.x < reader.size.width/2 && value.location.x > 0 && value.location.y > reader.size.height/2 && stage.resultParent.count < 4){
                                                
                                                let x = reader.size.width*0.25 +  reader.size.width*(pos[stage.resultParent.count%2])*0.15
                                                let y = reader.size.height*0.75 - reader.size.height*0.025 +  reader.size.height*(pos[(stage.resultParent.count - 1) < 1 ? 0 : 1])*0.17
                                                
                                                let newObject = InteractiveImageModel(image: draggedObject.image, isCorrect: false, x: x, y: y)
                                                if(!stage.resultParent.contains(where: {$0.image == draggedObject.image})){
                                                    stage.resultParent.append(newObject)
                                                    if(stage.resultChild.count == 4 && stage.resultParent.count == 4){
                                                        isConfirming = true
                                                    }
                                                    //                                                print(stage.resultParent)
                                                }
                                                
                                            } else if(value.location.x > reader.size.width/2 && value.location.x < reader.size.width && value.location.y > reader.size.height/2 && stage.resultChild.count < 4){
                                                
                                                let x = reader.size.width*0.7 +  reader.size.width*(pos[stage.resultChild.count%2])*0.15
                                                let y = reader.size.height*0.75 - reader.size.height*0.025 +  reader.size.height*(pos[(stage.resultChild.count - 1) < 1 ? 0 : 1])*0.17
                                                
                                                let newObject = InteractiveImageModel(image: draggedObject.image, isCorrect: false, x: x, y: y)
                                                if(!stage.resultChild.contains(where: {$0.image == draggedObject.image})){
                                                    stage.resultChild.append(newObject)
                                                    if(stage.resultChild.count == 4 && stage.resultParent.count == 4){
                                                        isConfirming = true
                                                    }
                                                    //                                                print(stage.resultChild)
                                                    //                                                stageViewModel.saveProgress(stageName: "Stage 1")
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
                                .frame(width: reader.size.width/10)
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
                                                        if((stage.resultChild.count-1) > index ?? 4){
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
                                .frame(width: reader.size.width/10)
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
                                                        if((stage.resultParent.count-1) > index ?? 4){
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
                        Image(systemName: "xmark")
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
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: reader.size.width, height: reader.size.height)
                                .opacity(0.6)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(Color.white)
                                    .frame(width: reader.size.width*0.5, height: reader.size.height*0.6)
                                
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(Color.orangeFox70, style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round))
                                    .frame(width: reader.size.width*0.5, height: reader.size.height*0.6)
                                VStack(spacing: 0){
                                    Image("edithBertanya")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: reader.size.height*0.35)
                                    Text("Apakah kalian sudah selesai\nmemindahkan semua kebutuhan?")
                                        .frame(width: reader.size.width*0.5, height: reader.size.height*0.15)
                                        .multilineTextAlignment(.center)
                                        .font(.custom(Font.balooBold, size: CGFloat(32)))
                                }
                                
                                Button{
                                    isConfirming = false
                                    isDiscussing = true
                                    currentPrompt = stageViewModel.listPromptStage1[1]
                                }label:{
                                    Text("Sudah")
                                        .font(.custom(Font.balooBold, size: 50))
                                        .foregroundColor(.white)
                                }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                                    .frame(width: reader.size.width/6, height: reader.size.height/10)
                                    .position(x: reader.size.width*0.5 + reader.size.width*0.1,
                                              y: reader.size.height*0.3 + reader.size.height*0.5)
                                
                                Button{
                                    isConfirming = false
                                }label:{
                                    Text("Belum")
                                        .font(.custom(Font.balooBold, size: 50))
                                        .foregroundColor(.white)
                                }.buttonStyle(ThreeD(foregroundColor: .orangeFox50, shadowColor: .orangeFox50))
                                    .frame(width: reader.size.width/6, height: reader.size.height/10)
                                    .position(x: reader.size.width*0.5 - reader.size.width*0.1,
                                              y: reader.size.height*0.3 + reader.size.height*0.5)
                            }
                            .position(x: reader.size.width*0.5, y: reader.size.height*0.5)
                        }
                    }
                    
                    // END BUTTON
                    if(isDiscussing){
                        Button{
                            presentationMode.wrappedValue.dismiss()
                            stageViewModel.saveProgress(stageName: "Stage 1")
                        }label:{
                            Text("AKHIRI DISKUSI")
                                .font(.custom(Font.balooBold, size: 36))
                                .foregroundColor(.white)
                        }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                            .frame(width: reader.size.width*0.25, height: reader.size.height/10)
                            .position(x: reader.size.width*0.5 + reader.size.width*0.3,
                                      y: reader.size.height*0.5 - reader.size.height*0.075)
                    }
                    
                    // TUTORIAL
                    if(isTutorial){
                        Image("pointer")
                            .position(pointerPosition)
                            .onAppear(){
                                let x1 = reader.size.width*0.26
                                let y1 = reader.size.height*0.4
                                pointerPosition = CGPoint(x: x1, y: y1)
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    
                                    let x2 = reader.size.width*0.25
                                    let y2 = reader.size.height*0.75
                                    
                                    withAnimation(.easeInOut(duration: 2.0).repeatForever()){
                                        pointerPosition = CGPoint(x: x2, y: y2)
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {
                                            
                                            isTutorial = false
                                        }
                                    }
                                }
                            }
                    }
                    
                }
                
                //LOGIC
                .task {
                    userModel.load()
                    stage = StageModel(stagename: "Stage 1", prompt: stageViewModel.listPromptStage1, listImage: [], resultParent: [], resultChild: [])
                    for (index, image) in stageViewModel.listImagesStage1.enumerated() {
                        let x = reader.size.width*0.23 + CGFloat(reader.size.width*CGFloat(Int(index))/10)
                        let y = reader.size.height*0.23 + CGFloat(reader.size.height*CGFloat((Int(index)+1)%2)/8)
                        stage.listImage.append(InteractiveImageModel(image: image, isCorrect: false, x: CGFloat(x), y: y))
                    }
                    currentPrompt = stageViewModel.listPromptStage1[0]
                    
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
            .ignoresSafeArea(.all)
            
        }
        
    }
}

struct Stage1View_Previews: PreviewProvider {
    static var previews: some View {
        let emptyImageModel:[InteractiveImageModel] = []
        Stage1View(userModel: UserViewModel(), stage: StageModel(stagename: "", prompt: [""], listImage: emptyImageModel, resultParent: emptyImageModel, resultChild: emptyImageModel), stageViewModel: StageViewModel())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
