//
//  SessionPagingView.swift
//  HealingUp-Watch WatchKit Extension
//
//  Created by Muhammad Rifki Widadi on 03/08/22.
//

import SwiftUI
import WatchKit

struct SessionPagingView: View {
  @Environment(\.isLuminanceReduced) var isLuminanceReduced
  @EnvironmentObject var workoutManager: WorkoutManager

  @State private var selection: Tab = .metrics

 

  enum Tab {
    case control, metrics, nowPlaying
  }
    var body: some View {
      TabView(selection: $selection) {
        ControlsView()
          .tag(Tab.control)
        MetricsView()
          .tag(Tab.metrics)
        NowPlayingView()
          .tag(Tab.nowPlaying)
      }
      .navigationTitle(workoutManager.selectedWorkout?.name ?? "")
      .navigationBarBackButtonHidden(true)
      .navigationBarHidden(selection == .nowPlaying)
      .onChange(of: workoutManager.running) { _ in
        displayMetricView()
      }
      .tabViewStyle(
        PageTabViewStyle(indexDisplayMode: isLuminanceReduced ? .never : .automatic)
      )
      .onChange(of: isLuminanceReduced) { _ in
        displayMetricView()
      }
    }

  private func displayMetricView() {
    withAnimation {
      selection = .metrics
    }
  }
}

struct SessionPagingView_Previews: PreviewProvider {
    static var previews: some View {
        SessionPagingView()
    }
}
