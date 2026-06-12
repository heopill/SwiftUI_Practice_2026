//
//  PickerPractice.swift
//  SwiftUI_Practice_2026
//
//  Created by 허성필 on 6/12/26.
//

import SwiftUI

struct PickerView: View {
    var colors = ["Red", "Green", "Orange", "Blue"]
    @State var selectedColor = 0
    
    var body: some View {
        VStack {
            Picker(selection: $selectedColor, label: Text("Choose a color")) {
                ForEach(0 ..< colors.count, id: \.self) {
                    Text(self.colors[$0])
                }
            }
            .pickerStyle(.menu)
            Text("You selected \(colors[selectedColor])")
        }
    }
}
