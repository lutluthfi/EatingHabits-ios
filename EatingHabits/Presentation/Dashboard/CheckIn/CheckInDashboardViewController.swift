//
//  CheckInDashboardViewController.swift
//  EatingHabits
//
//  Created by Arif Luthfiansyah on 12/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import UIKit

class CheckInDashboardViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var checkInButton: UIButton!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var currentTimeVisualEffectView: UIVisualEffectView!
    @IBOutlet weak var loadingIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var mealTimeBackgroundImageView: UIImageView!
    @IBOutlet weak var quotesLabel: UILabel!
    
    lazy var imagePickerController: UIImagePickerController = {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .camera
        return controller
    }()
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        return dateFormatter
    }()
    
    private let dispatchTimerSource = DispatchSource.makeTimerSource()
    private let backgroundImages: [UIImage] = [ #imageLiteral(resourceName: "ImageCheckInBackgroundLunch") , #imageLiteral(resourceName: "ImageCheckInBackgroundBreakfast") ]
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? CaptureCheckInDashboardViewController {
            if let capturedImage = sender as? UIImage {
                destinationViewController.capturedImage = capturedImage
            }
        }
    }
    
    @IBAction func onCheckInButtonTouchUpInside(_ sender: UIButton) {
        self.present(self.imagePickerController, animated: true) { }
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
            self.onObserveScheduledTimer()
        }
    }
    
    private func onObserveScheduledTimer() {
        self.currentTimeLabel.isHidden = false
        self.quotesLabel.isHidden = false
        self.loadingIndicatorView.stopAnimating()
        
        self.currentTimeLabel.text = self.dateFormatter.string(from: Date())
        
        let currentTime = self.dateFormatter.date(from: self.currentTimeLabel.text!)!
        
        if currentTime > MealTime.Constant.breakfastStartTime && currentTime < MealTime.Constant.breakfastEndTime {
            self.quotesLabel.text = "Breakfast could be your energy to start your daily activity"
        } else if currentTime > MealTime.Constant.lunchStartTime && currentTime < MealTime.Constant.lunchEndTime {
            self.quotesLabel.text = "Go for your lunch"
        } else if currentTime > MealTime.Constant.dinnerStartTime && currentTime < MealTime.Constant.dinnerEndTime {
            self.quotesLabel.text = "Have dinner before you sleep"
        } else {
            self.quotesLabel.text = "Keep consistent is the key"
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true) { }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true) { }
        guard let capturedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        self.performSegue(withIdentifier: "CapturedCheckInDashboardViewController", sender: capturedImage)
//        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage

    }
    
}

