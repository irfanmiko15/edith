//
//  Stage1View.swift
//  edith
//
//  Created by Muhammad Luthfi on 30/06/23.
//
import SwiftUI

struct Stage1View: View {
    @State var stage1: StageModel
    @State var listImages: [InteractiveImageModel] = []
    @State var resultsParents: [InteractiveImageModel] = []
    @State var resultsChild: [InteractiveImageModel] = []
    @State var listImagesName = ["stage1Apple", "stage1Water", "stage1Tee", "stage1Car", "stage1TeddyBear", "stage1Veggie", "stage1Laptop"]
    
    @State var isDragging = false
    @State var draggedObject = InteractiveImageModel(image: "stage1Apple", x: CGFloat(0), y: CGFloat(0))
    
    @ObservedObject var stageViewModel: StageViewModel
    var body: some View {
        NavigationStack{
            GeometryReader {reader in
                ZStack{
                    Image("bgModul")
                        .resizable()
                        .scaledToFill()
                    VStack{
                        ZStack(alignment: .center){
                            ContainerView(textInside: "Pindahkan 4 benda yang menurut kalian merupakan \nkebutuhan ke zona kalian masing - masing.", strokeWidth: CGFloat(16), width: reader.size.width*0.9, height: reader.size.height*0.5*0.95)
                                .offset(x: reader.size.width*0.03)
                            ForEach(listImages) { image in
                                
                                Image(image.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: reader.size.width/10)
                                    .position(CGPoint(x: image.x, y: image.y))
                                    .offset(x: reader.size.width*0.03)
                                    .shadow(radius: 5)
                                    .gesture(DragGesture()
                                        .onChanged { value in
                                            draggedObject.image = image.image
                                            draggedObject.x = value.location.x
                                            draggedObject.y = value.location.y
                                            isDragging = true
                                        }
                                        .onEnded { value in
                                            if(value.location.x < reader.size.width/2 && value.location.x > 0 && value.location.y > reader.size.height/2 && resultsChild.count < 4){
                                                
                                                let x = reader.size.width*0.2 +  reader.size.width*(CGFloat(Int(resultsChild.count)%2))/8
                                                var y = CGFloat(0)
                                                if(resultsChild.count < 2){
                                                    y = reader.size.height*0.55 + CGFloat(reader.size.height*1/8)
                                                } else {
                                                    y = reader.size.height*0.6 + CGFloat(reader.size.height*2/8)
                                                }
                                            
                                                resultsChild.append(InteractiveImageModel(image: draggedObject.image, isCorrect: false, x: x, y: y))
                                            } else if(value.location.x > reader.size.width/2 && value.location.x < reader.size.width && value.location.y > reader.size.height/2 && resultsParents.count < 4){
                                                
                                                let x = reader.size.width*0.6 +  reader.size.width*(CGFloat(Int(resultsParents.count)%2))/8
                                                var y = CGFloat(0)
                                                if(resultsParents.count < 2){
                                                    y = reader.size.height*0.55 + CGFloat(reader.size.height*1/8)
                                                } else {
                                                    y = reader.size.height*0.6 + CGFloat(reader.size.height*2/8)
                                                }
                                                
                                                resultsParents.append(InteractiveImageModel(image: draggedObject.image, isCorrect: false, x: x, y: y))
                                            }
                                            isDragging = false
                                        }
                                    )
                            }
                            Image("stageEdithHead")
                                .resizable()
                                .scaledToFit()
                                .frame(width: reader.size.width/10, height: reader.size.width/10)
                                .foregroundColor(.white)
                                .background(Color.white).clipShape(Circle()).padding(8)
                                .clipShape(Circle()).overlay(Circle().stroke(Color.orangeFox70,lineWidth: 24)).background(Color.white).clipShape(Circle())
                                .position(x: reader.size.width*0.1, y: reader.size.height*0.25)
                            
                        }.frame(height: reader.size.height/2)
                        
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 32)
                                    .fill(Color.blueTang95)
                                    Text("ini punya anak")
                                RoundedRectangle(cornerRadius: 32)
                                    .stroke(Color.white, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                            }
                            .padding([.leading, .vertical], 32)
                            .padding([.trailing], 16)
                            .frame(width: reader.size.width/2)
                            ZStack{
                                RoundedRectangle(cornerRadius: 32)
                                    .fill(Color.redWood95)
                                Text("ini punya anak")
                                RoundedRectangle(cornerRadius: 32)
                                    .stroke(Color.white, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                            }
                            .padding([.trailing, .vertical], 32)
                            .padding([.leading], 16)
                            .frame(width: reader.size.width/2)
                        }.frame(height: reader.size.height/2)
                    }
                    if(isDragging){
                        Image(draggedObject.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: reader.size.width/10)
                            .position(CGPoint(x: draggedObject.x, y: draggedObject.y))
                    }
                    ForEach(resultsChild) { child in
                        Image(child.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: reader.size.width/10)
                            .position(CGPoint(x: child.x, y: child.y))
                            .offset(x: reader.size.width*0.03)
                            .shadow(radius: 5)
//                            .gesture(DragGesture()
//                                .onChanged { value in
//                                    draggedObject.image = image.image
//                                    draggedObject.x = value.location.x
//                                    draggedObject.y = value.location.y
//                                    isDragging = true
//                                }
//                                .onEnded { value in
//                                    isDragging = false
//                                }
//                            )
                    }
                    
                    
                    ForEach(resultsParents) { parent in
                        Image(parent.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: reader.size.width/10)
                            .position(CGPoint(x: parent.x, y: parent.y))
                            .offset(x: reader.size.width*0.03)
                            .shadow(radius: 5)
//                            .gesture(DragGesture()
//                                .onChanged { value in
//                                    draggedObject.image = image.image
//                                    draggedObject.x = value.location.x
//                                    draggedObject.y = value.location.y
//                                    isDragging = true
//                                }
//                                .onEnded { value in
//                                    isDragging = false
//                                }
//                            )
                    }
                }
                .navigationBarBackButtonHidden(false)
                .ignoresSafeArea(.all)
                
                .task {
                    for (index, image) in listImagesName.enumerated() {
                        let x = reader.size.width*0.2 + CGFloat(reader.size.width*CGFloat(Int(index))/10)
                        let y = reader.size.height*0.25 + CGFloat(reader.size.height*CGFloat((Int(index)+1)%2)/8)
                        listImages.append(InteractiveImageModel(image: image, isCorrect: false, x: CGFloat(x), y: y))
                    }
                    //                stage1 = StageModel(prompt: ["oke", "ok"], listImage: listImages, resultParent: resultsParents, resultChild: resultsChild)
                    //                stageViewModel.save(stages: [stage1])
                }
            }
            
        }
        
    }
}

struct Stage1View_Previews: PreviewProvider {
    static var previews: some View {
        let emptyImageModel:[InteractiveImageModel] = []
        Stage1View(stage1: StageModel(prompt: [""], listImage: emptyImageModel, resultParent: emptyImageModel, resultChild: emptyImageModel), stageViewModel: StageViewModel())
    }
}
