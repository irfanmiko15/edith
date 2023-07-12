//
//  MainStoryView.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 04/07/23.
//

import SwiftUI
import AVFoundation



struct MainStoryView: View {
    @State var index:Int = 1
    @ObservedObject var userModel:UserViewModel
    var body: some View {
        ZStack{
            if(index == 1){
                MainStory1(index: $index, userModel: UserViewModel()).transition(AnyTransition.opacity.animation(.easeInOut(duration:0.3))).onAppear{
                    userModel.load()
                }
            }
            if(index == 2){
                MainStory2(index: $index,userModel: UserViewModel()).transition(AnyTransition.opacity.animation(.easeInOut(duration:0.3)))
                
            }
            if(index == 3){
                MainStory3(index: $index,userModel: UserViewModel()).transition(AnyTransition.opacity.animation(.easeInOut(duration:0.3)))
            }
            if(index == 4){
                MainStory4(index: $index,userModel: UserViewModel()).transition(AnyTransition.opacity.animation(.easeInOut(duration:0.3)))
            }
            if(index == 5){
                MainStory5(index: $index,userModel: UserViewModel()).transition(AnyTransition.opacity.animation(.easeInOut(duration:0.3)))
            }
            if(index == 6){
                MainStory6(index: $index,userModel: UserViewModel()).transition(AnyTransition.opacity.animation(.easeInOut(duration:0.3)))
            }
        }
    }
}
struct MainStory1:View{
    
    @Binding var index:Int
    @State var isfinished:Bool = false
    @State var text: String = ""
    @ObservedObject var userModel:UserViewModel
    @State var fullText:String=""
    
    func typeWriter(at position: Int = 0) {
        if position == 0 {
            text = ""
        }
        if position < fullText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                text.append(fullText[position])
                typeWriter(at: position + 1)
            }
            
        }
        
        if isfinished == true{
            text=fullText
        }
    }
    var body: some View {
        NavigationStack{
            GeometryReader{reader in
                ZStack{
                    Image("mainStoryBackground").resizable().scaledToFill()
                    ZStack{
                        RoundedRectangle(cornerRadius: 50).strokeBorder(Color.orangeSomething, lineWidth: 10)
                            .background(RoundedRectangle(cornerRadius: 50).fill(.white))
                            .frame(width: .infinity,height: 200).padding(.horizontal,40).overlay(Text(text).font(.custom(Font.balooRegular, size: 35)).padding(.horizontal,reader.size.width*0.06))
                            .offset(y:reader.size.height*0.3)
                        Button{

                            index=2
                            
                        
                        } label:{Text("Next")
                                .font(.custom(Font.balooBold, size: 50))
                                .foregroundColor(.white)
                        }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                            .frame(width: reader.size.width*0.20, height: reader.size.height*0.10)
                            .offset(x:reader.size.width*0.35, y:reader.size.height*0.4)
                        Spacer()
                        
                    }.padding(.bottom,55)
                }.onAppear{
                    userModel.load()
                    fullText="Suatu hari, \(userModel.dataUser.parent.name) bercerita bahwa ia memiliki sebuah robot celengan yang sudah lama tidak digunakan."
                    if isfinished==false{
                        typeWriter()
                    }
                    else{
                        
                    }
                    
                    SoundControl()
//                      .playMainStoryAudio()
                }
            }.ignoresSafeArea().onDisappear{
                SoundControl()
                    .playButtonSFX()
            }
        }
    }
}
struct MainStory2:View{
    @Binding var index:Int
    @State var isfinished:Bool = false
    @State var text: String = ""
    @ObservedObject var userModel:UserViewModel
    @State var fullText:String=""
    func typeWriter(at position: Int = 0) {
        if position == 0 {
            text = ""
        }
        if position < fullText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                text.append(fullText[position])
                typeWriter(at: position + 1)
            }
            
        }
        
        if isfinished == true{
            text=fullText
        }
    }
    var body: some View {
        NavigationStack{
            GeometryReader{reader in
                ZStack{
                    Image("mainStoryBackgroundRectangle").resizable().scaledToFill()
                    ZStack{
                        ZStack{
                            Image("edithBrokenDark").resizable().scaledToFit().frame(height: reader.size.height*0.9)
                                .offset(x:-reader.size.width*0.2)
                                .brightness(-0.2)
                            Image("coin").resizable().scaledToFit().frame(width: reader.size.width*0.5)
                                .shadow(color: Color.white, radius: 100)
                                .shadow(color: Color.white, radius: 100)
                                .offset(x:reader.size.width*0.23)
                        }
                        RoundedRectangle(cornerRadius: 50).strokeBorder(Color.orangeSomething, lineWidth: 10)
                            .background(RoundedRectangle(cornerRadius: 50).fill(.white))
                            .frame(width: .infinity,height: 200).padding(.horizontal,40).overlay(Text(text).font(.custom(Font.balooRegular, size: 35)).padding(.horizontal,reader.size.width*0.07))
                            .offset(y:reader.size.height*0.3)
                        Button{
                            index=3
                            SoundControl()
                                .playButtonSFX()
                            
                        } label:{Text("Next")
                                .font(.custom(Font.balooBold, size: 50))
                                .foregroundColor(.white)
                        }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                            .frame(width: reader.size.width*0.20, height: reader.size.height*0.10)
                            .offset(x:reader.size.width*0.35, y:reader.size.height*0.4)
                        Spacer()
                    }.padding(.bottom,55)
                }
                .onAppear{
                    userModel.load()
                    fullText="Untuk meng-aktifkannya kembali, \(userModel.dataUser.parent.name) memberikan sebuah koin kepada \(userModel.dataUser.name)"
                    if isfinished==false{
                        typeWriter()
                    }
                    else{
                        
                    }
                    
                    SoundControl()
                        .playBrokenEdith()
                }
            }.ignoresSafeArea()
        }
    }
}

