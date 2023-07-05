//
//  Challenge1View.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 04/07/23.
//

import SwiftUI
struct Challenge1View: View {
    @StateObject var challengeViewModel:ChallengeViewModel
    var body: some View {
        GeometryReader{reader in
            ZStack{
                
                    CameraPreview(camera: challengeViewModel).ignoresSafeArea(.all,edges: .all)
//                Color.gray.ignoresSafeArea(.all,edges: .all)
                VStack{
                    RoundedRectangle(cornerRadius: 8).strokeBorder(Color.orangeSomething, lineWidth: 10)
                        .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                        .frame(width: reader.size.width*0.6,height: 100).padding(.horizontal,40).overlay(Text("Ambil 5 foto barang yang merupakan kebutuhan").font(.custom(Font.balooRegular, size: 30)).padding(.horizontal,40)).padding(.top,50)
                    Spacer()
                    HStack{
                        ForEach(challengeViewModel.picData, id: \.self) { pic in
                            
                            
                            if(pic.cgImage == nil){
                                RoundedRectangle(cornerRadius: 10).fill(Color.neutral80).frame(width: 180, height: 130).overlay(Text("?").font(.custom(Font.balooBold, size: 50)))
                            }
                            else{
                                Image(uiImage: pic).resizable().scaledToFit().frame(
                                    width: 180,
                                    height: 130)
                            }
                        }.padding()
                        
                    }.background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.orangeSomething, lineWidth: 10)
                        .background(RoundedRectangle(cornerRadius: 8).fill(.white)))
                    }
                
                    HStack{
                        Spacer()
                        
                        Button{
                            challengeViewModel.takePic()
                        }label: {
                            ZStack{
                                Circle().fill(.white).frame(width: reader.size.width*0.08,height: reader.size.width*0.08)
                                Circle().stroke(Color.white,lineWidth:4).frame(width: reader.size.width*0.09,height: reader.size.width*0.09)
                            }
                        }
                        
                    }.padding(.trailing)
                if(!challengeViewModel.picData.isEmpty){
                    Image(uiImage: challengeViewModel.picData[0]).resizable().scaledToFit().frame(width:100,height: 100)
                }
                
            }
        }.onAppear{
            challengeViewModel.check()
        }
    }
}


struct Challenge1View_Previews: PreviewProvider {
    static var previews: some View {
        Challenge1View(challengeViewModel: ChallengeViewModel())
    }
}
