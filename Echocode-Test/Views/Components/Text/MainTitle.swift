//
//  MainTitle.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 09.02.2025.
//

import SwiftUI

struct MainTitle: View {
    
    //MARK: - Properties
    let title: String
    
    //MARK: - Init
    init(_ title: String) {
        self.title = title
    }
    
    //MARK: - Body
    var body: some View {
        Text(title)
            .font(.custom("KonkhmerSleokchher-Regular", size: 32))
            .foregroundStyle(Color.customDarkBlue)
            .frame(height: 58)
    }
}

#Preview {
    MainTitle("Main Title")
}
