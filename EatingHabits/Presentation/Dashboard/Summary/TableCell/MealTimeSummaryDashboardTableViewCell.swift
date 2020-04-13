//
//  MealTimeSummaryDashboardTableViewCell.swift
//  EatingHabits
//
//  Created by Arif Luthfiansyah on 12/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import UIKit

class MealTimeSummaryDashboardTableViewCell: UITableViewCell {
    static let identifier = String(describing: MealTimeSummaryDashboardTableViewCell.self)
    static let height = CGFloat(80)
    
    @IBOutlet weak var mealTimeCategoryLabel: UILabel!
    @IBOutlet weak var mealTimeProgressView: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mealTimeCategoryLabel.textColor = .white
        
        self.mealTimeProgressView.clipsToBounds = true
        self.mealTimeProgressView.layer.cornerRadius = 8
    }
    
}
