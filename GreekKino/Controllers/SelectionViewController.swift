//
//  SelectionViewController.swift
//  GreekKino
//
//  Created by Nemanja Ducic on 1/13/21.
//

import Foundation
import UIKit
class SelectionViewController:UIViewController {
    @IBOutlet weak var talonButton: UIButton!
    @IBOutlet weak var resaultsButton: UIButton!
    @IBOutlet weak var drawButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    @IBAction func talonButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let talonVC = storyboard.instantiateViewController(identifier: "talonVC")
        show(talonVC, sender: self)
    }
    @IBAction func resaultButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let toResaults = storyboard.instantiateViewController(identifier: "toResaults")
        show(toResaults, sender: self)
    }
    @IBAction func drawButtonPressed(_ sender: Any) {
    }
    func setup(){
        talonButton.tintColor = .white
        drawButton.tintColor = .white
        resaultsButton.tintColor = .white
        talonButton.backgroundColor = .gray
        resaultsButton.backgroundColor = .gray
        drawButton.backgroundColor = .gray
        talonButton.layer.borderWidth = 5
        resaultsButton.layer.borderWidth = 5
        drawButton.layer.borderWidth = 5
        talonButton.layer.borderColor = .init(red: 0, green: 0, blue: 255, alpha: 0)
        resaultsButton.layer.borderColor = .init(red: 0, green: 0, blue: 255, alpha: 0)
        drawButton.layer.borderColor = .init(red: 0, green: 0, blue: 255, alpha: 0)
        
    }
}

