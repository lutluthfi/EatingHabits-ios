//
//  RecommendationTimeCheckInDashboardViewController.swift
//  EatingHabits
//
//  Created by Arif Luthfiansyah on 12/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import UIKit

class RecommendationTimeCheckInDashboardViewController: UIViewController {

    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewDidLoad()
    }

    @IBAction func onCloseBarButtonItemTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true) { }
    }
    
    private func setupViewDidLoad() {
        let breakfastContent = "BREAKFAST\n\u{2022} Eat within 30 minutes of waking up\n\u{2022} Ideal time to have breakfast is 7 AM\n\u{2022} Do not delay breakfast later than 10 AM\n\u{2022} Make sure you have protein in your breakfast\n\n"
        let breakfastContentAttributedString = NSMutableAttributedString(string: breakfastContent)
        breakfastContentAttributedString.setAttributes([ NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .semibold) ], range: .init(0..<9))
        
        let lunchContent = "LUNCH\n\u{2022} Ideal time to have lunch is 12.45pm\n\u{2022} Try and keep a gap of 4 hours between your breakfast and lunch\n\u{2022} Do not delay lunch later than 4 PM\n\n"
        let lunchContentAttributedString = NSMutableAttributedString(string: lunchContent)
        lunchContentAttributedString.setAttributes([ NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .semibold) ], range: .init(0..<5))
        
        let dinnerContent = "DINNER\n\u{2022} The ideal time to have dinner is before 7 PM\n\u{2022} You should keep a gap of 3 hours between your dinner and bedtime\n\u{2022} Do not delay dinner later than 10 PM\n\u{2022} Eating close to bedtime can interfere with the quality of sleep"
        let dinnerContentAttributedString = NSMutableAttributedString(string: dinnerContent)
        dinnerContentAttributedString.setAttributes([ NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .semibold) ], range: .init(0..<6))
        
        let contentAttributedString = NSMutableAttributedString()
        contentAttributedString.append(breakfastContentAttributedString)
        contentAttributedString.append(lunchContentAttributedString)
        contentAttributedString.append(dinnerContentAttributedString)
        
        self.contentLabel.attributedText = contentAttributedString
    }
}
