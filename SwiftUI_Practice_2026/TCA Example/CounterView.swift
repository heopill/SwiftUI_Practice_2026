//
//  CounterView.swift
//  SwiftUI_Practice_2026
//
//  Created by 허성필 on 6/25/26.
//

import ComposableArchitecture
import SwiftUI

// 2️⃣ View
struct CounterView: View {
    // Store를 통해 State를 읽고 Action을 보냄
    let store: StoreOf<CounterFeature>
    
    var body: some View {
        VStack(spacing: 20) {
            Text("카운트: \(store.count)")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack(spacing: 20) {
                Button("-") {
                    store.send(.decrementButtonTapped)  // Action 전송
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                
                Button("+") {
                    store.send(.incrementButtonTapped)
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
            }
            .font(.title)
            
            Button("초기화") {
                store.send(.resetButtonTapped)
            }
            .foregroundColor(.gray)
        }
    }
}

