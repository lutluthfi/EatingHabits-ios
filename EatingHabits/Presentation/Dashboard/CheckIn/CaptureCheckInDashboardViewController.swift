//
//  CaptureCheckInDashboardViewController.swift
//  EatingHabits
//
//  Created by Arif Luthfiansyah on 13/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import UIKit

protocol CaptureCheckInDashboardViewControllerDelegate: class {
    func captureCheckInDashboardDidDone()
}

class CaptureCheckInDashboardViewController: UIViewController {

    @IBOutlet weak var mealTimeCategoryButton: UIButton!
    @IBOutlet weak var capturedImageView: UIImageView!
    
    weak var delegate: CaptureCheckInDashboardViewControllerDelegate?
    var capturedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mealTimeCategoryButton.clipsToBounds = true
        self.mealTimeCategoryButton.layer.cornerRadius = 8
        self.capturedImageView.image = self.capturedImage
    }
    
    @IBAction func onDoneBarButtonItemTapped(_ sender: UIBarButtonItem) {
        self.delegate?.captureCheckInDashboardDidDone()
    }
    
}
