//
//  HeaderHistoryMealTimeCollectionReusableView.swift
//  EatingHabits
//
//  Created by Arif Luthfiansyah on 14/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import UIKit

class HeaderHistoryMealTimeCollectionReusableView: UICollectionReusableView {
    static let identifier = String(describing: HeaderHistoryMealTimeCollectionReusableView.self)
    
    @IBOutlet weak var dateHistoryLabel: UILabel!
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.dateHistoryLabel.text = nil
    }
    
    func fill(with date: Date) {
        self.dateHistoryLabel.text = self.dateFormatter.string(from: date)
    }
    
}
