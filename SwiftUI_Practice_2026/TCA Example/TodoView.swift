//
//  TodoView.swift
//  SwiftUI_Practice_2026
//
//  Created by 허성필 on 6/26/26.
//

import SwiftUI
import ComposableArchitecture

struct TodoView: View {
    let store: StoreOf<TodoFeature>
    
    var body: some View {
        NavigationStack {
            VStack {
                // 입력창
                HStack {
                    TextField("새 할 일 입력", text: Binding(
                        get: { store.newTodoText },
                        set: { store.send(.textChanged($0)) }
                    ))
                    .textFieldStyle(.roundedBorder)
                    
                    Button("추가") {
                        store.send(.addTodo)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                
                // 목록
                List(store.todos) { todo in
                    HStack {
                        Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(todo.isCompleted ? .green : .gray)
                            .onTapGesture { store.send(.toggleTodo(todo.id)) }
                        
                        Text(todo.title)
                            .strikethrough(todo.isCompleted)
                            .foregroundColor(todo.isCompleted ? .gray : .primary)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            store.send(.deleteTodo(todo.id))
                        } label: {
                            Label("삭제", systemImage: "trash")
                        }
                    }
                }
            }
            .navigationTitle("할 일 목록")
        }
    }
}
