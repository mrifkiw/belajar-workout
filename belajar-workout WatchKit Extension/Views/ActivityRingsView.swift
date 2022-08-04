//
//  ActivityRingsView.swift
//  belajar-workout WatchKit Extension
//
//  Created by Muhammad Rifki Widadi on 03/08/22.
//

import Foundation
import SwiftUI
import HealthKit


struct ActivityRingsView: WKInterfaceObjectRepresentable {

  let healthStore: HKHealthStore

  func makeWKInterfaceObject(context: Context) -> some WKInterfaceObject {
    let activityRingsObject = WKInterfaceActivityRing()

    let calendar = Calendar.current
    var components = calendar.dateComponents([.era, .year, .month, .day], from: Date())

    components.calendar = calendar

    let predicate = HKQuery.predicateForActivitySummary(with: components)

    let query = HKActivitySummaryQuery(predicate: predicate) { query, summaries, error in
      DispatchQueue.main.async {
        activityRingsObject.setActivitySummary(summaries?.first, animated: true)
      }
    }

    healthStore.execute(query)

    return activityRingsObject
  }

  func updateWKInterfaceObject(_ wkInterfaceObject: WKInterfaceObjectType, context: Context) {

  }

}

struct ActivityRingsView_Previews: PreviewProvider {
    static var previews: some View {
      
        ActivityRingsView(
            healthStore: HKHealthStore()
        )

    }
}