struct MainStory3:View{
    @Binding var index:Int
    @State var isfinished:Bool = false
    @State var text: String = ""
    @State var fullText:String=""
    @ObservedObject var userModel:UserViewModel
    
    
    func typeWriter(at position: Int = 0) {
        if position == 0 {
            text = ""
        }
        if position < fullText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                text.append(fullText[position])
                typeWriter(at: position + 1)
            }
            
        }
        
        if isfinished == true{
            text=fullText
        }
    }
    var body: some View {
        
        NavigationStack{
            GeometryReader{reader in
                
                ZStack{
                    Image("mainStoryBackgroundRectangle")
                        .resizable()
                        .scaledToFill()
                    Image("dropCoin")
                        .resizable()
                        .scaledToFill()
                    
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 50).strokeBorder(Color.orangeSomething, lineWidth: 10)
                            .background(RoundedRectangle(cornerRadius: 50).fill(.white))
                            .frame(width: .infinity,height: 200).padding(.horizontal,40).overlay(Text(text).font(.custom(Font.balooRegular, size: 35)).padding(.horizontal,reader.size.width*0.07))
                            .offset(y:reader.size.height*0.3)
                        
                        Button{
                            index=4
                        } label:{Text("Next")
                                .font(.custom(Font.balooBold, size: 50))
                                .foregroundColor(.white)
                        }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                            .frame(width: reader.size.width*0.20, height: reader.size.height*0.10)
                            .offset(x:reader.size.width*0.35, y:reader.size.height*0.4)
                        Spacer()
                    }.padding(.bottom, 55)
                    
                }
                
            }.onAppear{
                userModel.load()
                fullText=" \(userModel.dataUser.name)pun memasukkan koin itu ke dalam Edith."
                if isfinished==false{
                    typeWriter()
                }
                else{
                    
                }
                
                SoundControl()
                    .playCoinSFX()
                
            }
        }.ignoresSafeArea()
    }
}

