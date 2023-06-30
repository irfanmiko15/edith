//
//  ChooseAvatarView.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 26/06/23.
//

import SwiftUI

struct ChooseAvatarView: View {
    @AppStorage("user")  var myArray: String = ""
    @StateObject var userModel: UserViewModel
    @State var selection: Int? = nil
    @State private var name: String = ""
    @State var showSheet = false
    @State var selectedDate = Date()
    @State var dateString:String=""
    @State var isExpand:Bool=false
    @State var indexChild:Int=0
    @State var indexParent:Int=0
    let columns = [
        GridItem(.flexible(),spacing: 0),
        GridItem(.flexible(),spacing: 0),
    ]
    
    @State var avatarList:[ChildAvatarModel]=[
        ChildAvatarModel(fullImage: "boy1", cropImage: "boyCrop1", isSelected: true),
        ChildAvatarModel(fullImage: "girl1", cropImage: "girlCrop1", isSelected: false),
        ChildAvatarModel(fullImage: "boy2", cropImage: "boyCrop2", isSelected: false),
        ChildAvatarModel(fullImage: "girl2", cropImage: "girlCrop2", isSelected: false)
    ]
    @State var avatarParentList:[ParentAvatarModel]=[
        ParentAvatarModel(name:"Ibu",image: "mom", isSelected: true),
        ParentAvatarModel(name:"Ayah",image: "dad", isSelected: false)
    ]
    
    func updateAvatarState(idx:Int){
        for x in avatarList.indices {
            avatarList[x].isSelected=false
        }
        indexChild=idx
        avatarList[idx].isSelected=true
    }
    func updateAvatarParentState(idx:Int){
        for x in avatarParentList.indices {
            avatarParentList[x].isSelected=false
        }
        indexParent=idx
        avatarParentList[idx].isSelected=true
    }
    
