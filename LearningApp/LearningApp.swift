//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Fred Javalera on 4/4/21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
              .environmentObject(ContentModel())
        }
    }
}
