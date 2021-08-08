//
//  OverviewCollectionViewCell.swift
//  Horse Racing
//
//  Created on 08/08/2021.
//

import UIKit

class OverviewCollectionViewCell: UICollectionViewCell, ReuseIdentifiable {
    @IBOutlet weak var titleLabel: UILabel!
    
    func configureWith(title: String) {
        titleLabel.text = title
    }
}
