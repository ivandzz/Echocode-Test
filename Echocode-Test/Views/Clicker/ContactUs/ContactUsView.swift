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
                
                formView
                
                sendButton
            }
        }
        .alert(isPresented: $viewModel.isShowingAlert, error: viewModel.error) {
            Button("OK", role: .cancel) { viewModel.error = nil }
        }
        .sheet(isPresented: $viewModel.isShowingMailView) {
            MailView(recipient: "ivan.dzhul@gmail.com", subject: "Feedback", body: viewModel.emailBody())
        }
        .onAppear() {
            viewModel.onAppear()
        }
        .onDisappear() {
            viewModel.onDisappear()
        }
    }
    
    //MARK: - Header
    private var headerView: some View {
        ZStack {
            HStack {
                CloseButton {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        viewModel.isShowing = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            dismiss()
                        }
                    }
                }
                .offset(x: viewModel.isShowing ? 0 : -100)
                .animation(.spring(response: 0.6, dampingFraction: 0.7), value: viewModel.isShowing)
                
                Spacer()
            }
            .padding(.vertical, 17)
            .padding(.horizontal)
            
            MainTitle("Contact Us")
                .padding(.vertical, 12)
                .opacity(viewModel.isShowing ? 1 : 0)
                .offset(y: viewModel.isShowing ? 0 : -20)
                .transition(.move(edge: .top).combined(with: .opacity))
        }
    }
    
    //MARK: - Form
    private var formView: some View {
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
        .scaleEffect(viewModel.isShowing ? 1 : 0.5)
        .opacity(viewModel.isShowing ? 1 : 0)
        .animation(.spring(response: 0.6, dampingFraction: 0.7).delay(0.3), value: viewModel.isShowing)
    }
    
    //MARK: - Send button
    private var sendButton: some View {
        BigButton(text: "Send", iconName: "paperplane") {
            viewModel.sendEmail()
        }
        .padding(.bottom, 50)
        .opacity(viewModel.isShowing ? 1 : 0)
        .scaleEffect(viewModel.isShowing ? 1 : 0.95)
        .animation(.spring(response: 0.6, dampingFraction: 0.7).delay(0.2), value: viewModel.isShowing)
    }
}

#Preview {
    ContactUsView(viewModel: ContactUsViewModel(onDismiss: { }))
}
