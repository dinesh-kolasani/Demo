//
//  HobbiesCollectionViewCell.swift
//  Demo
//
//  Created by Macbook Air on 07/04/21.
//  Copyright © 2021 Dinesh. All rights reserved.
//

import UIKit

class HobbiesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var hobbiesLbl: UILabel!
    @IBOutlet weak var BGview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        BGview.layer.cornerRadius = 10
        BGview.layer.borderWidth = 1
        BGview.layer.borderColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        BGview.clipsToBounds = true
    }

}
