//
//  ViewPractice.swift
//  SwiftUI_Practice_2026
//
//  Created by 허성필 on 6/13/26.
//

import SwiftUI

struct ViewPracticeView : View {
    var body: some View {
        if Bool.random() {
            Image(systemName: "apple")
        } else {
            Text("Apple")
        }
    }
}

#Preview {
    ViewPracticeView()
}
