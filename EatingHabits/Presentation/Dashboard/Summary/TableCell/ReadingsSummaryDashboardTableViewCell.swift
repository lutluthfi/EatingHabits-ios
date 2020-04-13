//
//  ReadingsSummaryDashboardTableViewCell.swift
//  EatingHabits
//
//  Created by Arif Luthfiansyah on 13/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import UIKit

class ReadingsSummaryDashboardTableViewCell: UITableViewCell {
    static let identifier = String(describing: ReadingsSummaryDashboardTableViewCell.self)
    static let height = CGFloat(252)
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var contentContainerView: UIView!
    @IBOutlet weak var titleContainerView: UIVisualEffectView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundImageView.clipsToBounds = true
        self.backgroundImageView.layer.cornerRadius = 8
        
        self.contentContainerView.clipsToBounds = true
        self.contentContainerView.layer.cornerRadius = 8
        
        self.titleContainerView.clipsToBounds = true
        self.titleContainerView.layer.cornerRadius = 8
    }

}
