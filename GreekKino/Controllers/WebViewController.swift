//
//  WebViewController.swift
//  GreekKino
//
//  Created by Nemanja Ducic on 1/12/21.
//

import Foundation
import UIKit
import WebKit


class WebViewController :UIViewController,WKUIDelegate {
    @IBOutlet weak var gameView: WKWebView!
    @IBOutlet weak var chosenNumbersLabel: UILabel!
    var numbers = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        chosenNumbersLabel.text = NumbersViewController.choosenNumbers
    }
   
    func setup(){
        let request = URLRequest(url: URL(string: "https://ds.opap.gr/web_kino/kinoIframe.html?link=https://ds.opap.gr/web_kino/kino/html/Internet_PRODUCTION/KinoDraw_201910.html&resolution=847x500")!)
        gameView.load(request)
        gameView.frame = .zero
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
