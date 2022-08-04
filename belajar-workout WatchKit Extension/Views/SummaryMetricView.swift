//
//  SummaryMetricView.swift
//  belajar-workout WatchKit Extension
//
//  Created by Muhammad Rifki Widadi on 03/08/22.
//

import SwiftUI

struct SummaryMetricView: View {
  var title: String
  var value: String
  var color: Color

  var body: some View {
      Text(title)
      Text(value)
        .font(.system(.title2, design: .rounded).lowercaseSmallCaps())
        .foregroundColor(color)
      Divider()
  }
}

struct SummaryMetricView_Previews: PreviewProvider {
  static var previews: some View {
    SummaryMetricView(title: "Hearth rate", value: "80", color: .yellow)
  }
}
