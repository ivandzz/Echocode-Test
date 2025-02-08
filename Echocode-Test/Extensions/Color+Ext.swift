//
//  Color+Ext.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI

extension Color {
    static let backgroundCyan = Color(hex: "#F3F5F6")
    static let backgroundYellow = Color(hex: "#C9FFE0")
    
    static let customBlue = Color(hex: "#D1E7FC")
    static let customYellow = Color(hex: "#ECFBC7")
    static let customDarkBlue = Color(hex: "#292D32")
    
    static let customShadowColor = Color(hex: "#373E7D0D")
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}
