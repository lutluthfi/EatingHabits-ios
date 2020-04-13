//
//  HistoryMealTimeCollectionViewCell.swift
//  EatingHabits
//
//  Created by Arif Luthfiansyah on 14/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import UIKit

class HistoryMealTimeCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: HistoryMealTimeCollectionViewCell.self)
    
    @IBOutlet weak var mealTimeImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        self.mealTimeImageView.image = nil
    }
    
    func fill(with imageEncodedString: String) {
        self.mealTimeImageView.frame = self.contentView.frame
        if let unwrappedData = Data(base64Encoded: imageEncodedString) {
            self.mealTimeImageView.image =  UIImage(data: unwrappedData)
        }
    }
    
}
