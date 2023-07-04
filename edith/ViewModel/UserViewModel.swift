//
//  UserViewModel.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 28/06/23.
//

import Foundation
import SwiftUI
class UserViewModel:ObservableObject{
    static let user=UserViewModel()
    
    @AppStorage("user") var users:Data=Data()
    @Published var dataUser:UserModel=UserModel(name: "", child: ChildAvatarModel(fullImage: "", cropImage: "String", isSelected: false), parent: ParentAvatarModel(name: "", image: "", isSelected: false))
    func save(user: UserModel){
        let jsonEncoder = JSONEncoder()
        do{
            let jsonData = try jsonEncoder.encode(user)
            self.users=jsonData
            
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
            let jsonData = try jsonDecode.decode(UserModel.self,from:users)
            print(jsonData)
            dataUser.name=jsonData.name
            dataUser.child=jsonData.child
            dataUser.parent=jsonData.parent
            print("loaded")
            print(dataUser.parent)
        }
        catch{
            print("error load data")
        }

    }
}
