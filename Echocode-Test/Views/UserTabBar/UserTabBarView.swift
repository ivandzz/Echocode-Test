//
//  UserTabBarView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI

struct UserTabBarView: View {
    
    //MARK: - Properties
    @StateObject var viewModel = UserTabBarViewModel()
    
    //MARK: - Body
    var body: some View {
        ZStack {
            TabView(selection: $viewModel.selectedTab) {
                TranslatorView(isTabBarHidden: $viewModel.isTabBarHidden)
                    .tabItem {
                        Label(UserTabBarViewModel.Tab.translator.title, image: UserTabBarViewModel.Tab.translator.image)
                    }
                    .toolbar(.hidden, for: .tabBar)
                    .tag(UserTabBarViewModel.Tab.translator.tag)
                
                ClickerView()
                    .tabItem {
                        Label(UserTabBarViewModel.Tab.clicker.title, image: UserTabBarViewModel.Tab.clicker.image)
                    }
                    .toolbar(.hidden, for: .tabBar)
                    .tag(UserTabBarViewModel.Tab.clicker.tag)
            }
            
            VStack {
                Spacer()
                
                ZStack() {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.white)
                        .shadow(color: .customShadowColor.opacity(0.15), radius: 80)
                        .frame(width: 216, height: 82)
                    
                    HStack {
                        TabBarButton(tab: .translator, selectedTab: $viewModel.selectedTab)
                            .padding(.leading, 24)
                        
                        Spacer()
                        
                        TabBarButton(tab: .clicker, selectedTab: $viewModel.selectedTab)
                    }
                    .padding(.trailing, 24)
                }
                .frame(width: 215, height: 82)
            }
            .padding(.bottom, 16)
            .opacity(viewModel.isTabBarHidden ? 0 : 1)
            .offset(y: viewModel.isTabBarHidden ? 100 : 0)
            .animation(.spring(response: 0.5, dampingFraction: 0.5), value: viewModel.isTabBarHidden)
        }
    }
}

#Preview {
    UserTabBarView()
}
