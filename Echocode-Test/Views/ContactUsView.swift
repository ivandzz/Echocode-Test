//
//  ContactUsView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 10.02.2025.
//

import SwiftUI

struct ContactUsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    @State private var email = ""
    @State private var message = ""
    
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
                
                Button {
                    
                } label: {
                    BigButton(text: "Send", iconName: "paperplane") {
                        
                    }
                }
                .padding(.bottom, 50)
            }
        }
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
