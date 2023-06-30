//
//  Module1View.swift
//  edith
//
//  Created by Muhammad Luthfi on 30/06/23.
//

import SwiftUI

struct Module1View: View {
    @ObservedObject var modulViewModel: ModulViewModel
    @State var listPrompt: [String] = ["Kebutuhan adalah semua hal yang diperlukan untuk hidup.","masukin sini satu-satu", "harus dimasukin yah", "ini isinya prompt"]
    @State var listImages: [String] = ["edithMenyapa", "format nama image harus urut", "misalnya di prompt 1 itu edithBahagia maka", "ditulsi disini edithBahagia"]
    // contoh: listPrompt: [String] = ["Kebutuhan adalah semua hal yang diperlukan untuk hidup.", "Makanan, air, pakaian dan tempat tinggal adalah kebutuhan.", "Tanpa kebutuhan, kita tidak bisa bertahan hidup."]
    // contoh: listImages: [String] = ["edithMenyapa", "edithDiem", "edithSedih", "edithDiem"] bisa lebih dari satu, pokoknya harus urut misal di listprompt urutan satu promptnya apa, berarti listimages di urutan 1 harus sesuai
    @State var prompts: [ModulModel]
    
    var body: some View {
        GeometryReader{reader in
            ZStack{
                Image("bgModul")
                    .resizable()
                    .scaledToFill()
                PromptBox(textInside: listPrompt[0], width: reader.size.width/2, height: reader.size.height/2, textSize: 20)
                Image(listImages[0])
                    
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
