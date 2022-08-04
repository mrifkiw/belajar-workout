//
//  SummaryView.swift
//  belajar-workout WatchKit Extension
//
//  Created by Muhammad Rifki Widadi on 03/08/22.
//

import SwiftUI
import HealthKit

struct SummaryView: View {
  @EnvironmentObject var workoutManager: WorkoutManager
  @Environment(\.dismiss) var dismiss
  @State private var durationFormatter: DateComponentsFormatter = {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second]
    formatter.zeroFormattingBehavior = .pad
    return formatter
  }()

  var body: some View {
    if workoutManager.workout == nil {
      ProgressView("Saving Workout")
        .navigationBarHidden(true)
    } else {
      ScrollView {
        VStack(alignment: .leading) {
          SummaryMetricView(
            title: "Total time",
            value: durationFormatter.string(from: workoutManager.workout?.duration ?? 0.0) ?? "",
            color: .yellow
          )

          SummaryMetricView(
            title: "Total Distance",
            value: Measurement(
              value: workoutManager.workout?.totalDistance?.doubleValue(for: .meter()) ?? 0,
              unit: UnitLength.meters
            ).formatted(
              .measurement(
                width: .abbreviated,
                usage: .road
              )
            ),
            color: .green
          )

          SummaryMetricView(
            title: "Total Energy",
            value: Measurement(
              value: workoutManager.workout?.totalEnergyBurned?.doubleValue(for: .kilocalorie()) ?? 0,
              unit: UnitEnergy.kilocalories
            ).formatted(
              .measurement(
                width: .abbreviated,
                usage: .workout
              )
            ),
            color: .pink
          )

          SummaryMetricView(
            title: "Avg. Heart Rate",
            value: workoutManager.avgHR
              .formatted(.number.precision(.fractionLength(0))) + " bpm",
            color: .pink
          )

          Text("Activity Rings")
          ActivityRingsView(healthStore: workoutManager.healthStore)
            .frame(width: 50, height: 50)

          Button("Done") {
            dismiss()
          }


        }
        .scenePadding()
      }
      .navigationTitle("Summary")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct SummaryView_Previews: PreviewProvider {
  static var previews: some View {
    SummaryView()
  }
}

