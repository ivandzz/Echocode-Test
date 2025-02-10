//
//  ContactUsView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 10.02.2025.
//

import SwiftUI
import MessageUI

struct ContactUsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    @State private var email = ""
    @State private var message = ""
    @State private var isShowingAlert = false
    @State private var error: MailError?
    @State private var isShowingMailView = false
    
    var body: some View {
        ZStack {
            BackgroundGradient()
            
            VStack {
                headerView
                
                Form {
                    Section(header: Text("Personal Info")) {
                        TextField("Your Name", text: $name)
                        
                        TextField("Your Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                    }
                    
                    Section(header: Text("Leave your feedback")) {
                        TextEditor(text: $message)
                            .frame(height: 150)
                    }
                }
                .scrollContentBackground(.hidden)
                .padding(.horizontal, 16)
                
                BigButton(text: "Send", iconName: "paperplane") {
                    sendEmail()
                }
                .padding(.bottom, 50)
            }
        }
        .alert(isPresented: $isShowingAlert, error: error) {
            Button("OK", role: .cancel) { error = nil }
        }
        .sheet(isPresented: $isShowingMailView) {
            MailView(recipient: "ivan.dzhul@gmail.com", subject: "Feedback", body: emailBody())
        }
    }
    
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
    
    private var headerView: some View {
        ZStack {
            HStack {
                CloseButton {
                    dismiss()
                }
                
                Spacer()
            }
            .padding(.top, 17)
            .padding(.horizontal)
            
            MainTitle("Contact Us")
                .padding(.top, 12)
        }
    }
}

#Preview {
    ContactUsView()
}
