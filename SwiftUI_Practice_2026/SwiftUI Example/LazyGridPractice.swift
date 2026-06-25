//
//  LazyGridPractice.swift
//  SwiftUI_Practice_2026
//
//  Created by 허성필 on 6/15/26.
//

import SwiftUI

struct LazyGridView: View {
    // 1. GridItem 배열을 통해 3열 도면을 만든다.
    // 각 열은 화면 폭에 맞춰 유연하게 늘어난다.
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            // 2. 도면(columns)을 레이아웃 틀에 주입
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(1...20, id: \.self) { index in
                    Text("Item \(index)")
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(Color.orange.opacity(0.7))
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}
