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
    @Published var listImagesStage3 = ["stage1Apple", "stage1Water", "stage1Tee", "stage1Car", "stage1TeddyBear", "stage1Veggie", "stage1Laptop"]
    
    @Published var listPromptStage1 = ["Pindahkan 4 benda yang menurut kalian merupakan\nkebutuhan ke zona kalian masing - masing.", "Sekarang coba bandingkan barang yang telah kalian ambil dan diskusikan:\nMengapa kalian memilih barang-barang tersebut?\nApakah barang-barang itu benar-benar kebutuhan?"]
    @Published var listPromptStage2 = ["Saat lapar,\napa yang lebih dibutuhkan?", "Saat kedinginan,\napa yang lebih dibutuhkan?", "Saat mengerjakan tes,\napa yang lebih dibutuhkan?", "Saat tersesat di supermarket,\napa yang lebih dibutuhkan?", "Saat berenang,\napa yang lebih dibutuhkan?", "Saat pergi ke sekolah,\napa yang lebih dibutuhkan?", "Saat terluka,\napa yang lebih dibutuhkan?"]
    
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
