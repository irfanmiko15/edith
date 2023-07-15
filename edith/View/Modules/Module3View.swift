//
//  Module3View.swift
//  edith
//
//  Created by Evelyn Megawati Tiffany on 04/07/23.
//

import SwiftUI

struct Module3View: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var modulViewModel: ModulViewModel
    @State var modul: ModulModel
    
    @State var indexPrompt:Int = 0
    
    var body: some View {
        NavigationStack{
            GeometryReader{reader in
                ZStack{
                    // BACKGROUND
                    ZStack{
                        Image("bgModul")
                            .resizable()
                            .scaledToFill()
                            .blur(radius: 16)
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: .infinity)
                            .opacity(0.2)
                    }
                    
                    if(indexPrompt > 0){
                        Button{
                            if indexPrompt < modulViewModel.listPromptModul1.count {
                                indexPrompt -= 1
                            }
                        }label:{
                            Image(systemName: "chevron.left").font(.system(size:50).bold())
                                .frame(width:60,height: 60)
                                .foregroundColor(Color.orangeFox50)
                        }.frame(width:100)
                            .offset(x: -555,y: 400)
                            .buttonStyle(BackThreeD())
                    }
    
                    
                    
                    // CONTENT
                    ZStack{
                        ZStack{
                            EdithFigure(pose: modulViewModel.listEdithPoseModul3[indexPrompt],
                                        width: (reader.size.width/3)-(reader.size.width*0.05))
                        }
                        .position(x: ((reader.size.width*2/5)*0.5)+reader.size.width*0.05,
                                  y: reader.size.height*0.5)
                        
                        ZStack{
                            PromptBox(textInside: modulViewModel.listPromptModul3[indexPrompt],
                                      width: reader.size.width*3/5-(reader.size.width*0.1),
                                      height: reader.size.height/3,
                                      textSize: Int(reader.size.width*0.025))
                            .position(x: reader.size.width*0.5*(3/5),y: reader.size.height*0.5)
                            
                            Button{
                                if indexPrompt < modulViewModel.listPromptModul3.count-1 {
                                    indexPrompt += 1
                                } else{
                                    modulViewModel.saveProgress(modulName: "Modul 3")
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            } label: {
                                Text(indexPrompt == modulViewModel.listPromptModul3.count-1 ? "Selesai" : "Next")
                                    .font(.custom(Font.balooBold, size: 50))
                                    .foregroundColor(.white)
                            }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                                .frame(width: reader.size.width/6,
                                       height: reader.size.height/10)
                                .position(x: (reader.size.width*3/5)*0.5+(reader.size.width*0.025),
                                          y: reader.size.height*0.5 + (reader.size.height*0.5*(1/3)))
                        }
                        .frame(width: reader.size.width*3/5)
                        .position(x: (reader.size.width*0.5*3/5)+(reader.size.width*2/5),
                                  y: reader.size.height*0.55)
                        .offset(y: -reader.size.height/20)
                    }
                    
                    // CLOSE BUTTON
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    }label: {
                        Image(systemName: "map")
                            .resizable()
                            .foregroundColor(.white)
                            .font(Font.title.weight(.black))
                            .frame(width: 30,height: 30)
                    }.frame(width: reader.size.height*0.1, height: 90)
                        .position(CGPoint(x: reader.size.width-(45)-reader.size.width*0.025,
                                          y: 45+(reader.size.width*0.025)))
                        .buttonStyle(CloseButton())
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
            }
            .ignoresSafeArea(.all)
        }
    }
}

struct Module3View_Previews: PreviewProvider {
    static var previews: some View {
        Module3View(modulViewModel: ModulViewModel(), modul: ModulModel(modulName: "Stage 3", prompt: [], edithImage: [], listImage: []))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
