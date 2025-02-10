//
//  ClickerView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI
import StoreKit

struct ClickerView: View {
    
    //MARK: - Properties
    @Environment(\.requestReview) var requestReview
    @StateObject private var viewModel: ClickerViewModel
    @Binding var isTabBarHidden: Bool
    
    //MARK: - Init
    init(isTabBarHidden: Binding<Bool>) {
        _isTabBarHidden = isTabBarHidden
        _viewModel = StateObject(wrappedValue: ClickerViewModel {
            isTabBarHidden.wrappedValue = $0
        })
    }
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundGradient()
                
                VStack {
                    MainTitle("Settings")
                        .padding(.vertical, 12)
                    
                    List {
                        SettingsButton(text: "Rate Us") {
                            requestReview()
                        }
                        .listRowModifier()
                        
                        ShareLink(item: AppURL.appGithub!) {
                            SettingsButtonLabel(text: "Share App")
                        }
                        .listRowModifier()

                        SettingsButton(text: "Contact Us") {
                            viewModel.isShowingContactUs = true
                            viewModel.isTabBarHidden(true)
                        }
                        .listRowModifier()

                        SettingsButton(text: "Restore Purchases") {
                            Task {
                                await viewModel.restorePurchases()
                            }
                        }
                        .listRowModifier()
                        
                        SettingsButton(text: "Privacy Policy") {
                            viewModel.isShowingPrivacyPolicy = true
                        }
                        .listRowModifier()
                        
                        SettingsButton(text: "Terms of Use") {
                            viewModel.isShowingTermsOfUse = true
                        }
                        .listRowModifier()
                    }
                    .disabled(viewModel.isRestoring)
                    .listStyle(.plain)
                }
                if viewModel.isRestoring {
                    ProgressView()
                        .scaleEffect(2)
                }
            }
            .navigationDestination(isPresented: $viewModel.isShowingContactUs) {
                ContactUsView(viewModel: ContactUsViewModel(onDismiss: { isTabBarHidden = false }))
                    .navigationBarBackButtonHidden()
            }
            
            .alert(viewModel.restoreStatus == .success ? "Success" : "Error",
                   isPresented: $viewModel.isShowingRestoreAlert
            ) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(viewModel.restoreStatus?.message ?? "Unknown error occurred.")
            }
            
            .sheet(isPresented: $viewModel.isShowingPrivacyPolicy) {
                SafariSheet(url: AppURL.privacyPolicy)
            }
            
            .sheet(isPresented: $viewModel.isShowingTermsOfUse) {
                SafariSheet(url: AppURL.termsOfUse)
            }
        }
    }
}

//MARK: - View Modifiers
private extension View {
    func listRowModifier() -> some View {
        self
            .padding(.bottom, 14)
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
    }
}

#Preview {
    ClickerView(isTabBarHidden: .constant(true))
}
