//
//  CounterFeature.swift
//  SwiftUI_Practice_2026
//
//  Created by 허성필 on 6/26/26.
//

import ComposableArchitecture
import SwiftUI

// 1️⃣ Feature 정의 (State + Action + Reducer를 한 곳에)
@Reducer
struct CounterFeature {
    
    // State: 화면에 필요한 데이터
    @ObservableState
    struct State: Equatable {
        var count = 0
        var isTimerRunning = false
    }
    
    // Action: 사용자가 할 수 있는 행동들
    enum Action {
        case incrementButtonTapped
        case decrementButtonTapped
        case resetButtonTapped
    }
    
    // Reducer: Action → State 변환 로직
    var body: Reduce<State, Action> {
        Reduce { state, action in
            switch action {
            case .incrementButtonTapped:
                state.count += 1
                return .none  // 추가 Effect 없음
                
            case .decrementButtonTapped:
                state.count -= 1
                return .none
                
            case .resetButtonTapped:
                state.count = 0
                return .none
            }
        }
    }
}
