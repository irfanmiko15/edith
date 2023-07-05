//
//  ContentView.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 21/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userModel: UserViewModel
    
    var body: some View {
//        ZStack{
//            if(userModel.dataUser.name.isEmpty){
//                ChooseAvatarView(userModel: UserViewModel())
//            }
//            else{
////                WorldMapView(userModel: UserViewModel())
//                Challenge1View(challengeViewModel: ChallengeViewModel())
//            }
//        }.onAppear{
//            userModel.load()
//        }
        Challenge1View(challengeViewModel: ChallengeViewModel())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userModel: UserViewModel())
    }
}
