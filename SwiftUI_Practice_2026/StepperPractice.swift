//
//  StepperPractice.swift
//  SwiftUI_Practice_2026
//
//  Created by 허성필 on 6/11/26.
//

import SwiftUI

struct StepperView: View {
    @State var age = 22
    
    var body: some View {
        Stepper("Enter your age", value: $age, in: 0...130)
        Text("Your age is \(age)")
    }
}
