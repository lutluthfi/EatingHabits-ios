//
//  CheckInDashboardViewController.swift
//  EatingHabits
//
//  Created by Arif Luthfiansyah on 12/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import UIKit

class CheckInDashboardViewController: UIViewController {

    @IBOutlet weak var checkInButton: UIButton!
    @IBOutlet weak var currentTimeVisualEffectView: UIVisualEffectView!
    @IBOutlet weak var mealTimeBackgroundImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewDidLoad()
    }
    
    private func setupViewDidLoad() {
        self.checkInButton.clipsToBounds = true
        self.checkInButton.layer.cornerRadius = 8
        
        self.currentTimeVisualEffectView.clipsToBounds = true
        self.currentTimeVisualEffectView.layer.cornerRadius = 8
    }

}
