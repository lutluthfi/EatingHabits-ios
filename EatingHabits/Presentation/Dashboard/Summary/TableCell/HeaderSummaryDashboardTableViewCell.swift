//
//  HeaderSummaryDashboardTableViewCell.swift
//  EatingHabits
//
//  Created by Arif Luthfiansyah on 12/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import UIKit

class HeaderSummaryDashboardTableViewCell: UITableViewCell {
    static let identifier = String(describing: HeaderSummaryDashboardTableViewCell.self)
    static let height = CGFloat(136)
    
    @IBOutlet weak var trackedDaysContainerView: UIVisualEffectView!
    @IBOutlet weak var trackedDaysCounterLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.trackedDaysContainerView.clipsToBounds = true
        self.trackedDaysContainerView.layer.cornerRadius = 8
    }
    
    func fill() {
        let trackedDaysCounter = "33/66 days"
        let trackedDaysCounterAttributedString = NSMutableAttributedString(string: trackedDaysCounter)
        trackedDaysCounterAttributedString.setAttributes([ NSAttributedString.Key.font : UIFont.systemFont(ofSize: 22, weight: .bold) ], range: .init(0..<2))
        self.trackedDaysCounterLabel.attributedText = trackedDaysCounterAttributedString
    }
    
}
