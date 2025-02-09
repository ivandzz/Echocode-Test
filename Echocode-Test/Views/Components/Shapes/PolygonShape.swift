//
//  PolygonShape.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 09.02.2025.
//

import SwiftUI

struct PolygonShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    PolygonShape()
}
