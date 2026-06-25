//
//  ViewModifierPractice.swift
//  SwiftUI_Practice_2026
//
//  Created by 허성필 on 6/23/26.
//

import SwiftUI

// 1. 공통 스타일을 정의하는 Modifier 생성
struct CardBackgroundModifier: ViewModifier {
    var cornerRadius: CGFloat = 12
    var backgroundColor: Color = Color(.systemBackground)
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

// 2. 외부에서 쉽게 쓸 수 있도록 View Extension 등록
extension View {
    func asCardStyle(radius: CGFloat = 12, bg: Color = Color(.systemBackground)) -> some View {
        self.modifier(CardBackgroundModifier(cornerRadius: radius, backgroundColor: bg))
    }
}

// 3. 실제 사용 예시
struct CustomModifierExample: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("공동구매 상품 목록")
                .font(.headline)
                .foregroundColor(.primary)
            
            Text("마감 임박! 지금 참여하세요.")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        // 기본 뷰에 체이닝 형태로 커스텀 스타일 적용
        .asCardStyle(radius: 16, bg: Color(.secondarySystemBackground))
        .padding()
    }
}
