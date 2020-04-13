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
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var currentTimeVisualEffectView: UIVisualEffectView!
    @IBOutlet weak var mealTimeBackgroundImageView: UIImageView!
    @IBOutlet weak var quotesLabel: UILabel!
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        return dateFormatter
    }()
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewDidLoad()
        self.startTimerScheduler()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer?.invalidate()
    }
    
    @IBAction func onCheckInButtonTouchUpInside(_ sender: UIButton) {
        self.showSuccessCheckIn()
    }
    
    @IBAction func onSeeRecommendationTimeContainerViewTapped(_ sender: UITapGestureRecognizer) {
        
    }
    
    private func setupViewDidLoad() {
        self.checkInButton.clipsToBounds = true
        self.checkInButton.layer.cornerRadius = 8
        
        self.currentTimeVisualEffectView.clipsToBounds = true
        self.currentTimeVisualEffectView.layer.cornerRadius = 16
    }
    
    private func showSuccessCheckIn() {
        let okayAlertAction = UIAlertAction(title: "OK", style: .default) { (_) in }
        let alertViewController = UIAlertController(title: "Success", message: "Don't forget to catch your next meal", preferredStyle: .alert)
        alertViewController.addAction(okayAlertAction)
        self.present(alertViewController, animated: true) { }
    }
    
    private func startTimerScheduler() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            self.onUpdateCurrentTimeLabel()
        }
    }
    
    private func onUpdateCurrentTimeLabel() {
        self.currentTimeLabel.text = self.dateFormatter.string(from: Date())
    }
    
}

