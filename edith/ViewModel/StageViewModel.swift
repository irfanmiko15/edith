//
//  StageViewModel.swift
//  edith
//
//  Created by Muhammad Luthfi on 30/06/23.
//

import Foundation
import SwiftUI
class StageViewModel:ObservableObject{
    
    
    @State var listImages: [InteractiveImageModel] = []
    @State var resultsParents: [InteractiveImageModel] = []
    @State var resultsChild: [InteractiveImageModel] = []
    
    @AppStorage("stages") var stages:Data=Data()
    @Published var dataStages: [StageModel] = []
    

    func save(stages: [StageModel]){
        let jsonEncoder = JSONEncoder()
        do{
            let jsonData = try jsonEncoder.encode(stages)
            self.stages=jsonData

            print("Saved")
            DispatchQueue.main.async {
                self.load()
            }
        }
        catch{
            print("error save to appstorage")
        }
    }
    
    func load(){
        let jsonDecode=JSONDecoder()
        do{
            let jsonData = try jsonDecode.decode([StageModel].self,from:stages)
            for stage in jsonData {
                let stage: StageModel = StageModel(prompt: stage.prompt, listImage: stage.listImage, resultParent: stage.resultParent, resultChild: stage.resultChild)
                dataStages.append(stage)
            }
            print("loaded")
//            print(dataStages)
            
        }
        catch{
            print("error load data")
        }

    }
}
