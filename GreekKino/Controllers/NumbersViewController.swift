//
//  NumbersViewController.swift
//  GreekKino
//
//  Created by Nemanja Ducic on 1/12/21.
//

import Foundation
import UIKit

protocol TypingDelegate {
    func data(passedData:String)
}

class NumbersViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    var myDelegate:TypingDelegate? = nil

    @IBOutlet weak var kvotaLabel: UILabel!
    
    @IBOutlet weak var selectedNumbersLabel: UILabel!
    @IBOutlet weak var numbersCollectionView: UICollectionView!
    let vc = WebViewController()
    
    var numbers: [Int] = []
    var selectedNumbers = String()
    
    static var choosenNumbers = ""
    
    override func viewDidLoad() {
        navigationItem.leftBarButtonItem?.title = "fsaf"
        super.viewDidLoad()
        numbersCount()
        collectionViewSetup()
        vc.numbers = selectedNumbers
        quoteCounter()
    }
   
    
    func numbersCount(){
        for number in 1...80 {
            numbers.append(number)
            
        }
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = numbersCollectionView.dequeueReusableCell(withReuseIdentifier: "Numbers", for: indexPath) as! NumbersCell
        cell.numberLabel.text = String(numbers[indexPath.row])
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selected = numbers[indexPath.item]
        let cosmetics = numbersCollectionView.cellForItem(at: indexPath)
        cosmetics?.layer.borderColor = UIColor.red.cgColor
        cosmetics?.layer.borderWidth = 3
        
        selectedNumbers.append("\(selected) ")
        selectedNumbersLabel.text = selectedNumbers
        NumbersViewController.choosenNumbers = selectedNumbers
            quoteCounter()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cosmetics = numbersCollectionView.cellForItem(at: indexPath)
        cosmetics?.layer.borderWidth = 0
        let deselected = numbers[indexPath.item]
        selectedNumbers = selectedNumbers.replacingOccurrences(of: "\(deselected) ", with: "")
        selectedNumbersLabel.text = selectedNumbers
        NumbersViewController.choosenNumbers = selectedNumbers
        quoteCounter()
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return numbers.count
    }
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return numbersCollectionView.indexPathsForSelectedItems?.count ?? 0 <=  14
    }
    
    func collectionViewSetup() {
        numbersCollectionView.allowsMultipleSelection = true
        numbersCollectionView.isUserInteractionEnabled = true
        numbersCollectionView.dataSource = self
        numbersCollectionView.delegate = self
        let nib = UINib(nibName: "NumbersCell", bundle: nil)
        numbersCollectionView.register(nib, forCellWithReuseIdentifier: "Numbers")
    }
    func quoteCounter() {
        let path = selectedNumbers.count
        if path == 3 {
            kvotaLabel.text = "Vasa kvota je : 1.5"
            
    }
    
        if path == 6 {
            kvotaLabel.text = "Vasa kvota je : 3.0"
            
    }
        if path == 9 {
            kvotaLabel.text = "Vasa kvota je : 4.5"
    }
        if path == 12 {
            kvotaLabel.text = "Vasa kvota je : 6.0"
        }
         if path == 15 {
            kvotaLabel.text = "Vasa kvota je : 7.5"
        }
        if path == 18 {
            kvotaLabel.text = "Vasa kvota je : 9.0"
    }
        if path == 21{
            kvotaLabel.text = "Vasa kvota je : 10.5"
    }
        if path == 24 {
            kvotaLabel.text = "Vasa kvota je : 12.0"
    }
        if path == 27 {
            kvotaLabel.text = "Vasa kvota je : 13.5"
    }
        if path == 30 {
            kvotaLabel.text = "Vasa kvota je : 15.0"
    }
        if path == 33 {
            kvotaLabel.text = "Vasa kvota je : 16.5"
    }
        if path == 36 {
            kvotaLabel.text = "Vasa kvota je : 18.0"
    }
        if path == 39 {
            kvotaLabel.text = "Vasa kvota je : 19.5"
    }
        if path == 42 {
            kvotaLabel.text = "Vasa kvota je : 21.0"
    }
        if path == 45 {
            kvotaLabel.text = "Vasa kvota je : 30"
    }
}

}
