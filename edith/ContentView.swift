//
//  ContentView.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 21/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button("Click"){
                
            }
            .frame(width:100,height: 50)
            .buttonStyle(ThreeD(foregroundColor: Color.greenHill40, shadowColor: Color.greenHill30))
            Button{
                
            }label:{
                Image(systemName: "book").foregroundColor(Color.white).font(.system(size:40))
            }
            .frame(width:100,height: 100)
            .buttonStyle(StageButton(
                foregroundColor: Color.greenGrass50, shadowColor: Color.greenGrass40
            ))
            
            Text("test Baloo").font(.custom(Font.balooBold, size: 20))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