    var body: some View {
        GeometryReader{geo in
            HStack{
                if(!isExpand){
                    VStack(alignment: .leading,spacing: 0){
                        Spacer()
                        Text("Yuk, set-up profilmu").font(.custom(Font.balooBold, size: 45)).foregroundColor(Color.orangeFox50).padding(.horizontal).padding(.vertical,10)
                        Text("Nama").font(.custom(Font.balooBold, size: 35)).foregroundColor(Color.orangeFox50).padding(.horizontal)
                        TextField("Isi Namamu ya!", text: $name).font(.custom(Font.baloSemiBold, size: 35)).padding(.all,10).padding(.leading,20)
                            .border(Color.orangeFox50, width: 5).cornerRadius(10).foregroundColor(Color.orangeFox50).padding(.horizontal).padding(.bottom,20).frame(width: geo.size.width*0.3)
                        Text("Tanggal lahir").font(.custom(Font.balooBold, size: 35)).foregroundColor(Color.orangeFox50).padding(.horizontal)
                        if(dateString != ""){
                            let result = dateString.split(separator: "/")
                            
                            HStack{
                                Text(" " + result[0] + " ").font(.custom(Font.balooBold, size: 30)).foregroundColor(Color.orangeFox50).padding(.all,10) .border(Color.orangeFox50, width: 5).cornerRadius(10)
                                Text("/").font(.custom(Font.balooBold, size: 30)).foregroundColor(Color.orangeFox50)
                                Text(" " + result[1] + " ").font(.custom(Font.balooBold, size: 30)).foregroundColor(Color.orangeFox50).padding(.all,10) .border(Color.orangeFox50, width: 5).cornerRadius(10)
                                Text("/").font(.custom(Font.balooBold, size: 30)).foregroundColor(Color.orangeFox50)
                                Text(" " + result[2] + " ").font(.custom(Font.balooBold, size: 30)).foregroundColor(Color.orangeFox50).padding(.all,10) .border(Color.orangeFox50, width: 5).cornerRadius(10)
                            }.padding(.horizontal).padding(.bottom,25).padding(.top,10).onTapGesture {
                                showSheet=true
                            }.sheet(isPresented: $showSheet) {
                                print("Sheet dismissed!")
                            } content: {
                                VStack{
                                    
                                    DatePicker("Enter your birthday", selection: $selectedDate,displayedComponents: .date).accentColor(Color.orangeFox50)
                                        .datePickerStyle(GraphicalDatePickerStyle())
                                    
                                    Button{
                                        self.showSheet=false
                                        let dateFormatter=DateFormatter()
                                        dateFormatter.dateFormat="dd/MM/YYYY"
                                        dateString=dateFormatter.string(from: selectedDate)
                                    }label: {
                                        Text("Done").foregroundColor(Color.orangeFox50).font(.custom(Font.balooMedium, size: 25))
                                    }
                                }
                            }
                            
                        }else{
                            HStack{
                                Text(" dd ").font(.custom(Font.balooBold, size: 30)).foregroundColor(Color.neutral80).padding(.all,10) .border(Color.orangeFox50, width: 5).cornerRadius(10)
                                Text("/").font(.custom(Font.balooBold, size: 30)).foregroundColor(Color.orangeFox50)
                                Text(" mm ").font(.custom(Font.balooBold, size: 30)).foregroundColor(Color.neutral80).padding(.all,10) .border(Color.orangeFox50, width: 5).cornerRadius(10)
                                Text("/").font(.custom(Font.balooBold, size: 30)).foregroundColor(Color.orangeFox50)
                                Text(" yyyy ").font(.custom(Font.balooBold, size: 30)).foregroundColor(Color.neutral80).padding(.all,10) .border(Color.orangeFox50, width: 5).cornerRadius(10)
                            }.padding(.horizontal).padding(.bottom,25).padding(.top,10).onTapGesture {
                                showSheet=true
                            }.sheet(isPresented: $showSheet) {
                                print("Sheet dismissed!")
                            } content: {
                                VStack{
                                    
                                    DatePicker("Enter your birthday", selection: $selectedDate,displayedComponents: .date).accentColor(Color.orangeFox50)
                                        .datePickerStyle(GraphicalDatePickerStyle())
                                    
                                    Button{
                                        self.showSheet=false
                                        let dateFormatter=DateFormatter()
                                        dateFormatter.dateFormat="dd/MM/YYYY"
                                        dateString=dateFormatter.string(from: selectedDate)
                                    }label: {
                                        Text("Done").foregroundColor(Color.orangeFox50).font(.custom(Font.balooMedium, size: 25))
                                    }
                                }
                            }}
                        LazyVGrid(columns: columns,spacing: 20) {
                            ForEach(avatarList.indices, id: \.self) { item in
                                ZStack{
                                    CircleAvatar(imageName: avatarList[item].cropImage).frame(height: geo.size.width*0.12).opacity(avatarList[item].isSelected==true ?1:0.3).onTapGesture {
                                        print(item)
                                        updateAvatarState(idx: item)
                                    }
                                    if(avatarList[item].isSelected==true){
                                        Image(systemName: "checkmark").font(.custom(Font.balooBold, size: 25))
                                            .frame(width: 5, height: 5)
                                            .foregroundColor(.white)
                                            .padding(20)
                                            .background(Color.orangeFox50)
                                            .clipShape(Circle()).offset(x:50,y:50)
                                    }
                                }
                                
                            }
                        }.frame(width: geo.size.width*0.30)
                            .padding([.top], 16)
                        Spacer()
                        
                    }.frame(width: geo.size.width*0.4).padding([.horizontal],20)
                }
                ZStack(alignment:.top){
                    Rectangle().fill(
                        LinearGradient(gradient: Gradient(colors: [Color.orangeFox70, Color.orangeFox50]), startPoint: .top, endPoint: .bottom)
                    )
                    HStack(spacing:0){
                        if(isExpand){
                            VStack(alignment:.leading,spacing:0){
                                
                                Text("Hi!").font(.custom(Font.balooBold,size:120)).foregroundColor(Color.white)
                                Text("Aku \(name)").font(.custom(Font.balooBold,size:80)).foregroundColor(Color.white).padding(.top,-60)
                                HStack{
                                    Text("Aku bermain dengan").font(.custom(Font.balooBold,size:40)).foregroundColor(Color.white)
                                    if let i = avatarParentList.firstIndex(where: { $0.isSelected == true}) {
                                        Text(avatarParentList[i].name).font(.custom(Font.balooBold,size:40)).foregroundColor(Color.white)
                                    }
                                }
                                LazyVGrid(columns: columns,spacing: 20) {
                                    ForEach(avatarParentList.indices, id: \.self) { item in
                                        ZStack{
                                            CircleAvatar(imageName: avatarParentList[item].image).frame(height: geo.size.width*0.14).opacity(avatarParentList[item].isSelected==true ?1:0.3).onTapGesture {
                                                print(item)
                                                updateAvatarParentState(idx: item)
                                            }
                                            if(avatarParentList[item].isSelected==true){
                                                Image(systemName: "checkmark").font(.custom(Font.balooBold, size: 25))
                                                    .frame(width: 5, height: 5)
                                                    .foregroundColor(.white)
                                                    .padding(20)
                                                    .background(Color.orangeFox50)
                                                    .clipShape(Circle()).offset(x:50,y:50)
                                            }
                                        }
                                        
                                    }
                                }.frame(width: geo.size.width*0.30)
                                    .padding([.top], 16)
                               
                                Spacer()
                                HStack(){
                                    Button{
                                        withAnimation(.easeOut) {
                                            isExpand.toggle()
                                            
                                        }
                                    }label:{
                                        Image(systemName: "chevron.left").font(.system(size:40).bold())
                                            .frame(width:60,height: 60)
                                            .foregroundColor(Color.orangeFox50)
                                    }.buttonStyle(BackThreeD()).frame(width:100,height:100).padding(.top)
                                    Spacer()
                                }
                                Spacer()
                            }.frame(width:geo.size.width*0.40).padding(.top,60).padding(.bottom,20).padding(.leading,30)
                        }
                        ZStack{
                            Image("light").resizable().scaledToFit()
                            VStack{
                                Spacer()
                                if let i = avatarList.firstIndex(where: { $0.isSelected == true}) {
                                    Image(avatarList[i].fullImage).resizable().scaledToFit().frame(height: geo.size.height*0.6).offset(y:150).zIndex(1).shadow(
                                        color:Color.white,
                                        radius: 10)
                                }
                                
                                ZStack{
                                    
                                    Image("podium").resizable().frame(width: geo.size.width*0.35).scaledToFit().offset(y:120)
                                    if(name==""||dateString==""){
                                        Button{
                                            
                                            
                                        }label: {
                                            
                                            Text("OK").font(.custom(Font.balooBold, size: 35)).foregroundColor(Color.white)
                                        }.buttonStyle(
                                            
                                            ThreeDDisabled()).frame(width: 110,height: 60).offset(y:80)
                                    }
                                    else{
                                        Button{
                                            if(isExpand==false){
                                                withAnimation(.easeIn) {
                                                    isExpand.toggle()
                                                    
                                                }
                                            }
                                            else{
                                                
                                                userModel.save(
                                                    
                                                    user: UserModel(
                                                        name:name,
                                                        child: avatarList[indexChild], parent: avatarParentList[indexParent]))
                                                
                                            }
                                        }label: {
                                            
                                            Text("OK").font(.custom(Font.balooBold, size: 35)).foregroundColor(Color.white)
                                        }.buttonStyle(
                                            
                                            ThreeD(foregroundColor: Color.orangeFox50, shadowColor: Color.orangeFox70)).frame(width: 110,height: 60).offset(y:80)
                                    }
                                    
                                    
                                }
                            }.padding(.top)
                        }
                    }
                    
                }.frame(width: isExpand ? geo.size.width: geo.size.width*0.6)
            }
        }.ignoresSafeArea()
    }
}

struct ChooseAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseAvatarView(userModel: UserViewModel())
    }
}
