//
//  edithApp.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 21/06/23.
//

import SwiftUI

@main
struct edithApp: App {
   
    var body: some Scene {
        WindowGroup {
            Stage1View(stage1: StageModel(prompt: ""))
        }
    }
}
