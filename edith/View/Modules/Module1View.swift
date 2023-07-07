//
//  Module1View.swift
//  edith
//
//  Created by Muhammad Luthfi on 30/06/23.
//

import SwiftUI

struct Module1View: View {
    @ObservedObject var modulViewModel: ModulViewModel
    @Environment(\.presentationMode) var presentationMode
    //    @AppStorage("modul1Stage1") var modul1Stage1:Bool=false
    @State var listPrompt: [String] = ["Kebutuhan adalah semua hal yang diperlukan untuk hidup.","Makanan, air, pakaian dan tempat tinggal adalah kebutuhan.", "Tanpa kebutuhan, kita tidak bisa bertahan hidup.", "Keinginan adalah hal-hal yang diharapkan untuk dimiliki.","Boneka, sepeda dan mainan baru adalah  contoh keinginan.","Tanpa keinginan, kita masih bisa bertahan hidup.","Sekarang, kita akan coba membedakan keinginan dan kebutuhan.","Apakah kalian siap?"]
    
    @State var prompts: [ModulModel]
    
    @State var indexPrompt:Int = 0
    
    @State var yOffset: CGFloat = 0
    @State var yOffsett: CGFloat = 0
    @State var scaleEffect: CGFloat = 0.8
    @State var opacityCircle: CGFloat = 0.8
    
    @State var listHead: [String] = ["edithHeadStill", "edithHeadStill", "edithHeadSad", "edithHeadStill", "edithHeadStill", "edithHeadStill", "edithHeadStill", "edithHeadHappy"]
    @State var listArm: [String] = ["edithWavingArms", "edithStillArms","edithStillArms","edithWavingArms", "edithStillArms", "edithWavingArms","edithWavingArms","edithWavingArms"]
    
    @State var indexHead: Int = 0
    @State var indexArm: Int = 0
    
    var body: some View {
        NavigationStack{
            GeometryReader{reader in
                ZStack{
                    Image("bgModul")
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 10)
                    
                    //                Button{
                    //
                    //
                    //
                    //                }label:{
                    //
                    //                    Image(systemName: "multiply.circle.fill")
                    //                        .onAppear()
                    //                        .symbolRenderingMode(.palette)
                    //                        .foregroundStyle(.white,Color.orangeFox50)
                    //                        .font(.system(size: 100))
                    //                        .bold()
                    //                        .offset(x:550, y: -400)
                    //                        .shadow(color: Color.orangeFox70, radius: 0, x:10, y:10)
                    //                }
                    //
//                    Button{
//
//                        //                    modul1Stage1=true
//                        modulViewModel.saveProgress(modulName: "Modul 1")
//                        self.presentationMode.wrappedValue.dismiss()
//
//                    }label:{
//                        ZStack{
//
//                            Circle()
//                                .fill(Color.orangeSomething)
//                            Image(systemName: "multiply")
//                                .font(.system(size:40)
//                                    .bold())
//                                .frame(width:60,height: 60)
//                                .foregroundColor(Color.white)
//                        }
//                    }.frame(width:70)
//                        .offset(x: 555,y: -400)
                    
                    Button{
                        
                        if indexPrompt < listPrompt.count-1 {
                            indexPrompt -= 1
                            indexArm -= 1
                            indexHead -= 1
                            
                            
                        }
                        
                        else{
                            
                        }
                        
                    }label:{
                        Image(systemName: "chevron.left").font(.system(size:50).bold())
                            .frame(width:60,height: 60)
                            .foregroundColor(Color.orangeFox50)
                    }.frame(width:100)
                        .offset(x: -555,y: 400)
                        .buttonStyle(BackThreeD())
                    
                    
                    HStack{
                        
                        VStack {
                            VStack{
                                Image(listHead[indexHead])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 475)
                                    .offset(y:yOffset)
                                    .task{
                                        withAnimation(Animation.easeOut(duration: 1.6).repeatForever()){
                                            yOffset = 20
                                        }
                                    }
                                
                                
                                ZStack{
                                    
                                    CasePoses(switchPoses: listArm[indexArm])
                                    
                                    Image("edithBodyStill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 280)
                                    
                                    Circle()
                                        .stroke(RadialGradient(colors: [Color("orangeSomething"), Color("orangeSomething"), Color.white, Color.white, Color.clear], center: .center, startRadius: 30, endRadius: 50), lineWidth: 25)
                                        .frame(width: 95)
                                        .offset(x:3, y:-55)
                                        .opacity(opacityCircle)
                                }.offset(y:yOffsett)
                                    .task{
                                        withAnimation(Animation.easeOut(duration: 1.75).repeatForever()){
                                            yOffsett = 20
                                            opacityCircle = 0.1
                                        }
                                        
                                    }
                            }.shadow(color: .white, radius: 20)
                                .shadow(color: .white, radius: 20)
                            
                            
                            Image("edithShadow")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300)
                                .scaleEffect(scaleEffect)
                                .task {
                                    withAnimation(Animation.easeOut(duration: 1.75).repeatForever()){
                                        scaleEffect = 1.2
                                    }
                                    
                                }
                            
                        }
                        
                        VStack{
                            PromptBox(textInside: listPrompt[indexPrompt], width: reader.size.width/2, height: reader.size.height/3, textSize: 35)
                            
                            Button{
                                
                                if indexPrompt < listPrompt.count-1 {
                                    indexPrompt += 1
                                    indexArm += 1
                                    indexHead += 1
                                    
                                } else{
                                    //                                modul1Stage1=true
                                    modulViewModel.saveProgress(modulName: "Modul 1")
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                                
                            }label:{
                                Text("OK!")
                                    .font(.custom(Font.balooBold, size: 50))
                                    .foregroundColor(.white)
                            }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                                .frame(width: reader.size.width/6, height: reader.size.height/10)
                                .offset(x:45, y:-50)
                        }
                        
                    }
                    
                    
                    // CLOSE BUTTON
                    Button{
                        modulViewModel.saveProgress(modulName: "Modul 1")
                        presentationMode.wrappedValue.dismiss()
                    }label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .foregroundColor(.white)
                            .font(Font.title.weight(.black))
                            .frame(width: 30,height: 30)
                    }.frame(width:90,height: 90)
                        .position(CGPoint(x: reader.size.width-(45)-reader.size.width*0.025, y: 45+(reader.size.width*0.025)))
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
        Module1View(modulViewModel: ModulViewModel(), prompts: [ModulModel(modulName: "Modul 1", prompt: [], edithImage: [], listImage: [])])
            .previewInterfaceOrientation(.landscapeRight)
    }
}
