//
//  ModulViewModel.swift
//  edith
//
//  Created by Muhammad Luthfi on 30/06/23.
//

import Foundation

import SwiftUI
class ModulViewModel:ObservableObject{
    
    @AppStorage("modules") var modules:Data=Data()
    @Published var dataModules: [ModulModel] = []
    

    func save(modules: [ModulModel]){
        let jsonEncoder = JSONEncoder()
        do{
            let jsonData = try jsonEncoder.encode(modules)
            self.modules=jsonData

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
            let jsonData = try jsonDecode.decode([ModulModel].self,from:modules)
            for module in jsonData {
                let module: ModulModel = ModulModel(prompt: module.prompt, edithImage: module.edithImage, listImage: module.listImage)
                dataModules.append(module)
            }
            print("loaded")
//            print(dataModules)
            
        }
        catch{
            print("error load data")
        }

    }
}

