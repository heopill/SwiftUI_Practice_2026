//
//  GridPractice.swift
//  SwiftUI_Practice_2026
//
//  Created by 허성필 on 6/15/26.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("일반 Grid 레이아웃 연습")
                .font(.title.bold())
            
            // 1. Grid 선언 (가로, 세로 간격 설정)
            Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                
                // [1번째 줄] 하나의 뷰가 3칸을 다 차지하도록 병합
                GridRow {
                    Text("👑 메인 배너 (3칸 병합)")
                        .font(.headline)
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .gridCellColumns(3) // ⭐ 중요: 3개의 열을 하나로 합칩니다!
                }
                
                // [2번째 줄] 기본 3칸짜리 표준 격자
                GridRow {
                    BoxView(text: "매출 현황", color: .orange)
                    BoxView(text: "방문자수", color: .green)
                    BoxView(text: "트래픽", color: .purple)
                }
                
                // [3번째 줄] 2칸 병합 + 1칸짜리 조합
                GridRow {
                    BoxView(text: "실시간 알림창 (2칸 병합)", color: .teal)
                        .gridCellColumns(2) // ⭐ 2칸 합치기
                    
                    BoxView(text: "설정", color: .gray)
                }
                
                // 💡 GridRow 없이 그냥 선언하면?
                // Grid 내부에서 자동으로 모든 열(3칸)을 가로지르는 구분선이 됩니다.
                Divider()
                    .background(Color.red)
                    .padding(.vertical, 5)
                
                // [4번째 줄] 1칸짜리 + 2칸 병합 조합 (반대 배정)
                GridRow {
                    BoxView(text: "Q&A", color: .indigo)
                    
                    BoxView(text: "고객센터 공지사항 (2칸 병합)", color: .pink)
                        .gridCellColumns(2) // ⭐ 2칸 합치기
                }
            }
            .padding()
            .background(Color(.systemGray6)) // 격자가 잘 보이도록 배경색 지정
            .cornerRadius(16)
            .padding()
            
            Spacer()
        }
    }
}

// 각 격자 칸을 채워줄 공통 컴포넌트 뷰
struct BoxView: View {
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .font(.subheadline.bold())
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding()
            .frame(maxWidth: .infinity, minHeight: 90) // 가로 폭을 꽉 채우도록 설정
            .background(color)
            .cornerRadius(12)
    }
}
