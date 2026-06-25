//
//  TodoFeature.swift
//  SwiftUI_Practice_2026
//
//  Created by 허성필 on 6/26/26.
//

import ComposableArchitecture
import Foundation

@Reducer
struct TodoFeature {
    @ObservableState
    struct State: Equatable {
        var todos: [Todo] = []
        var newTodoText = ""
    }
    
    struct Todo: Equatable, Identifiable {
        let id: UUID
        var title: String
        var isCompleted: Bool
    }
    
    enum Action {
        case textChanged(String)     // 입력 변경
        case addTodo               // 추가 버튼
        case toggleTodo(UUID)      // 완료 체크
        case deleteTodo(UUID)      // 삭제
    }
    
    var body: Reduce<State, Action> {
        Reduce { state, action in
            switch action {
            case .textChanged(let text):
                state.newTodoText = text
                return .none
                
            case .addTodo:
                guard !state.newTodoText.isEmpty else { return .none }
                state.todos.append(
                    Todo(id: UUID(), title: state.newTodoText, isCompleted: false)
                )
                state.newTodoText = ""
                return .none
                
            case .toggleTodo(let id):
                if let index = state.todos.firstIndex(where: { $0.id == id }) {
                    state.todos[index].isCompleted.toggle()
                }
                return .none
                
            case .deleteTodo(let id):
                state.todos.removeAll { $0.id == id }
                return .none
            }
        }
    }
}
