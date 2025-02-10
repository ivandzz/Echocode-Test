//
//  ContactUsView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 10.02.2025.
//

import SwiftUI
import MessageUI

struct ContactUsView: View {
    
    //MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: ContactUsViewModel
    
    //MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradient()
            
            VStack {
                headerView
                
                Form {
                    Section(header: Text("Personal Info")) {
                        TextField("Your Name", text: $viewModel.name)
                        
                        TextField("Your Email", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                    }
                    
                    Section(header: Text("Leave your feedback")) {
                        TextEditor(text: $viewModel.message)
                            .frame(height: 150)
                    }
                }
                .scrollContentBackground(.hidden)
                .padding(.horizontal, 16)
                
                BigButton(text: "Send", iconName: "paperplane") {
                    viewModel.sendEmail()
                }
                .padding(.bottom, 50)
            }
        }
        .alert(isPresented: $viewModel.isShowingAlert, error: viewModel.error) {
            Button("OK", role: .cancel) { viewModel.error = nil }
        }
        .sheet(isPresented: $viewModel.isShowingMailView) {
            MailView(recipient: "ivan.dzhul@gmail.com", subject: "Feedback", body: viewModel.emailBody())
        }
        .onDisappear() {
            viewModel.onDismiss()
        }
    }
    
    //MARK: - Header
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
    ContactUsView(viewModel: ContactUsViewModel(onDismiss: { }))
}
