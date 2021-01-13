//
//  Double+Extension.swift
//  GreekKino
//
//  Created by Nemanja Ducic on 1/13/21.
//

import Foundation

extension Double {
    func timeRemainingFormatted() -> String {
        let duration = TimeInterval(self)
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [ .hour, .minute, .second ]
        formatter.zeroFormattingBehavior = [ .pad ]
        return formatter.string(from: duration) ?? ""
    }
}
