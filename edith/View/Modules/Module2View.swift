//
//  Module2View.swift
//  edith
//
//  Created by Evelyn Megawati Tiffany on 03/07/23.
//

import SwiftUI

struct Module2View: View {
    
    //        @ObservedObject var modulViewModel: ModulViewModel
            @Environment(\.presentationMode) var presentationMode
            @AppStorage("modul1Stage1") var modul1Stage1:Bool=false
            @State var listPrompt: [String] = ["Kebutuhan bisa berubah menurut situasi kita.","Saat kita lapar, apa yang lebih kita butuhkan?","Air membantu kita saat haus. Coba pilih lainnya.","Benar! Makan apel dapat membuat kita tidak lapar.","Saat kita kedinginan, apa yang lebih kita butuhkan?","Sayur tidak bisa membuat kita hangat. Coba pilih lainnya.","Benar! Pakaian bisa membuat kita lebih hangat."]
            
    //        @State var prompts: [ModulModel]
            
            @State var indexPrompt:Int = 0
            
            @State var yOffset: CGFloat = 0
            @State var yOffsett: CGFloat = 0
            @State var scaleEffect: CGFloat = 0.8
            @State var opacityCircle: CGFloat = 0.8
            
            @State var listHead: [String] = ["edithHeadStill", "edithHeadQuestion", "edithHeadSad", "edithHeadHappy", "edithHeadQuestion", "edithHeadSad", "edithHeadHappy"]
            @State var listArm: [String] = ["edithWavingArms", "edithStillArms","edithStillArms","edithWavingArms", "edithStillArms", "edithWavingArms","edithWavingArms","edithWavingArms"]
            
            @State var indexHead: Int = 0
            @State var indexArm: Int = 0
    @State var listImageLeft:[InteractiveImageModel] = []
    @State var listImageRight:[InteractiveImageModel] = []
    
    var body: some View {
            GeometryReader{reader in
                ZStack{
                    Image("bgModul")
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 10)
                    
                    Button{
                        
                        modul1Stage1=true
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }label:{
                        ZStack{
                            
                        Circle()
                                .fill(Color.orangeSomething)
                        Image(systemName: "multiply")
                            .font(.system(size:40)
                                .bold())
                            .frame(width:60,height: 60)
                            .foregroundColor(Color.white)
                    }
                    }.frame(width:70)
                    .offset(x: 555,y: -400)
                    
                    Button{

                        if indexPrompt < listPrompt.count-1 {
                            indexPrompt += 2
                            indexArm += 2
                            indexHead += 2
                        }else{
                            
                        }
 
                    }label:{
                        
                        ZStack{
                            
                            Circle()
                                .fill(Color.orangeFox50)
                                .offset(x:20, y:20)
                            
                            Circle()
                                .fill(Color.white)
                                .overlay(
                                    Circle()
                                        .stroke(Color.orangeSomething, lineWidth: 15))
                            
                            Image("stage1Apple")
                                .resizable()
                                .scaledToFit()
                                .frame(width:170)
                        }
                    }.frame(width: 250)
                        .offset(x:100, y:250)
                    
                   
                    Button{
                        
                        if indexPrompt < listPrompt.count-1 {
                            indexPrompt += 1
                            indexArm += 1
                            indexHead += 1
                        }else{
                            
                        }
        
                    }label:{
                        
                        ZStack{
                            
                            Circle()
                                .fill(Color.orangeFox50)
                                .offset(x:20, y:20)
                            
                            Circle()
                                .fill(Color.white)
                                .overlay(
                                    Circle()
                                        .stroke(Color.orangeSomething, lineWidth: 15))
                            
                            Image("stage1Water")
                                .resizable()
                                .scaledToFit()
                                .frame(width:170)
                                .offset(x:10, y:8)
                        }
                    }.frame(width: 250)
                        .offset(x:450, y:250)
                    
                    
                    Image(systemName: "checkmark.circle.fill")
                        .onAppear()
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.white,.green)
                        .font(.system(size: 100))
                        .bold()
                        .offset(x:200, y: 350)
                    
                    
                    Image(systemName: "multiply.circle.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.white,.red)
                        .font(.system(size: 100))
                        .bold()
                        .offset(x:550, y: 350)
                    
            
                    
                    
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
                                .offset(y: -125)
                            
                            Button{
                                
                                if indexPrompt < listPrompt.count-1 {
                                    indexPrompt += 1
                                    indexArm += 1
                                    indexHead += 1
                                    
                                } else{
                                    modul1Stage1=true
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                                
                            }label:{
                                Text("OK!")
                                    .font(.custom(Font.balooBold, size: 50))
                                    .foregroundColor(.white)
                            }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                                .frame(width: reader.size.width/6, height: reader.size.height/10)
                                .offset(x:45, y:-175)
                        }
                        
                    }
                    
                }
                
            }
            .ignoresSafeArea(.all)
        }
    }

struct Module2View_Previews: PreviewProvider {
    static var previews: some View {
        Module2View()
    }
}
