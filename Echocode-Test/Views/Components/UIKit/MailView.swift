//
//  MailView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 10.02.2025.
//

import SwiftUI
import MessageUI

struct MailView: UIViewControllerRepresentable {
    
    //MARK: - Properties
    let recipient: String
    let subject: String
    let body: String
    
    //MARK: - Static Properties
    static var canSendMail: Bool {
        MFMailComposeViewController.canSendMail()
    }
    
    //MARK: - Coordinator
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            controller.dismiss(animated: true)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    //MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setToRecipients([recipient])
        vc.setSubject(subject)
        vc.setMessageBody(body, isHTML: false)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) { }
}
