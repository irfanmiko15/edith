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
        OnboardingView(userModel: UserViewModel())
        
        .task{
            userModel.load()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userModel: UserViewModel())
    }
}
