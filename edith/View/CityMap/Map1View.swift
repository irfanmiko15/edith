//
//  Map1View.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 22/06/23.
//

import SwiftUI

struct Map1View: View {
    @ObservedObject var userModel: UserViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        GeometryReader { geo in
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
               
                RoadmapView().padding(.leading)
                HStack{
                    Button{
                        self.presentationMode.wrappedValue.dismiss()
                    }label:{
                        Image(systemName: "chevron.left").font(.system(size:40).bold())
                            .frame(width:60,height: 60)
                            .foregroundColor(Color.greenHill40)
                    }
                    Image("mapsIcon1").resizable().scaledToFit().frame(height: 100)
                    VStack(alignment: .leading,spacing: 0){
                        Text("Chapter 1").font(.custom(Font.balooBold, size: 40))
                        Text("Kebutuhan dan keinginan").font(.custom(Font.baloSemiBold, size: 30)).offset(y:-15)
                    }
                }.position(x:geo.size.width*0.23,y:geo.size.height*0.08)
                ZStack{
                    CircleAvatar(imageName:userModel.dataUser.child.cropImage, color: Color.orangeFox50).frame(height: geo.size.width*0.11)
                    CircleAvatar(imageName:userModel.dataUser.parent.image, color: Color.blueTang70).frame(height: geo.size.width*0.08).offset(x:-60,y:60)
                    
                }.position(x:geo.size.width*0.9,y:geo.size.height*0.1)
                
                
                
            }
            
        }.ignoresSafeArea()
            .onAppear{
                userModel.load()
            }
    }
    }

struct Map1View_Previews: PreviewProvider {
    static var previews: some View {
        Map1View(userModel: UserViewModel())
    }
}
