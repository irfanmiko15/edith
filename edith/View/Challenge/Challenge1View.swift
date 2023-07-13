//
//  Challenge1View.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 04/07/23.
//

import SwiftUI
struct Challenge1View: View {
    @ObservedObject var challengeViewModel=ChallengeViewModel()
    @State var yOffset: CGFloat = -20
    @State var index:Int = 0
    var body: some View {
        NavigationStack{
            ZStack{
                if(index<=3 || index==5 || index>6){
                    PromptView(challengeViewModel: challengeViewModel, index: $index).ignoresSafeArea()
                    
                }
                else if(index==4){
                    TakeImageView(index:$index,challengeViewModel: challengeViewModel)
                }
                else{
                    ResultView(challengeViewModel: challengeViewModel, index: $index).ignoresSafeArea()
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}
struct ResultView:View{
    @ObservedObject var challengeViewModel=ChallengeViewModel()
    @State var indexImage:Int = 0
    @Binding var index:Int
    var body: some View{
        GeometryReader{reader in
            ZStack{
                Image("map-1")
                    .resizable()
                    .scaledToFill()
                HStack{
                    CloudView(
                        
                        image: .constant(String("cloud")),
                        moveOffsetLeft:.constant(CGFloat(-50)), moveOffsetRight: .constant(CGFloat(50))
                    )
                }.offset(x:350,y:-370)
                HStack{
                    CloudView(
                        
                        image: .constant(String("cloud")),
                        moveOffsetLeft:.constant(CGFloat(-50)), moveOffsetRight: .constant(CGFloat(50))
                    )
                }.offset(x:-350,y:-250)
                HStack{
                    CloudView(
                        
                        image: .constant(String("cloud")),
                        moveOffsetLeft:.constant(CGFloat(-50)), moveOffsetRight: .constant(CGFloat(50))
                    )
                }.offset(x:-150,y:-350)
                HStack{
                    CloudView(
                        
                        image: .constant(String("cloud-flip")),
                        moveOffsetLeft:.constant(CGFloat(50)), moveOffsetRight: .constant(CGFloat(-50))
                    )
                }.offset(x:200,y:-250)
                HStack{
                    CloudView(
                        
                        image: .constant(String("cloud-flip")),
                        moveOffsetLeft:.constant(CGFloat(-50)), moveOffsetRight: .constant(CGFloat(50))
                    )
                }.offset(x:0,y:-180)
                
                ZStack{
                    
                    ContainerView(textInside: challengeViewModel.indexChallenge == 0 ? "Ayo berdiskusi bersama kenapa barang ini adalah sebuah kebutuhan?" : "Ayo berdiskusi bersama kenapa barang ini adalah sebuah keinginan?",
                                  strokeWidth: CGFloat(16),
                                  width: reader.size.width*0.8,
                                  height: reader.size.height*0.8).padding()
                    
                    if(challengeViewModel.indexChallenge==0){
                        Image(uiImage:challengeViewModel.picDataNeed[indexImage]).resizable().scaledToFill().rotationEffect(.degrees(-90)).frame(width: reader.size.width*0.3, height: reader.size.height*0.2).position(x:reader.size.width*0.5,y: reader.size.height*0.6)
                    }else{
                        Image(uiImage:challengeViewModel.picDataWant[indexImage]).resizable().scaledToFill().rotationEffect(.degrees(-90)).frame(width: reader.size.width*0.3, height: reader.size.height*0.2).position(x:reader.size.width*0.5,y: reader.size.height*0.6)
                    }
                    Button{
                        if(challengeViewModel.indexChallenge==0){
                            if(indexImage==challengeViewModel.picDataNeed.count-1){
                                challengeViewModel.indexChallenge=1
                                indexImage=0
                            }
                            else{
                                indexImage+=1
                                
                            }
                            
                        }
                        else{
                            if(indexImage==challengeViewModel.picDataWant.count-1){
                                index+=1
                            }
                            else{
                                indexImage+=1
                                
                            }
                        }
                    }label: {
                        Text("Berikutnya").font(.custom(Font.balooBold, size: 40)).foregroundColor(.white)
                    }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                        .frame(width: reader.size.width*0.2, height: reader.size.height*0.1).offset(x:reader.size.width*0.3,y:reader.size.height*0.4)
                }.position(x:reader.size.width/2,y:reader.size.height/2)
            }
            
        }.ignoresSafeArea()
    }
}
struct PromptView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var challengeViewModel=ChallengeViewModel()
    @State var yOffset: CGFloat = -20
    @Binding var index:Int
    var body: some View {
        GeometryReader{reader in
            ZStack{
                Image("map-1")
                    .resizable()
                    .scaledToFill()
                HStack{
                    CloudView(
                        
                        image: .constant(String("cloud")),
                        moveOffsetLeft:.constant(CGFloat(-50)), moveOffsetRight: .constant(CGFloat(50))
                    )
                }.offset(x:350,y:-370)
                HStack{
                    CloudView(
                        
                        image: .constant(String("cloud")),
                        moveOffsetLeft:.constant(CGFloat(-50)), moveOffsetRight: .constant(CGFloat(50))
                    )
                }.offset(x:-350,y:-250)
                HStack{
                    CloudView(
                        
                        image: .constant(String("cloud")),
                        moveOffsetLeft:.constant(CGFloat(-50)), moveOffsetRight: .constant(CGFloat(50))
                    )
                }.offset(x:-150,y:-350)
                HStack{
                    CloudView(
                        
                        image: .constant(String("cloud-flip")),
                        moveOffsetLeft:.constant(CGFloat(50)), moveOffsetRight: .constant(CGFloat(-50))
                    )
                }.offset(x:200,y:-250)
                HStack{
                    CloudView(
                        
                        image: .constant(String("cloud-flip")),
                        moveOffsetLeft:.constant(CGFloat(-50)), moveOffsetRight: .constant(CGFloat(50))
                    )
                }.offset(x:0,y:-180)
                Rectangle().fill(Color.white.opacity(0.6)).frame(maxWidth: .infinity,maxHeight: .infinity)
                if(index>0 && index<4){
                    Button{
                        index-=1
                    }label:{
                        Image(systemName: "chevron.left").font(.system(size:50).bold())
                            .frame(width:60,height: 60)
                            .foregroundColor(Color.orangeFox50)
                    }.frame(width:reader.size.width*0.08)
                    .position(x:reader.size.width*0.08,y:reader.size.height*0.87)
                        .buttonStyle(BackThreeD())
                }
                HStack{
                    Image(challengeViewModel.listPrompt[index].edithImage).resizable().scaledToFit().frame(height: reader.size.height*0.7).shadow(color:.white,radius: 10).offset(y:yOffset)
                        .task{
                            withAnimation(Animation.easeOut(duration: 1.75).repeatForever()){
                                yOffset = -5
                                
                            }
                            
                        }
                    VStack{
                        PromptBox(textInside: challengeViewModel.listPrompt[index].prompt, width: reader.size.width/2, height: reader.size.height/2.5, textSize: 35)
                        
                        Button{
                            if(index==challengeViewModel.listPrompt.count-1){
                                self.presentationMode.wrappedValue.dismiss()
                            }
                            else{
                                index+=1
                            }
                            
                        }label:{
                            Text(challengeViewModel.listPrompt[index].buttonText)
                                .font(.custom(Font.baloSemiBold, size: 50))
                                .foregroundColor(.white)
                        }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                            .frame(width: reader.size.width/6, height: reader.size.height/10)
                            .offset(x:45, y:-50)
                    }
                }
                
                
                
            }
        }
    }
}

struct TakeImageView: View {
    @Binding var index:Int
    @ObservedObject var challengeViewModel:ChallengeViewModel
    var body: some View {
        GeometryReader{reader in
            ZStack{
                
                CameraPreview(camera: challengeViewModel).ignoresSafeArea(.all,edges: .all)
                //          Color.gray.ignoresSafeArea(.all,edges: .all)
                VStack{
                    HStack(alignment: .center,spacing: 0){
                        RoundedRectangle(cornerRadius: 8).strokeBorder(Color.orangeSomething, lineWidth: 10)
                            .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                            .frame(width: reader.size.width*0.6,height: 100).padding(.horizontal,40).overlay(Text(challengeViewModel.indexChallenge == 0 ?"Ambil 5 foto barang yang merupakan kebutuhan" : "Ambil 5 foto barang yang merupakan keinginan").font(.custom(Font.balooRegular, size: 30)))
                        Button{
                            
                        }label: {
                            Image(systemName: "xmark").resizable().foregroundColor(.white).frame(width: 30,height: 30)
                        }.frame(width:90,height: 90).buttonStyle(CloseButton())
                    }.padding(.top,30).padding(.horizontal,80)
                    Spacer()
                    if(challengeViewModel.indexChallenge==0){
                        HStack{
                            
                            ForEach(challengeViewModel.picDataNeed.indices, id: \.self) { idx in
                                
                                
                                if(challengeViewModel.picDataNeed[idx].cgImage == nil){
                                    
                                    
                                    RoundedRectangle(cornerRadius: 10).fill(Color.neutral80).frame(width: reader.size.height*0.2, height: 130).overlay(Text("?").font(.custom(Font.balooBold, size: 50)))
                                    
                                    
                                }
                                else{
                                    ZStack{
                                        
                                        Image(uiImage: challengeViewModel.picDataNeed[idx] )
                                        
                                            .resizable().aspectRatio( 3/4,contentMode:.fit)
                                            .rotationEffect(.degrees(-90)).frame(
                                                width: reader.size.height*0.2,
                                                height: 130)
                                        Button{
                                            challengeViewModel.deleteImage(index: idx)
                                        }label: {
                                            Image(systemName: "xmark").resizable().foregroundColor(.white).frame(width: 20,height: 20).padding(.all,10).background(Circle().fill(Color.orangeSomething))
                                        }.frame(width:40,height: 40).offset(x:60,y:-40)
                                    }
                                }
                            }.padding()
                            
                            
                        }.background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.orangeSomething, lineWidth: 10)
                            .background(RoundedRectangle(cornerRadius: 8).fill(.white)))
                    }
                    else{
                        HStack{
                            
                            ForEach(challengeViewModel.picDataWant.indices, id: \.self) { idx in
                                
                                
                                if(challengeViewModel.picDataWant[idx].cgImage == nil){
                                    
                                    
                                    RoundedRectangle(cornerRadius: 10).fill(Color.neutral80).frame(width: reader.size.height*0.2, height: 130).overlay(Text("?").font(.custom(Font.balooBold, size: 50)))
                                    
                                    
                                }
                                else{
                                    ZStack{
                                        
                                        Image(uiImage: challengeViewModel.picDataWant[idx] )
                                        
                                            .resizable().aspectRatio( 3/4,contentMode:.fit)
                                            .rotationEffect(.degrees(-90)).frame(
                                                width: reader.size.height*0.2,
                                                height: 130)
                                        Button{
                                            challengeViewModel.deleteImage(index: idx)
                                        }label: {
                                            Image(systemName: "xmark").resizable().foregroundColor(.white).frame(width: 20,height: 20).padding(.all,10).background(Circle().fill(Color.orangeSomething))
                                        }.frame(width:40,height: 40).offset(x:60,y:-40)
                                    }
                                }
                            }.padding()
                            
                            
                        }.background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.orangeSomething, lineWidth: 10)
                            .background(RoundedRectangle(cornerRadius: 8).fill(.white)))
                    }
                }.padding(.trailing,150).padding(.bottom)
                HStack{
                    Spacer()
                    Rectangle().fill(.black.opacity(0.5)).frame(width: reader.size.width*0.12)
                }
                HStack{
                    Spacer()
                    
                    Button{
                        if(challengeViewModel.isImageFilled==true){
                        }
                        else{
                            challengeViewModel.takePic()
                        }
                    }label: {
                        ZStack{
                            Circle().fill(challengeViewModel.isImageFilled ? .white.opacity(0.5) : .white).frame(width: reader.size.width*0.08,height: reader.size.width*0.08)
                            Circle().stroke(challengeViewModel.isImageFilled ? .white.opacity(0.5) : .white,lineWidth:4).frame(width: reader.size.width*0.09,height: reader.size.width*0.09)
                        }
                    }
                    
                }.padding(.trailing)
                
                
                
                if(challengeViewModel.isImageFilled==true){
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color.white)
                            .frame(width: reader.size.width*0.4, height: reader.size.height*0.5)
                        
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(Color.orangeFox70, style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round))
                            .frame(width: reader.size.width*0.4, height: reader.size.height*0.5)
                        VStack(spacing: 0){
                            Image("edithBahagia")
                                .resizable()
                                .scaledToFit()
                                .frame(height: reader.size.height*0.25)
                            Text("Pastikan foto yang diambil sudah jelas \nya sebelum lanjut!")
                                .frame(width: reader.size.width*0.4, height: reader.size.height*0.15)
                                .multilineTextAlignment(.center)
                                .font(.custom(Font.balooBold, size: CGFloat(25)))
                        }
                        Button{
                            if(challengeViewModel.indexChallenge==0){
                                challengeViewModel.indexChallenge=1
                                challengeViewModel.isImageFilled=false
                            }
                            else{
                                index+=1
                                challengeViewModel.indexChallenge=0
                            }
                            
                        } label:{Text("Next")
                                .font(.custom(Font.balooBold, size: 40))
                                .foregroundColor(.white)
                        }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                            .frame(width: reader.size.width*0.2, height: reader.size.height*0.1).position(x: reader.size.width*0.5, y: reader.size.height*0.75)
                    } .position(x: reader.size.width*0.45, y: reader.size.height*0.45)
                }
            }.onAppear{
                challengeViewModel.check()
            }
        }.ignoresSafeArea()
    }
}



struct Challenge1View_Previews: PreviewProvider {
    static var previews: some View {
        Challenge1View(challengeViewModel: ChallengeViewModel())
    }
}
