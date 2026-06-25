//
//  MatchedGeometryEffectPractice.swift
//  SwiftUI_Practice_2026
//
//  Created by 허성필 on 6/24/26.
//

import SwiftUI

struct MatchedGeometryExample: View {
    @Namespace private var animationNamespace
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            if !isExpanded {
                // 1. 작은 프로필 카드 형태
                HStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.orange)
                        // 동일한 id와 namespace를 지정하여 두 뷰를 매핑
                        .matchedGeometryEffect(id: "shape", in: animationNamespace)
                        .frame(width: 50, height: 50)
                    
                    Text("터치하면 확장됩니다")
                        .matchedGeometryEffect(id: "title", in: animationNamespace)
                    
                    Spacer()
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
            } else {
                // 2. 확장된 상세 화면 형태
                VStack(spacing: 20) {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.orange)
                        .matchedGeometryEffect(id: "shape", in: animationNamespace)
                        .frame(width: 300, height: 200)
                    
                    Text("상세보기 화면")
                        .font(.title2)
                        .bold()
                        .matchedGeometryEffect(id: "title", in: animationNamespace)
                    
                    Text("매끄러운 컴포넌트 이동 애니메이션을 구현합니다.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding()
                .background(Color(.systemBackground))
                .shadow(radius: 10)
            }
        }
        .padding()
        .onTapGesture {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                isExpanded.toggle()
            }
        }
    }
}
