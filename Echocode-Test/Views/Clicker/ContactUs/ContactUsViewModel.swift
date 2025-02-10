//
//  ContactUsViewModel.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 10.02.2025.
//

import Foundation

final class ContactUsViewModel: ObservableObject {
    
    // MARK: - Published properties
    @Published var name = ""
    @Published var email = ""
    @Published var message = ""
    @Published var isShowingAlert = false
    @Published var error: MailError?
    @Published var isShowingMailView = false
    
    //MARK: - Properties
    var onDismiss: () -> Void
    
    // MARK: - Init
    init(onDismiss: @escaping () -> Void) {
        self.onDismiss = onDismiss
    }
    
    // MARK: - Methods
    func sendEmail() {
        if let validationError = validateForm() {
            error = validationError
            isShowingAlert = true
            return
        }
        
        if MailView.canSendMail {
            isShowingMailView = true
        } else {
            error = .mailUnavailable
            isShowingAlert = true
        }
    }
    
    func validateForm() -> MailError? {
        if name.isEmpty || email.isEmpty || message.isEmpty {
            return .emptyFields
        }
        
        guard email.isValidEmail else {
            return .invalidEmail
        }
        
        return nil
    }
    
    func emailBody() -> String {
        """
        Name: \(name)
        Email: \(email)
            
        Message:
        \(message)
        """
    }
    
}
