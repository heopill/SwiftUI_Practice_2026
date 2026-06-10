//
//  ContentView.swift
//  SwiftUI_Practice_2026
//
//  Created by 허성필 on 6/9/26.
//

import SwiftUI

struct ContentView: View {
    @State var showGreeting = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $showGreeting){
                Text("Welcome")
            }.padding()
            
            if showGreeting {
                Text("Hello, World!")
            }
        }
    }
}

#Preview("iPhone 17 Pro") {
    ContentView()
}
