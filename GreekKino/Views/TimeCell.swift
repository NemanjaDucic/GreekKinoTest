//
//  TimeCell.swift
//  GreekKino
//
//  Created by Nemanja Ducic on 1/11/21.
//

import UIKit

protocol TimeCellDelegate {
    func countdownHasFinished(atIndex index: Int)
}

class TimeCell: UITableViewCell {
    
    @IBOutlet weak var drawTimeLabel: UILabel!
    @IBOutlet weak var drawCountdownLabel: UILabel!
    
    var timer: Timer?
    var countdownCompleteDelegate: TimeCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func prepareForReuse() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func calculateTimeRemaining(countdownTimer:(index: Int, createdAt: TimeInterval, duration: TimeInterval)) -> Double {
        return Double((countdownTimer.createdAt + countdownTimer.duration) - Date().timeIntervalSince1970)
    }
    
    func configureCell(withCountdownTimer countdownTimer: ( index: Int,
                       createdAt: TimeInterval,
                       duration: TimeInterval)) {
      let timeRemaining = self.calculateTimeRemaining(countdownTimer:
        countdownTimer)
      self.drawCountdownLabel.text = "\(timeRemaining.timeRemainingFormatted())"
      if self.timer == nil {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats:
                                          true) { timer in
          let newTime = self.calculateTimeRemaining(countdownTimer:
          countdownTimer)
          if newTime <= 0 {
        
           self.countdownCompleteDelegate?.countdownHasFinished(atIndex:
           countdownTimer.index)
          
          } else {
            self.drawCountdownLabel.text = newTime.timeRemainingFormatted()
          }
        }
      }
    }
}
