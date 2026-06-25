//
//  SliderPractice.swift
//  SwiftUI_Practice_2026
//
//  Created by 허성필 on 6/11/26.
//

import SwiftUI

struct SliderView: View {
    @State var grade: Double = 0
    
    var body: some View {
        Slider(value: $grade, in: 0...100, step: 1)
        Text("Your grade is \(grade)")
        
    }
}
