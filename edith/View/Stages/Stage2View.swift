//
//  Stage2View.swift
//  edith
//
//  Created by Muhammad Luthfi on 30/06/23.
//

import SwiftUI

struct Stage2View: View {
    @State var stage2: StageModel
    @State var listImages: [InteractiveImageModel] = []
    @State var resultsParents: [InteractiveImageModel] = []
    @State var resultsChild: [InteractiveImageModel] = []
    @State var listImagesName = ["stage1Apple", "stage1Car", "stage1Laptop", "stage1TeddyBear", "stage1Tee", "stage1Veggie", "stage1Water"]
    @ObservedObject var stageViewModel: StageViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        .task {
            for image in listImagesName {
                listImages.append(InteractiveImageModel(image: image, isCorrect: false, x: CGFloat(0), y: CGFloat(0)))
            }
            stageViewModel.load()
            var dataStages = stageViewModel.dataStages
            
//            stage2 = StageModel(prompt: ["cie", "cie"], listImage: listImages, resultParent: resultsParents, resultChild: resultsChild)
//            dataStages.append(stage2)
//            stageViewModel.save(stages: dataStages)
        }
    }
}

struct Stage2View_Previews: PreviewProvider {
    static var previews: some View {
        let emptyImageModel:[InteractiveImageModel] = []
        Stage2View(stage2: StageModel(prompt: [""], listImage: emptyImageModel, resultParent: emptyImageModel, resultChild: emptyImageModel), stageViewModel: StageViewModel())
    }
}
