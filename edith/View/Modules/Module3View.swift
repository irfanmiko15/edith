//
//  Module3View.swift
//  edith
//
//  Created by Evelyn Megawati Tiffany on 04/07/23.
//

import SwiftUI

struct Module3View: View {
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("modul1Stage1") var modul1Stage1:Bool=false
    @State var listPrompt: [String] = ["Ada waktunya kita membutuhkan banyak hal sekaligus.","Kita bisa membutuhkan baju dan celana sekaligus.","Atau pensil dan buku sekaligus.","Kira-kira apa lagi yang kita butuhkan secara bersamaan?","Saat kita butuh 2 hal yang sama pentingnya,","kita belum tentu bisa mendapatkan 2 hal itu sekaligus.","Maka, kita harus bisa menentukan mana yang lebih penting.","Hal yang penting itu disebut prioritas.","Yuk, kita lihat kemampuan kita dalam prioritas."]
    
//        @State var prompts: [ModulModel]
    
    @State var indexPrompt:Int = 0
    
    @State var yOffset: CGFloat = 0
    @State var yOffsett: CGFloat = 0
    @State var scaleEffect: CGFloat = 0.8
    @State var opacityCircle: CGFloat = 0.8
    
    @State var listHead: [String] = ["edithHeadStill", "edithHeadStill", "edithHeadStill", "edithHeadQuestion", "edithHeadStill", "edithHeadStill", "edithHeadHappy", "edithHeadHappy","edithHeadHappy"]
    @State var listArm: [String] = ["edithStillArms", "edithWavingArms","edithWavingArms","edithStillArms", "edithWavingArms", "edithWavingArms","edithWavingArms","edithWavingArms","edithBothArms"]
    
    @State var indexHead: Int = 0
    @State var indexArm: Int = 0
    
    var body: some View {
        GeometryReader{reader in
            ZStack{
                Image("bgModul")
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 10)
                
                Button{
                    
                    if indexPrompt < listPrompt.count-1 {
                        indexPrompt += 1
                        indexArm += 1
                        indexHead += 1
                        
                    
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
                                modul1Stage1=true
                                self.presentationMode.wrappedValue.dismiss()
                            }
                            
                        }label:{
                            Text("OK!")
                                .font(.custom(Font.balooBold, size: 50))
                                .foregroundColor(.white)
                        }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                            .frame(width: reader.size.width/6, height: reader.size.height/10)
                            .offset(x:45, y:-55)
                    }
                    
                }
                
            }
            
        }
        .ignoresSafeArea(.all)
    }
}

struct Module3View_Previews: PreviewProvider {
    static var previews: some View {
        Module3View()
    }
}
