//
//  MainStoryView.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 04/07/23.
//

import SwiftUI

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
                    VStack{
                        Spacer()
                        RoundedRectangle(cornerRadius: 8).strokeBorder(Color.orangeSomething, lineWidth: 10)
                            .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                            .frame(width: .infinity,height: 200).padding(.horizontal,40).overlay(Text(text).font(.custom(Font.balooRegular, size: 30)).padding(.horizontal,40))
                        
                        Button{
                            withAnimation(.easeOut) {
                                index=2
                                
                            }
                            
                        } label:{Text("Next")
                            .font(.custom(Font.balooBold, size: 50))
                            .foregroundColor(.white)
                    }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                        .frame(width: reader.size.width*0.3, height: reader.size.height*0.11)
                        .offset(x:reader.size.width*0.3, y:-50)
                        
                    }.padding(.bottom,55)
                }.onAppear{
                    userModel.load()
                    fullText="Suatu hari, \(userModel.dataUser.parent.name) bercerita bahwa ia memiliki sebuah robot yang sudah lama tidak digunakan"
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
                    VStack{
                        Spacer()
                        HStack{
                            Image("edithBrokenDark").resizable().scaledToFit().frame(height: reader.size.height*0.55)
                            Image("coin").resizable().scaledToFit().frame(width: reader.size.width*0.3)
                        }
                        RoundedRectangle(cornerRadius: 8).strokeBorder(Color.orangeSomething, lineWidth: 10)
                            .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                            .frame(width: .infinity,height: 200).padding(.horizontal,40).overlay(Text(text).font(.custom(Font.balooRegular, size: 30)).padding(.horizontal,40))
                        Button{
                            index=3
                        } label:{Text("Next")
                            .font(.custom(Font.balooBold, size: 50))
                            .foregroundColor(.white)
                    }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                        .frame(width: reader.size.width*0.3, height: reader.size.height*0.11)
                        .offset(x:reader.size.width*0.3, y:-50)
                        Spacer()
                    }.padding(.bottom,55)
                }.onAppear{
                    userModel.load()
                    fullText="Untuk meng-aktifkannya kembali, \(userModel.dataUser.parent.name) memberikan sebuah koin kepada \(userModel.dataUser.name)"
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
struct MainStory3:View{
    @Binding var index:Int
    @ObservedObject var userModel:UserViewModel
    @State var isfinished:Bool = false
    @State var text: String = ""

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
                    VStack{
                        Spacer()
                       
                            Image("edithBahagia").resizable().scaledToFit().frame(height: reader.size.height*0.55)
                            
                        
                        RoundedRectangle(cornerRadius: 8).strokeBorder(Color.orangeSomething, lineWidth: 10)
                            .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                            .frame(width: .infinity,height: 200).padding(.horizontal,40).overlay(Text(text).font(.custom(Font.balooRegular, size: 30)).padding(.horizontal,40))
                        Button{
                            index=4
                        } label:{Text("Next")
                            .font(.custom(Font.balooBold, size: 50))
                            .foregroundColor(.white)
                    }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                        .frame(width: reader.size.width*0.3, height: reader.size.height*0.11)
                        .offset(x:reader.size.width*0.3, y:-50)
                        Spacer()
                    }.padding(.bottom,55)
                }.onAppear{
                    userModel.load()
                    fullText="\(userModel.dataUser.name) pun memasukkan koin tersebut ke dalam kepala sang robot, yang membuatnya kembali aktif"
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
struct MainStory4:View{
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
                    VStack{
                        Spacer()
                       
                            Image("edithMenyapa").resizable().scaledToFit().frame(height: reader.size.height*0.55)
                            
                        
                        RoundedRectangle(cornerRadius: 8).strokeBorder(Color.orangeSomething, lineWidth: 10)
                            .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                            .frame(width: .infinity,height: 200).padding(.horizontal,40).overlay(Text(text).font(.custom(Font.balooRegular, size: 30)).padding(.horizontal,40))
                        Button{
                            index=5
                        } label:{Text("Next")
                            .font(.custom(Font.balooBold, size: 50))
                            .foregroundColor(.white)
                    }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                        .frame(width: reader.size.width*0.3, height: reader.size.height*0.11)
                        .offset(x:reader.size.width*0.3, y:-50)
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
                    fullText="Robot itu pun memperkenalkan dirinya sebagai Edith, lalu ia mengajak \(userModel.dataUser.name) dan \(userModel.dataUser.parent.name)nya pergi berpetualang!"
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
struct MainStory5:View{
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
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
                    Image("backgroundWorldMap").resizable().scaledToFill()
                    VStack{
                        Spacer()
                       
                           
                            
                        HStack{
                            Image("mom").resizable().scaledToFit().frame(height:reader.size.width*0.13)
                            Image("boyCrop1").resizable().scaledToFit().frame(height:reader.size.width*0.13)
                            Image("stageEdithHead").resizable().scaledToFit().frame(height:reader.size.width*0.13)
                        }.offset(x:200,y:15)
                        RoundedRectangle(cornerRadius: 8).strokeBorder(Color.orangeSomething, lineWidth: 10)
                            .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                            .frame(width: .infinity,height: 200).padding(.horizontal,40).overlay(Text(text).font(.custom(Font.balooRegular, size: 30)).padding(.horizontal,40))
                       
                        NavigationLink(destination: WorldMapView(userModel: UserViewModel())
                            .onAppear() {
                                self.isfinished=true
                            }.navigationBarHidden(false)){
                            Text("Mulai")
                                .font(.custom(Font.balooBold, size: 50))
                                .foregroundColor(.white)
                        }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                            .frame(width: reader.size.width*0.3, height: reader.size.height*0.11)
                            .offset(x:reader.size.width*0.3, y:-50)

                    }.padding(.bottom,55)
                }.onAppear{
                    userModel.load()
                    fullText="Dengan semangat, \(userModel.dataUser.name) dan \(userModel.dataUser.parent.name)nya akan memulai petualangan mereka bersama Edith"
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
    static var previews: some View {
        MainStoryView(userModel: UserViewModel())
    }
}
