//
//  edithApp.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 21/06/23.
//

import SwiftUI

@main
struct edithApp: App {
    
    var emptyImageModel:[InteractiveImageModel] = []
   
    var body: some Scene {
        WindowGroup {
            WorldMapView()
        }
    }
}
