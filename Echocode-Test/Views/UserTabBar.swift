//
//  UserTabBar.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 06.02.2025.
//

import SwiftUI

struct UserTabBar: View {
    
    @State private var selectedTab = 0
    @StateObject private var translatorViewModel = TranslatorViewModel()
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                TranslatorView(viewModel: translatorViewModel)
                    .tabItem {
                        Label("Translator", systemImage: "bubble.left.and.bubble.right")
                    }
                    .toolbar(.hidden, for: .tabBar)
                    .tag(0)
                
                ClickerView()
                    .tabItem {
                        Label("Clicker", systemImage: "gearshape")
                    }
                    .toolbar(.hidden, for: .tabBar)
                    .tag(1)
            }
            
            VStack {
                Spacer()
                
                ZStack() {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(.white)
                        .shadow(radius: 10)
                        .frame(width: 215, height: 80)
                    
                    HStack {
                        Button(action: {
                            selectedTab = 0
                        }) {
                            VStack(spacing: 5) {
                                Image(systemName: "bubble.left.and.bubble.right")
                                    .font(.system(size: 24))
                                    .fontWeight(.semibold)
                                    .foregroundColor(selectedTab == 0 ? .black : .gray)
                                
                                Text("Translator")
                                    .foregroundStyle(selectedTab == 0 ? .black : .gray)
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                    .lineLimit(1)
                            }
                        }
                        .padding(.leading, 30)
                        
                        Spacer()
                        
                        Button(action: {
                            selectedTab = 1
                        }) {
                            VStack(spacing: 5) {
                                Image(systemName: "gearshape")
                                    .font(.system(size: 24))
                                    .fontWeight(.semibold)
                                    .foregroundColor(selectedTab == 1 ? .black : .gray)
                                
                                Text("Clicker")
                                    .foregroundStyle(selectedTab == 1 ? .black : .gray)
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                    .lineLimit(1)
                            }
                        }
                        .padding(.trailing, 30)
                    }
                    .frame(width: 215, height: 80)
                }
                .padding(.bottom, 20)
                .opacity(translatorViewModel.isShowingResult ? 0 : 1)
                .offset(y: translatorViewModel.isShowingResult ? 100 : 0)
                .animation(.spring(response: 0.5, dampingFraction: 0.5), value: translatorViewModel.isShowingResult)
            }
        }
    }
}

#Preview {
    UserTabBar()
}
