//
//  Challenge1View.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 04/07/23.
//

import SwiftUI
struct Challenge1View: View {
    @StateObject var challengeViewModel:ChallengeViewModel
    @State var yOffset: CGFloat = -20
    @State var index:Int = 0
    var body: some View {
        ZStack{
            if(index<=3 || index==5 || index>6){
                PromptView(challengeViewModel: ChallengeViewModel(), index: $index)
            }
            else if(index==4){
                TakeImageView(index:$index,challengeViewModel: ChallengeViewModel())
            }
            else{
                
            }
        }
    }
}
struct PromptView: View {
    @StateObject var challengeViewModel:ChallengeViewModel
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
                            
                            index+=1
                            
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
    @StateObject var challengeViewModel:ChallengeViewModel
    var body: some View {
        GeometryReader{reader in
            ZStack{
                
                    CameraPreview(camera: challengeViewModel).ignoresSafeArea(.all,edges: .all)
//          Color.gray.ignoresSafeArea(.all,edges: .all)
                VStack{
                    HStack(alignment: .center,spacing: 0){
                        RoundedRectangle(cornerRadius: 8).strokeBorder(Color.orangeSomething, lineWidth: 10)
                            .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                            .frame(width: reader.size.width*0.6,height: 100).padding(.horizontal,40).overlay(Text("Ambil 5 foto barang yang merupakan kebutuhan").font(.custom(Font.balooRegular, size: 30)))
                        Button{
                            
                        }label: {
                            Image(systemName: "xmark").resizable().foregroundColor(.white).frame(width: 30,height: 30)
                        }.frame(width:90,height: 90).buttonStyle(CloseButton())
                    }.padding(.top,30).padding(.horizontal,80)
                    Spacer()
                    HStack{
                        ForEach(challengeViewModel.picData.indices, id: \.self) { idx in
                            
                            
                            if(challengeViewModel.picData[idx].cgImage == nil){
                                RoundedRectangle(cornerRadius: 10).fill(Color.neutral80).frame(width: reader.size.height*0.2, height: 130).overlay(Text("?").font(.custom(Font.balooBold, size: 50)))
                            }
                            else{
                                Image(uiImage: challengeViewModel.picData[idx] )
                                    
                                    .resizable().aspectRatio(contentMode: .fit)
                                    .rotationEffect(.degrees(-90)).frame(
                                    width: reader.size.height*0.2,
                                    height: 130).onTapGesture{
                                        challengeViewModel.deleteImage(index: idx)
                                    }
                            }
                        }.padding()
                        
                    }.background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.orangeSomething, lineWidth: 10)
                        .background(RoundedRectangle(cornerRadius: 8).fill(.white)))
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
                                
                                index+=1
                            } label:{Text("Next")
                                .font(.custom(Font.balooBold, size: 40))
                                .foregroundColor(.white)
                        }.buttonStyle(ThreeD(foregroundColor: .orangeSomething, shadowColor: .orangeFox50))
                                .frame(width: reader.size.width*0.2, height: reader.size.height*0.1).position(x: reader.size.width*0.5, y: reader.size.height*0.75)
                            
                            
                            //
                            
                            
                        } .position(x: reader.size.width*0.45, y: reader.size.height*0.45)
                        
                        
                    
                }
                    
            }
        }.onAppear{
            challengeViewModel.check()
            
        }.ignoresSafeArea()
    }
}



struct Challenge1View_Previews: PreviewProvider {
    static var previews: some View {
        Challenge1View(challengeViewModel: ChallengeViewModel())
    }
}
