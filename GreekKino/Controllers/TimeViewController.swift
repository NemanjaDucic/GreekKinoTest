//
//  ViewController.swift
//  GreekKino
//
//  Created by Nemanja Ducic on 1/11/21.
//

import UIKit

class TimeViewController: UIViewController {
    
    @IBOutlet weak var TimeTableView: UITableView!
    
    var model = DrawDataModel()
    var data: [DrawData]?
    
    var countdownTimers: [(index: Int, createdAt: TimeInterval, duration: TimeInterval)] = []
    
    var firstDraw: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        
        model.getData()
        tableViewSetup()
        navigationController?.navigationBar.barTintColor = .systemYellow
        
    }
    
    func tableViewSetup() {
        TimeTableView.delegate = self
        TimeTableView.dataSource = self
        
        let nib = UINib(nibName: "TimeCell", bundle: nil)
        TimeTableView.register(nib, forCellReuseIdentifier: "TimeCell")
    }
    
    func dateConverter(numerical: Int) -> (String, Date) {
        let date = Date.init(milliseconds: numerical)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let fullDateString = formatter.string(from: date)
        
        let hmsDate = formatter.date(from: fullDateString)
        formatter.dateFormat = "HH:mm:ss"
        let hmsString = formatter.string(from: hmsDate!)
        
        return (hmsString, hmsDate!)
    }

    func datePlusFiveMinutes(date: Date) -> Date {
        let addedTime = date.adding(minutes: 5)
        
        return addedTime
    }
}

extension TimeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TimeTableView.dequeueReusableCell(withIdentifier: "TimeCell") as! TimeCell
        cell.countdownCompleteDelegate = self
        if let data = model.data {
            if indexPath.row == 0 {
                firstDraw = Date(milliseconds: data[indexPath.row].drawTime)
            }

            let time = dateConverter(numerical: data[indexPath.row].drawTime)
            let datePlusFive = datePlusFiveMinutes(date: time.1)
            let diff = datePlusFive - firstDraw!
            
            cell.drawTimeLabel.text = time.0
            countdownTimers.append((index: indexPath.row, createdAt: Date().timeIntervalSince1970, duration: diff))
            print(countdownTimers)
            
            cell.configureCell(withCountdownTimer: countdownTimers[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = model.data {
            return data.count
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toSelectionScreen", sender: nil)
    }
}

extension TimeViewController: DrawDataDelegate {
    func dataDrew() {
        TimeTableView.reloadData()
    }
}

extension TimeViewController: TimeCellDelegate {
    func countdownHasFinished(atIndex index: Int) {
        self.countdownTimers.removeAll()
        model.getData()
    }
}

