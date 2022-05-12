//
//  ContentView.swift
//  CustomTabBar_tutorial
//
//  Created by Jeff Jeong on 2022/05/13.
//

import SwiftUI

// 바텀 탭 페이지
enum BottomTab {
    case home, list, search, myPage
}

struct ContentView: View {
    
    @State var currentTab : BottomTab = .home
    
    init(){
        UITabBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            tabView.zIndex(0)
            bottomTabs.zIndex(1)
        }
    }
}

//MARK: - 뷰
extension ContentView {
    
    // 탭뷰
    var tabView : some View {
        TabView (selection: $currentTab) {
            
            Color.yellow.edgesIgnoringSafeArea(.all)
                .overlay(Text("홈").font(.largeTitle))
                .tag(BottomTab.home)
                .setTabBarVisibility(isHidden: true)
//                .tabItem {
//                    Image(systemName: "house")
//                    Text("홈")
//                }
            
            Color.orange.edgesIgnoringSafeArea(.all)
                .overlay(Text("리스트").font(.largeTitle))
                .tag(BottomTab.list)
//                .tabItem {
//                    Image(systemName: "list.dash")
//                    Text("리스트")
//                }
            
            Color.pink.edgesIgnoringSafeArea(.all)
                .overlay(Text("검색").font(.largeTitle))
                .tag(BottomTab.search)
//                .tabItem {
//                    Image(systemName: "magnifyingglass")
//                    Text("검색")
//                }
            
            Color.blue.edgesIgnoringSafeArea(.all)
                .overlay(Text("마이").font(.largeTitle))
                .tag(BottomTab.myPage)
//                .tabItem {
//                    Image(systemName: "person")
//                    Text("마이")
//                }
        }
    }
    
    // 바텀 탭 아이템들
    var bottomTabs : some View {
        HStack{
            Button(action: {
                withAnimation{self.currentTab = .home}
            }, label: {
                RoundedRectangle(cornerRadius: 8).fill(.yellow)
                    .overlay(Text("홈").foregroundColor(.black))
                    .padding()
                    .scaleEffect(currentTab == .home ? 1 : 0.8)
                    .opacity(currentTab == .home ? 1 : 0.5)
            })
            .buttonStyle(TabBarButtonStyle())
            
            Button(action: {
                withAnimation{self.currentTab = .list}
            }, label: {
                RoundedRectangle(cornerRadius: 8).fill(.orange)
                    .overlay(Text("리스트").foregroundColor(.black))
                    .padding()
                    .scaleEffect(currentTab == .list ? 1 : 0.8)
                    .opacity(currentTab == .list ? 1 : 0.5)
            })
            .buttonStyle(TabBarButtonStyle())
            
            Button(action: {
                withAnimation{self.currentTab = .search}
            }, label: {
                RoundedRectangle(cornerRadius: 8).fill(.pink)
                    .overlay(Text("검색").foregroundColor(.black))
                    .padding()
                    .scaleEffect(currentTab == .search ? 1 : 0.8)
                    .opacity(currentTab == .search ? 1 : 0.5)
            })
            .buttonStyle(TabBarButtonStyle())
            
            Button(action: {
                withAnimation{self.currentTab = .myPage}
            }, label: {
                RoundedRectangle(cornerRadius: 8).fill(.blue)
                    .overlay(Text("마이").foregroundColor(.black))
                    .padding()
                    .scaleEffect(currentTab == .myPage ? 1 : 0.8)
                    .opacity(currentTab == .myPage ? 1 : 0.5)
            })
            .buttonStyle(TabBarButtonStyle())
        }
        .frame(height: 80)
        .clipped()
        .background(Color.white.opacity(0.9).blur(radius: 2).edgesIgnoringSafeArea(.bottom))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
