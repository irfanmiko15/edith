//
//  Module1View.swift
//  edith
//
//  Created by Muhammad Luthfi on 30/06/23.
//

import SwiftUI

struct Module1View: View {
    @ObservedObject var modulViewModel: ModulViewModel
    @State var listPrompt: [String] = ["Kebutuhan adalah semua hal yang diperlukan untuk hidup.","Makanan, air, pakaian dan tempat tinggal adalah kebutuhan.", "Tanpa kebutuhan, kita tidak bisa bertahan hidup.", "Keinginan adalah hal-hal yang diharapkan untuk dimiliki.","Boneka, sepeda dan mainan baru adalah  contoh keinginan.","Tanpa keinginan, kita masih bisa bertahan hidup.","Sekarang, kita akan coba membedakan keinginan dan kebutuhan.","Apakah kalian siap?"]
    @State var listImages: [String] = ["edithMenyapa", "edithDiam", "edithSedih","edithMenyapa", "edithDiam", "edithMenyapa", "edithMenyapa", "edithBahagia"]
    // contoh: listPrompt: [String] = ["Kebutuhan adalah semua hal yang diperlukan untuk hidup.", "Makanan, air, pakaian dan tempat tinggal adalah kebutuhan.", "Tanpa kebutuhan, kita tidak bisa bertahan hidup."]
    // contoh: listImages: [String] = ["edithMenyapa", "edithDiem", "edithSedih", "edithDiem"] bisa lebih dari satu, pokoknya harus urut misal di listprompt urutan satu promptnya apa, berarti listimages di urutan 1 harus sesuai
    @State var prompts: [ModulModel]
    
    @State var indexPrompt:Int = 0
    @State var indexImage:Int = 0
    
    var body: some View {
        GeometryReader{reader in
            ZStack{
                Image("bgModul")
                    .resizable()
                    .scaledToFill()
                HStack{
                    
                    Image(listImages[indexImage])
                    
                    VStack{
                        PromptBox(textInside: listPrompt[indexPrompt], width: reader.size.width/2, height: reader.size.height/3, textSize: 35)
                        
                        Button{
                            
                            if indexPrompt < listPrompt.count-1 {
                                indexPrompt += 1
                                indexImage += 1
                            } else{
                                
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
                    
            }
            
        }
        .ignoresSafeArea(.all)
    }
}

struct Module1View_Previews: PreviewProvider {
    static var previews: some View {
        Module1View(modulViewModel: ModulViewModel(), prompts: [ModulModel(prompt: "", edithImage: "", listImage: [])])
    }
}
