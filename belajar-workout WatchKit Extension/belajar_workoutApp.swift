//
//  belajar_workoutApp.swift
//  belajar-workout WatchKit Extension
//
//  Created by Muhammad Rifki Widadi on 03/08/22.
//

import SwiftUI

@main
struct belajar_workoutApp: App {

  @StateObject var workoutManager = WorkoutManager()

  @SceneBuilder var body: some Scene {
    WindowGroup {
      NavigationView {
        StartView()
      }
      .sheet(isPresented: $workoutManager.showingSummaryView) {
        SummaryView()
      }
      .environmentObject(workoutManager)
    }

    WKNotificationScene(controller: NotificationController.self, category: "myCategory")
  }
}
