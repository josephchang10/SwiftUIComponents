//
//  ExamplesApp.swift
//  Examples
//
//  Created by Jiafu Zhang on 4/4/24.
//

import SwiftUI
import SwiftUIComponents

@main
struct ExamplesApp: App {
    var body: some Scene {
        WindowGroup {
//            SwiftUIComponentsMobileView()
            ScrollView {
                InspectorDetailView()
            }
        }
        .windowResizability(.contentSize)
    }
}
