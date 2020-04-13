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
    @IBOutlet weak var mealTimePrecentageLabel: UILabel!
    @IBOutlet weak var mealTimeProgressView: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mealTimeCategoryLabel.textColor = .white
        self.mealTimePrecentageLabel.textColor = .white
        
        self.mealTimeProgressView.clipsToBounds = true
        self.mealTimeProgressView.layer.cornerRadius = 8
    }
    
    func fill(category: MealTime.Category) {
        self.mealTimeCategoryLabel.text = category.rawValue.uppercased()
        
        switch category {
        case .breakfast:
            self.mealTimeProgressView.progressTintColor = #colorLiteral(red: 0.7394883037, green: 0.7658458948, blue: 0.6101393104, alpha: 1)
            self.mealTimeProgressView.trackTintColor = #colorLiteral(red: 0.8797559142, green: 0.8918254972, blue: 0.8252573609, alpha: 1)
            self.mealTimeProgressView.setProgress(0.3, animated: false)
            let precentage = Int(floor(0.3 * 100))
            self.mealTimePrecentageLabel.text = "\(precentage)%"
            self.mealTimePrecentageLabel.textColor = precentage < 80 ? #colorLiteral(red: 0.7394883037, green: 0.7658458948, blue: 0.6101393104, alpha: 1) : .white
            break
        case .lunch:
            self.mealTimeProgressView.progressTintColor = #colorLiteral(red: 0.7850264907, green: 0.6429313421, blue: 0.1988815069, alpha: 1)
            self.mealTimeProgressView.trackTintColor = #colorLiteral(red: 0.9250270724, green: 0.8752136827, blue: 0.7381495237, alpha: 1)
            self.mealTimeProgressView.setProgress(0.7, animated: false)
            let precentage = Int(floor(0.7 * 100))
            self.mealTimePrecentageLabel.text = "\(precentage)%"
            self.mealTimePrecentageLabel.textColor = precentage < 80 ? #colorLiteral(red: 0.7850264907, green: 0.6429313421, blue: 0.1988815069, alpha: 1) : .white
            break
        case .dinner:
            self.mealTimeProgressView.progressTintColor = #colorLiteral(red: 0.2259257734, green: 0.2297824919, blue: 0.01898552291, alpha: 1)
            self.mealTimeProgressView.trackTintColor = #colorLiteral(red: 0.7285962701, green: 0.730622828, blue: 0.6686168909, alpha: 1)
            self.mealTimeProgressView.setProgress(1, animated: false)
            let precentage = Int(floor(1 * 100))
            self.mealTimePrecentageLabel.text = "\(precentage)%"
            self.mealTimePrecentageLabel.textColor = precentage < 80 ? #colorLiteral(red: 0.2259257734, green: 0.2297824919, blue: 0.01898552291, alpha: 1) : .white
            break
        default:
            break
        }
    }
    
}