struct MainStory4:View{
    @Binding var index:Int
    @ObservedObject var userModel:UserViewModel
    @State var isfinished:Bool = false
    @State var text: String = ""
    
    @State var fullText:String=""
    
    
    @State var yOffset: CGFloat = 0
    @State var yOffsett: CGFloat = -10
    @State var scaleEffect: CGFloat = 0.8
    @State var opacityCircle: CGFloat = 0.8
    
    func typeWriter(at position: Int = 0) {
        if position == 0 {
            text = ""
        }
        if position < fullText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                text.append(fullText[position])
                typeWriter(at: position + 1)
            }
            
        }
        
        if isfinished == true{
            text=fullText
        }
    }
    var body: some View {
        NavigationStack{
            GeometryReader{reader in
                
                ZStack{
                    
                    Image("mainStoryBackgroundRectangle").resizable().scaledToFill()
                    
                    ZStack{
                        
                        Image("edithBodyStill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: reader.size.height*0.9)
                            .offset(y:-reader.size.height*0.05)
                        
                        Circle()
                            .stroke(RadialGradient(colors: [Color("orangeSomething"), Color("orangeSomething"), Color.orange, Color.orange, Color.clear], center: .center, startRadius: 0, endRadius: 145), lineWidth: reader.size.width*0.08)
                            .frame(width: reader.size.width*0.23)
                            .offset(y:-reader.size.height*0.2)
                            .opacity(opacityCircle)
                    }
                    .offset(y:yOffsett)
                    .task{
                        withAnimation(Animation.easeOut(duration: 0.3).repeatForever()){
                            yOffsett = 20
                            opacityCircle = 0.3
                            
                        }
                        
                    }
                }
                .onAppear{
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3)
                    {
                        index=5
                    }
                    
                    SoundControl()
                        .playEdithPowerUp()
                }
            }.ignoresSafeArea()
        }
    }
}


struct MainStory5:View{
    @Binding var index:Int
    @State var isfinished:Bool = false
    @State var text: String = ""
    @State var fullText:String=""
    @ObservedObject var userModel:UserViewModel
    
