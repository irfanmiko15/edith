//
//  Module1View.swift
//  edith
//
//  Created by Muhammad Luthfi on 30/06/23.
//

import SwiftUI

struct Module1View: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var modulViewModel: ModulViewModel
    @State var indexPrompt:Int = 0
    
    var body: some View {
        NavigationStack{
            GeometryReader{reader in
                // VIEW
                ZStack{
                    // BACKGROUND
                    ZStack{
                        Image("bgModul")
                            .resizable()
                            .scaledToFill()
                            .blur(radius: 16)
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: .infinity)
                            .opacity(0.2)
                    }
                    
                    //                    Button{
                    //                        if indexPrompt < modulViewModel.listPromptModul1.count-1 {
                    //                            indexPrompt -= 1
                    //                        }
                    //                    }label:{
                    //                        Image(systemName: "chevron.left").font(.system(size:50).bold())
                    //                            .frame(width:60,height: 60)
                    //                            .foregroundColor(Color.orangeFox50)
                    //                    }.frame(width:100)
                    //                        .offset(x: -555,y: 400)
                    //                        .buttonStyle(BackThreeD())
                    //
                    //
                    
                    // CONTENT
                    ZStack{
                        ZStack{
                            EdithFigure(pose: modulViewModel.listEdithPoseModul1[indexPrompt],
                                        width: (reader.size.width/3)-(reader.size.width*0.05))
                        }
                        .position(x: ((reader.size.width*2/5)*0.5)+reader.size.width*0.05,
                                  y: reader.size.height*0.5)
                        
                        ZStack{
                            PromptBox(textInside: modulViewModel.listPromptModul1[indexPrompt],
                                      width: reader.size.width*3/5-(reader.size.width*0.1),
                                      height: reader.size.height/3,
                                      textSize: Int(reader.size.width*0.025))
                            .position(x: reader.size.width*0.5*(3/5),y: reader.size.height*0.5)
                            
                            Button{
                                if indexPrompt < modulViewModel.listPromptModul1.count-1 {
                                    indexPrompt += 1
                                } else{
                                    modulViewModel.saveProgress(modulName: "Modul 1")
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            } label: {
                                Text("OK!")
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
                        Image(systemName: "xmark")
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

struct Module1View_Previews: PreviewProvider {
    static var previews: some View {
        Module1View(modulViewModel: ModulViewModel())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
