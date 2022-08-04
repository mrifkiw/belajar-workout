//
//  ControlsView.swift
//  belajar-workout WatchKit Extension
//
//  Created by Muhammad Rifki Widadi on 03/08/22.
//

import SwiftUI

struct ControlsView: View {
  @EnvironmentObject var workoutManager: WorkoutManager

  var body: some View {
    HStack {
      VStack {
        Button {
          workoutManager.endWorkout()
        } label: {
          Image(systemName: "xmark")
        }
        .tint(.red)
        .font(.title2)
        Text("End")

      }
      VStack {
        Button {
          workoutManager.togglePause()
        } label: {
          Image(systemName: workoutManager.running ? "pause" : "play")
        }
        .tint(.yellow)
        .font(.title2)
        Text(workoutManager.running ? "Pause" : "Resume")
      }
    }
  }
}

struct ControlsView_Previews: PreviewProvider {
  static var previews: some View {
    ControlsView()
  }
}