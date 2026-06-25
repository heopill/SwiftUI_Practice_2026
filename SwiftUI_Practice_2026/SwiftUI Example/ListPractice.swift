//
//  ListPractice.swift
//  SwiftUI_Practice_2026
//
//  Created by 허성필 on 6/17/26.
//

// MARK: - 삭제 모디파이어
import SwiftUI

struct ListView: View {
    @State private var items = ["아이템 1", "아이템 2", "아이템 3"]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                Text(item)
            }
            .onDelete(perform: deleteItem) // 밀어서 삭제 액션 연결
        }
    }
    
    private func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

// MARK: - 기본형
//import SwiftUI
//
//// 1. 리스트에 표시할 데이터 모델 정의
//struct Fruit: Identifiable {
//    let id = UUID() // Identifiable을 만족하기 위한 고유 ID
//    let name: String
//    let icon: String
//}
//
//struct ListView: View {
//    // 2. 샘플 데이터 배열
//    let fruits = [
//        Fruit(name: "사과", icon: "🍎"),
//        Fruit(name: "바나나", icon: "🍌"),
//        Fruit(name: "체리", icon: "🍒"),
//        Fruit(name: "포도", icon: "🍇")
//    ]
//    
//    var sample: some View {
//        // 3. List 구현
//        NavigationStack {
//            List(fruits) { fruit in
//                HStack(spacing: 15) {
//                    Text(fruit.icon)
//                        .font(.largeTitle)
//                    Text(fruit.name)
//                        .font(.headline)
//                }
//                .padding(.vertical, 5)
//            }
//            .navigationTitle("과일 바구니") // 네비게이션 타이틀 추가
//        }
//    }
//}

// MARK: - 섹션 나누기
//List {
//    Section(header: Text("국산 과일")) {
//        Text("🍎 사과")
//        Text("🍇 포도")
//    }
//    
//    Section(header: Text("수입 과일"), footer: Text("수입 과일은 환율에 따라 가격이 변동됩니다.")) {
//        Text("🍌 바나나")
//        Text("🥭 망고")
//    }
//}
