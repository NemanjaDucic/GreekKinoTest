////
////  ResaultsViewController.swift
////  GreekKino
////
////  Created by Aca on 13/01/2021.
////
//
//import Foundation
//import UIKit
//class ResaultsViewController:UIViewController,UITableViewDelegate,UITableViewDataSource{
//    
//    @IBOutlet weak var resaultTable: UITableView!
//    
//    var model = ResaultData(drawId:)
//    var data: [ResaultData]?
//    var numbers: [Int] = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setup()
//      model.delegate = self
//       model.dataRes()
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = resaultTable.dequeueReusableCell(withIdentifier: "res") as! ResaultsCell
//        cell.resaultLabel.text = String(numbers[indexPath.row])
//        return cell
//        
//        
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let data = model.data {
//            return data.count
//        } else {
//            return 0
//        }
//    }
//    
//    func setup(){
//        resaultTable.dataSource = self
//        resaultTable.delegate = self
//        
//    }
//}
//extension ResaultsViewController :ResaultDataDelegate {
//    func dataRes() {
//        model.dataRes
//    }
//    
//}
