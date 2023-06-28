//
//  Checklist.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 26/06/23.
//

import SwiftUI

struct Checklist: View {
    var body: some View {
        Image(systemName: "checkmark").font(.custom(Font.balooBold, size: 50))
          .frame(width: 30, height: 30)
          .foregroundColor(.white)
          .padding(30)
          .background(Color.orangeFox50)
          .clipShape(Circle())
    }
}

struct Checklist_Previews: PreviewProvider {
    static var previews: some View {
        Checklist()
    }
}
