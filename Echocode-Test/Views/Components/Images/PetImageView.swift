//
//  PetImageView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 11.02.2025.
//

import SwiftUI

struct PetImageView: View {
    
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 184, height: 184)
            .padding(.bottom, 134)
    }
}

#Preview {
    PetImageView(imageName: "cat")
}
