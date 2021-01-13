//
//  NumbersCell.swift
//  GreekKino
//
//  Created by Nemanja Ducic on 1/12/21.
//

import UIKit

class NumbersCell: UICollectionViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        numberLabel.textColor = .white
    }

}
