//
//  TabViewPractice.swift
//  SwiftUI_Practice_2026
//
//  Created by 허성필 on 6/18/26.
//

import SwiftUI

struct TabViewExample: View {
    var body: some View {
        TabView {
            // 첫 번째 탭 화면
            HomeView()
                .tabItem {
                    Label("홈", systemImage: "house.fill")
                }
            
            // 두 번째 탭 화면
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }
            
            // 세 번째 탭 화면
            SettingView()
                .tabItem {
                    Label("설정", systemImage: "gearshape.fill")
                }
        }
        .tint(.blue) // 선택된 탭의 강조 색상을 파란색으로 지정
    }
}

// 각 탭에 들어갈 임시 뷰들
struct HomeView: View { var body: some View { Text("홈 화면").font(.largeTitle) } }
struct SearchView: View { var body: some View { Text("검색 화면").font(.largeTitle) } }
struct SettingView: View { var body: some View { Text("설정 화면").font(.largeTitle) } }

struct ControlledTabView: View {
    // 현재 선택된 탭을 저장하는 상태 변수 (0: 홈, 1: 설정)
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            VStack(spacing: 20) {
                Text("여기는 홈 화면입니다")
                Button("설정 화면으로 가기") {
                    selectedTab = 1 // 코드로 탭을 변경
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .tabItem { Label("홈", systemImage: "house") }
            .tag(0) // 태그 부여
            
            Text("여기는 설정 화면입니다")
                .tabItem { Label("설정", systemImage: "gear") }
                .tag(1) // 태그 부여
        }
    }
}

struct OnboardingPageView: View {
    var body: some View {
        TabView {
            Text("반갑습니다! 우리 앱을 소개합니다. (1/3)")
                .font(.title)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.red.opacity(0.2))
            
            Text("다양한 기능을 즐겨보세요. (2/3)")
                .font(.title)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.green.opacity(0.2))
                
            Text("이제 시작해볼까요? (3/3)")
                .font(.title)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue.opacity(0.2))
        }
        // 하단 탭 바 대신 페이지 인디케이터(점 표시) 스타일 적용
        .tabViewStyle(.page)
        // 흰색 배경에서도 점이 보이도록 인디케이터 색상 정하기
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}
