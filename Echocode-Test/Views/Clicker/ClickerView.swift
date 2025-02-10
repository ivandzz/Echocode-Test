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
                        Button(action: {
                            requestReview()
                        }, label: {
                            SettingsListButton(text: "Rate Us")
                        })
                        .padding(.bottom, 14)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        
                        ShareLink(item: URL(string: "https://github.com/ivandzz")!) {
                            SettingsListButton(text: "Share App")
                        }
                        .padding(.bottom, 14)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        
                        Button(action: {
                            viewModel.isShowingContactUs = true
                            viewModel.isTabBarHidden(true)
                        }, label: {
                            SettingsListButton(text: "Contact Us")
                        })
                        .padding(.bottom, 14)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationDestination(isPresented: $viewModel.isShowingContactUs) {
                ContactUsView(viewModel: ContactUsViewModel(onDismiss: { isTabBarHidden = false }))
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    ClickerView(isTabBarHidden: .constant(true))
}
