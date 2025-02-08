//
//  UserTabBarView.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI

struct UserTabBarView: View {
    
    @StateObject var viewModel = UserTabBarViewModel()
    
    var body: some View {
        ZStack {
            TabView(selection: $viewModel.selectedTab) {
                TranslatorView(isTabBarHidden: $viewModel.isTabBarHidden)
                    .tabItem {
                        Label(UserTabBarViewModel.Tabs.translator.title, image: UserTabBarViewModel.Tabs.translator.image)
                    }
                    .toolbar(.hidden, for: .tabBar)
                    .tag(0)
                
                ClickerView()
                    .tabItem {
                        Label(UserTabBarViewModel.Tabs.clicker.title, image: UserTabBarViewModel.Tabs.clicker.image)
                    }
                    .toolbar(.hidden, for: .tabBar)
                    .tag(1)
            }
            
            VStack {
                Spacer()
                
                ZStack() {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.white)
                        .shadow(color: .customShadowColor.opacity(0.15), radius: 80)
                        .frame(width: 216, height: 82)
                    
                    HStack {
                        Button(action: {
                            viewModel.selectedTab = 0
                        }) {
                            VStack(spacing: 4) {
                                Image(UserTabBarViewModel.Tabs.translator.image)
                                    .opacity(viewModel.selectedTab == 0 ? 1 : 0.5)
                                
                                Text(UserTabBarViewModel.Tabs.translator.title)
                                    .foregroundStyle(Color.customDarkBlue)
                                    .opacity(viewModel.selectedTab == 0 ? 1 : 0.5)
                                    .font(.custom("KonkhmerSleokchher-Regular", size: 12))
                            }
                        }
                        .padding(.leading, 24)
                        
                        Spacer()
                        
                        Button(action: {
                            viewModel.selectedTab = 1
                        }) {
                            VStack(spacing: 4) {
                                Image(UserTabBarViewModel.Tabs.clicker.image)
                                    .opacity(viewModel.selectedTab == 1 ? 1 : 0.5)
                                
                                Text(UserTabBarViewModel.Tabs.clicker.title)
                                    .foregroundStyle(Color.customDarkBlue)
                                    .opacity(viewModel.selectedTab == 1 ? 1 : 0.5)
                                    .font(.custom("KonkhmerSleokchher-Regular", size: 12))
                            }
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
}

#Preview {
    UserTabBarView()
}
