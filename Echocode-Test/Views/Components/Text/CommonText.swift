//
//  CommonText.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 09.02.2025.
//

import SwiftUI

struct CommonText: View {
    
    //MARK: - Properties
    let text: String
    
    //MARK: - Init
    init(_ text: String) {
        self.text = text
    }
    
    //MARK: - Body
    var body: some View {
        Text(text)
            .font(.custom("KonkhmerSleokchher-Regular", size: 16))
            .foregroundStyle(Color.customDarkBlue)
            .frame(height: 22)
    }
}

#Preview {
    CommonText("Text")
}
