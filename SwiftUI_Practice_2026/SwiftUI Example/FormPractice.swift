//
//  FormPractice.swift
//  SwiftUI_Practice_2026
//
//  Created by 허성필 on 6/18/26.
//

import SwiftUI

struct FormView: View {
    // 입력 데이터를 저장할 상태 변수들
    @State private var username: String = ""
    @State private var isPushNotificationEnabled: Bool = true
    @State private var selectedTheme: String = "시스템 설정"
    
    let themes = ["시스템 설정", "라이트 모드", "다크 모드"]
    
    var body: some View {
        NavigationStack {
            Form {
                // 첫 번째 섹션: 사용자 정보 입력
                Section(header: Text("개인정보")) {
                    HStack {
                        Text("사용자 이름")
                        Spacer()
                        TextField("이름을 입력하세요", text: $username)
                            .multilineTextAlignment(.trailing) // 우측 정렬
                    }
                }
                
                // 두 번째 섹션: 알림 및 토글 제어
                Section(header: Text("알림 설정")) {
                    Toggle("푸시 알림 허용", isOn: $isPushNotificationEnabled)
                        .tint(.blue) // 토글 색상 지정
                }
                
                // 세 번째 섹션: 선택지 피커
                Section(header: Text("화면 설정"), footer: Text("앱의 테마를 변경할 수 있습니다.")) {
                    Picker("테마 선택", selection: $selectedTheme) {
                        ForEach(themes, id: \.self) { theme in
                            Text(theme)
                        }
                    }
                    .pickerStyle(.navigationLink) // 터치 시 다음 화면으로 이동하여 선택하는 스타일
                }
                
                // 네 번째 섹션: 버튼이나 단순 액션
                Section {
                    Button(action: {
                        // 저장 로직 수행
                        print("설정 저장됨: \(username), \(isPushNotificationEnabled), \(selectedTheme)")
                    }) {
                        Text("설정 완료")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(.blue)
                    }
                }
            }
            .navigationTitle("설정")
        }
    }
}
