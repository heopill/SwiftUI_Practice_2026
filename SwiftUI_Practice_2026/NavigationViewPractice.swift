//
//  NavigationViewPractice.swift
//  SwiftUI_Practice_2026
//
//  Created by 허성필 on 6/18/26.
//

import SwiftUI

// MARK: - iOS 15 이전
//struct OldNavigationView: View {
//    var body: some View {
//        NavigationView { // 1. 내비게이션 기능으로 감싸기
//            VStack(spacing: 20) {
//                Text("메인 화면입니다")
//                    .font(.title)
//                
//                // 2. 목적지와 누를 영역 정의
//                NavigationLink(destination: DetailView(itemNumber: 1)) {
//                    Text("1번 상세 화면으로 이동")
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                }
//            }
//            .navigationTitle("홈") // 3. 상단 타이틀 설정
//        }
//    }
//}
//
//// 상세 화면 뷰
//struct DetailView: View {
//    let itemNumber: Int
//    
//    var body: some View {
//        VStack {
//            Text("\(itemNumber)번 상세 화면")
//                .font(.largeTitle)
//        }
//        .navigationTitle("상세 페이지") // 상세 화면의 타이틀
//    }
//}

// MARK: - iOS 16 이후
struct ModernNavigation: View {
    let items = ["사과", "바나나", "포도"]
    
    var body: some View {
        NavigationStack { // NavigationView 대신 NavigationStack 사용
            List(items, id: \.self) { item in
                // value를 던져주고, 어떤 뷰로 갈지는 아래에서 결정함 (데이터 주도 방식)
                NavigationLink(item, value: item)
            }
            .navigationTitle("과일 목록")
            // 어떤 데이터 유형(String)이 들어왔을 때 어디로 갈지 정의
            .navigationDestination(for: String.self) { fruitName in
                FruitDetailView(name: fruitName)
            }
        }
    }
}

struct FruitDetailView: View {
    let name: String
    var body: some View {
        Text("\(name)은(는) 맛있다!")
            .font(.title)
            .navigationTitle(name)
    }
}
