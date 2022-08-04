//
//  ElapseTimeView.swift
//  belajar-workout WatchKit Extension
//
//  Created by Muhammad Rifki Widadi on 03/08/22.
//

import SwiftUI

struct ElapsedTimeView: View {
  var elapsedTime: TimeInterval = 0
  var showSubseconds: Bool = true

  @State private var timeFormatter = ElapsedTimeFormatter()

  var body: some View {
    Text(
      NSNumber(value: elapsedTime),
      formatter: timeFormatter
    )
    .fontWeight(.semibold)
    .onChange(of: showSubseconds) {
      timeFormatter.showSubseconds = $0
    }
  }
}

class ElapsedTimeFormatter: Formatter {

  // MARK: CUSTOM FORMATTER
  let componentsFormatter: DateComponentsFormatter = {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.minute, .second]
    formatter.zeroFormattingBehavior = .pad

    return formatter
  }() // Custom Formatter, show minute & second, subseconds are hsown
  var showSubseconds = true

  override func string(for value: Any?) -> String? {
    guard let time = value as? TimeInterval else {
      return nil
    }

    guard let formattedString = componentsFormatter.string(from: time) else {
      return nil
    }

    if showSubseconds {
      // Calculate subseconds
      let hundredths = Int((time.truncatingRemainder(dividingBy: 1)) * 100)
      let decimalSeparator = Locale.current.decimalSeparator ?? "."
      return String(format: "%@%@%0.2d", formattedString, decimalSeparator, hundredths)
    }

    return formattedString
  }

}

struct ElapsedTimeView_Previews: PreviewProvider {
  static var previews: some View {
    ElapsedTimeView()
  }
}
