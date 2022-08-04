//
//  StartView.swift
//  HealingUp-Watch WatchKit Extension
//
//  Created by Muhammad Rifki Widadi on 03/08/22.
//

import SwiftUI
import HealthKit

struct StartView: View {
  @EnvironmentObject var workoutManager: WorkoutManager
  var workoutTypes: [HKWorkoutActivityType] = [.running, .cycling, .walking]

  var body: some View {
    List(workoutTypes) { workoutTypes in
      NavigationLink(
        workoutTypes.name,
        destination: SessionPagingView(),
        tag: workoutTypes,
        selection: $workoutManager.selectedWorkout
      ).padding(
        EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5)
      )
    }
    .listStyle(.carousel)
    .navigationTitle("Workouts")
    .onAppear {
      workoutManager.requestAuthorization()
    }
  }
}

struct StartView_Previews: PreviewProvider {
  static var previews: some View {
    StartView()
  }
}

extension HKWorkoutActivityType: Identifiable {
  public var id: UInt {
    rawValue
  }

  var name: String {
    switch self {
    case .running:
      return "Run"
    case .cycling:
      return "Bike"
    case .walking:
      return "Walk"
    default:
      return ""
    }
  }
}
