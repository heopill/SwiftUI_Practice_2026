//
//  ScrollViewPractice.swift
//  SwiftUI_Practice_2026
//
//  Created by 허성필 on 6/18/26.
//

import SwiftUI

//struct VerticalScrollView: View {
//    var body: some View {
//        // axes: .vertical (기본값), showsIndicators: 스크롤 바 표시 여부
//        ScrollView(.vertical, showsIndicators: true) {
//            VStack(spacing: 20) {
//                ForEach(1...20, id: \.self) { index in
//                    Text("아이템 \(index)")
//                        .font(.title2)
//                        .frame(maxWidth: .infinity)
//                        .frame(height: 100)
//                        .background(Color.blue.opacity(0.2))
//                        .cornerRadius(10)
//                        .padding(.horizontal)
//                }
//            }
//        }
//    }
//}

struct HorizontalScrollView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("추천 콘텐츠")
                .font(.headline)
                .padding(.leading)
            
            // 가로 스크롤 설정, 스크롤 바 숨김
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(1...10, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.orange)
                            .frame(width: 150, height: 200)
                            .overlay(
                                Text("카드 \(index)")
                                    .foregroundColor(.white)
                                    .font(.headline)
                            )
                    }
                }
                .padding(.horizontal) // 양 끝에 여백 제공
            }
        }
    }
}
