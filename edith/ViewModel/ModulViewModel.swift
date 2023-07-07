//
//  ModulViewModel.swift
//  edith
//
//  Created by Muhammad Luthfi on 30/06/23.
//

import Foundation

import SwiftUI
class ModulViewModel:ObservableObject{
    static let modul=ModulViewModel()
    
    @AppStorage("modules") var modules:Data=Data()
    @Published var dataModules: [ModulModel] = []
    
    @Published var listHead: [String] = ["edithHeadStill", "edithHeadQuestion", "edithHeadSad", "edithHeadHappy", "edithHeadQuestion", "edithHeadSad", "edithHeadHappy"]
    @Published var listArm: [String] = ["edithWavingArms", "edithStillArms","edithStillArms","edithWavingArms", "edithStillArms", "edithWavingArms","edithWavingArms","edithWavingArms"]
    
    @Published var listPromptModul2: [String] = ["Kebutuhan bisa berubah menurut situasi kita.","Saat kita lapar, apa yang lebih kita butuhkan?","Air membantu kita saat haus. Coba pilih lainnya.","Benar! Makan apel dapat membuat kita tidak lapar.","Saat kita kedinginan, apa yang lebih kita butuhkan?","Sayur tidak bisa membuat kita hangat. Coba pilih lainnya.","Benar! Pakaian bisa membuat kita lebih hangat."]
    
    @Published var imageLeftRight: [String] = ["stageApple","stageWater","stageTee","stageVeggie"]
    @Published var imageCorrect: [String] = ["stageApple","stageTee"]
    
    
    let userDefaults = UserDefaults.standard
    var progress: [String] = []
//
//    func save(modules: [ModulModel]){
//        let jsonEncoder = JSONEncoder()
//        do{
//            let jsonData = try jsonEncoder.encode(modules)
//            self.modules=jsonData
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
//        dataModules = []
//        let jsonDecode=JSONDecoder()
//        do{
//            let jsonData = try jsonDecode.decode([ModulModel].self,from:modules)
//            for module in jsonData {
//                let module: ModulModel = ModulModel(modulName: module.modulName, prompt: module.prompt, edithImage: module.edithImage, listImage: module.listImage)
//                dataModules.append(module)
//            }
//            print("loaded")
////            print(dataModules)
//
//        }
//        catch{
//            print("error load data")
//        }
//
//    }
//
//    func saveModulProgress(modul: ModulModel){
//        load()
//        var modules = dataModules
//
//        if(modules.contains(where: {$0.modulName == modul.modulName})){
//            let index = modules.firstIndex(where: {$0.modulName == modul.modulName}) ?? 0
//            modules[index] = modul
//        } else {
//            modules.append(modul)
//        }
//        save(modules: modules)
//    }
//
//
//    func checkModel(modulName: String) -> Bool{
//        load()
//        return (dataModules.contains(where: {$0.modulName == modulName}))
//    }
    
    
    func saveProgress(modulName: String){
        progress = userDefaults.stringArray(forKey: "progress") ?? []
        var newProgress = progress
        if(newProgress.contains(where: {$0 == modulName})){
            let index = newProgress.firstIndex(where: {$0 == modulName}) ?? 0
            newProgress[index] = modulName
        } else {
            newProgress.append(modulName)
        }
        progress = newProgress
        userDefaults.set(progress, forKey: "progress")
    }
    
    func checkProgress(modulName: String) -> Bool{
        progress = userDefaults.stringArray(forKey: "progress") ?? []
        return progress.contains(where: {$0 == modulName})
    }
}

