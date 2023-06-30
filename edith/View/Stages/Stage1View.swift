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
    @State var listImagesName = ["stage1Apple", "stage1Car", "stage1Laptop", "stage1TeddyBear", "stage1Tee", "stage1Veggie", "stage1Water"]
    
    var body: some View {
        GeometryReader {reader in
            VStack{
                ZStack{
                    HStack{
                        ForEach(listImages) { image in
                            Image(image.image)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }.frame(height: reader.size.height/2)
                HStack{
                    VStack{
                        Text("ini punya bapak")
                    }.frame(width: reader.size.width/2)
                    VStack{
                        Text("ini punya anak")
                    }.frame(width: reader.size.width/2)
                }.frame(height: reader.size.height/2)
            }
        }
        
        .task {
            for image in listImagesName {
                listImages.append(InteractiveImageModel(image: image, isCorrect: false, x: CGFloat(0), y: CGFloat(0)))
            }
            stage1 = StageModel(prompt: "oke", listImage: listImages, resultParent: resultsParents, resultChild: resultsChild)
        }
    }
}

struct Stage1View_Previews: PreviewProvider {
    static var previews: some View {
        Stage1View(stage1: StageModel(prompt: ""))
    }
}