    func typeWriter(at position: Int = 0) {
        if position == 0 {
            text = ""
        }
        if position < fullText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                text.append(fullText[position])
                typeWriter(at: position + 1)
            }
            
        }
        
        if isfinished == true{
            text=fullText
        }
    }
    var body: some View {
        NavigationStack{
            GeometryReader{reader in
                ZStack{
                    Image("mainStoryBackgroundRectangle").resizable().scaledToFill()
                    ZStack{
                        Spacer()
                        
                        EdithFigure(pose: "happy", width: reader.size.width*0.35)
                        
                        RoundedRectangle(cornerRadius: 50).strokeBorder(Color.orangeSomething, lineWidth: 10)
                            .background(RoundedRectangle(cornerRadius: 50).fill(.white))
                            .frame(width: .infinity,height: 200).padding(.horizontal,40).overlay(Text(text).font(.custom(Font.balooRegular, size: 35)).padding(.horizontal,reader.size.width*0.07))
                            .offset(y:reader.size.height*0.3)
                        Button{
                            index=6
                        } label:{Text("Next")
                                .font(.custom(Font.balooBold, size: 50))
                                .foregroundColor(.white)
                        }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                            .frame(width: reader.size.width*0.20, height: reader.size.height*0.10)
                            .offset(x:reader.size.width*0.35, y:reader.size.height*0.4)
                        Spacer()
                        //                        NavigationLink(destination: WorldMapView(userModel: UserViewModel())
                        //                            .onAppear() {
                        //                                self.isfinished=true
                        //                            }.navigationBarHidden(false)){
                        //                            Text("Next")
                        //                                .font(.custom(Font.balooBold, size: 50))
                        //                                .foregroundColor(.white)
                        //                        }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                        //                            .frame(width: reader.size.width*0.3, height: reader.size.height*0.11)
                        //                            .offset(x:reader.size.width*0.3, y:-50)
                        //
                    }.padding(.bottom,55)
                }.onAppear{
                    userModel.load()
                    fullText="Hi! Aku Edith. Terima kasih sudah membantu aku! Sebagai kebaikan kalian, aku ingin mengajak kalian pergi berpetualang!"
                    if isfinished==false{
                        typeWriter()
                    }
                    else{
                        
                    }
                    
                    SoundControl()
                        .playEdithTalk()
                    
                }
            }.ignoresSafeArea()
        }
    }
}
struct MainStory6:View{
    @Binding var index:Int
    @State var isfinished:Bool = false
    @State var text: String = ""
    @ObservedObject var userModel:UserViewModel
    @State var fullText:String=""
    func typeWriter(at position: Int = 0) {
        if position == 0 {
            text = ""
        }
        if position < fullText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                text.append(fullText[position])
                typeWriter(at: position + 1)
            }
            
        }
        
        if isfinished == true{
            text=fullText
        }
    }
    var body: some View {
        NavigationStack{
            GeometryReader{reader in
                
                ZStack{
                    Image("backgroundWorldMap")
                        .resizable()
                        .scaledToFill()
                    
                    Circle()
                        .fill(.radialGradient(colors: [Color.white,Color.white.opacity(0.8),Color.white.opacity(0.3),Color.white.opacity(0)],  center: .center, startRadius: 250, endRadius: 450))
                        .frame(width:reader.size.width*0.8)
                        .offset(y: -reader.size.height*0.03)
                    //                        .opacity(0.8)
                    
                    Image("edithBahagia")
                        .resizable()
                        .scaledToFit()
                        .frame(height: reader.size.height/1.7)
                        .offset(y: -reader.size.height*0.08)
                    
                    Image(userModel.dataUser.parent.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width:reader.size.width*0.25)
                        .offset(x:-reader.size.width*0.14,y:reader.size.height*0.01)
                    
                    Image(userModel.dataUser.child.fullImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width:reader.size.width*0.2)
                        .offset(x:reader.size.width*0.15, y:reader.size.height*0.13)
                    ZStack{
                        Spacer()
                        
                        RoundedRectangle(cornerRadius: 50).strokeBorder(Color.orangeSomething, lineWidth: 10)
                            .background(RoundedRectangle(cornerRadius: 50).fill(.white))
                            .frame(width: .infinity,height: 200).padding(.horizontal,40).overlay(Text(text).font(.custom(Font.balooRegular, size: 35)).padding(.horizontal,reader.size.width*0.07))
                            .offset(y:reader.size.height*0.3)

                        
                        NavigationLink(destination: WorldMapView(userModel: UserViewModel())
                            .onAppear() {
                                self.isfinished=true

                            }.navigationBarHidden(true).onAppear{userModel.load()}){
                                Text("Mulai")
                                    .font(.custom(Font.balooBold, size: 50))
                                    .foregroundColor(.white)
                            }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                            .frame(width: reader.size.width*0.20, height: reader.size.height*0.10)
                            .offset(x:reader.size.width*0.35, y:reader.size.height*0.4)
                        
                        Spacer()
                        
                    }.padding(.bottom,55)
                }.onAppear{
                    userModel.load()
                    fullText="Dengan semangat, \(userModel.dataUser.name) dan \(userModel.dataUser.parent.name)nya akan memulai petualangan mereka bersama Edith!"
                    if isfinished==false{
                        typeWriter()
                    }
                    else{
                        
                    }
                    
                }
            }.ignoresSafeArea()
        }
    }
}




struct MainStoryView_Previews: PreviewProvider {
    //    @State var index:Int = 1
    
    static var previews: some View {
        //        MainStory4(index: .constant(1), userModel: UserViewModel())
        MainStoryView(userModel: UserViewModel())
    }
}
