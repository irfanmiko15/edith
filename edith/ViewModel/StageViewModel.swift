//
//  StageViewModel.swift
//  edith
//
//  Created by Muhammad Luthfi on 30/06/23.
//

import Foundation
import SwiftUI
class StageViewModel:ObservableObject{
    static let stage=StageViewModel()
    
    @Published var listImagesStage1 = ["stageApple", "stageWater", "stageTee", "stageCar", "stageTeddyBear", "stageVeggie", "stageLaptop"]
    @Published var listImagesStage2 = ["stageApple", "stageWater", "stageVeggie", "stageTee", "stageLolipop", "stagePencil", "stageTeddyBear", "stagePhone", "stageFloat", "stageCar", "stageBag", "stageChips", "stageShoe", "stageBandAid"]
    @Published var listRightImagesStage2 = ["stageApple", "stageTee", "stagePencil", "stagePhone", "stageFloat", "stageBag", "stageBandAid"]
    @Published var listImagesStage3 = ["stageBag", "stageMilk", "stageTeddyBear", "stageLaptop", "stageBook"]
    
    @Published var listPromptStage1 = ["Pindahkan 4 benda yang menurut kalian merupakan\nkebutuhan ke zona kalian masing - masing.", "Sekarang coba diskusikan, mengapa benda-benda ini adalah kebutuhan kalian?"]
    @Published var listPromptStage2 = ["Saat lapar,\napa yang lebih dibutuhkan?", "Saat kedinginan,\napa yang lebih dibutuhkan?", "Saat mengerjakan tes,\napa yang lebih dibutuhkan?", "Saat ingin menghubungi teman,\napa yang lebih dibutuhkan?", "Saat berenang,\napa yang lebih dibutuhkan?", "Saat pergi ke sekolah,\napa yang lebih dibutuhkan?", "Saat terluka,\napa yang lebih dibutuhkan?"]
    @Published var listPromptStage3 = ["Saat ingin pergi ke sekolah, \napa saja 3 benda yang akan kamu butuhkan?", "Sekarang coba diskusikan, mengapa kamu membutuhkan 3 benda tersebut untuk ke sekolah?"]
    
    let userDefaults = UserDefaults.standard
    var progress: [String] = []
    
    func saveProgress(stageName: String){
        progress = userDefaults.stringArray(forKey: "progress") ?? []
        var newProgress = progress
        if(newProgress.contains(where: {$0 == stageName})){
            let index = newProgress.firstIndex(where: {$0 == stageName}) ?? 0
            newProgress[index] = stageName
        } else {
            newProgress.append(stageName)
        }
        progress = newProgress
        userDefaults.set(progress, forKey: "progress")
    }
    
    func checkProgress(stageName: String) -> Bool{
        progress = userDefaults.stringArray(forKey: "progress") ?? []
        return progress.contains(where: {$0 == stageName})
    }
    
    
//    @AppStorage("stages") var stages:Data=Data()
//    @Published var dataStages: [StageModel] = []
    
    
//    func save(stages: [StageModel]){
//        let jsonEncoder = JSONEncoder()
//        do{
//            let jsonData = try jsonEncoder.encode(stages)
//            self.stages=jsonData
//
//            print("Saved")
//            DispatchQueue.main.async {
//                self.load()
//            }
//        }
//        catch{
//            print("error save to appstorage")
//        }
//    }
//
//    func load(){
//        let jsonDecode=JSONDecoder()
//        do{
//            dataStages = []
//            let jsonData = try jsonDecode.decode([StageModel].self,from:stages)
//            for stage in jsonData {
//                let stage: StageModel = StageModel(stagename: stage.stagename, prompt: stage.prompt, listImage: stage.listImage, resultParent: stage.resultParent, resultChild: stage.resultChild)
//                dataStages.append(stage)
//            }
//            print("loaded")
//            print(dataStages)
//            print(dataStages.count)
//        }
//        catch{
//            print("error load data")
//        }
//
//    }
//
//    func saveStageProgress(stage: StageModel){
//        load()
//        var stages = dataStages
//
//        if(stages.contains(where: {$0.stagename == stage.stagename})){
//            let index = stages.firstIndex(where: {$0.stagename == stage.stagename}) ?? 0
//            stages[index] = stage
//        } else {
//            stages.append(stage)
//        }
//        save(stages: stages)
//    }
    
    
//    func checkModel(stageName: String) -> Bool{
//        load()
//        return (dataStages.contains(where: {$0.stagename == stageName}))
//    }
    
    
}
