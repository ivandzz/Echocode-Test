//
//  SafariView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 10.02.2025.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) { }
}

struct SafariSheet: View {
    
    let url: URL?
    
    var body: some View {
        if let url {
            SafariView(url: url)
        } else {
            SafariView(url: AppURL.fallback)
        }
    }
}

#Preview {
    SafariView(url: URL(string: "https://www.apple.com")!)
}
