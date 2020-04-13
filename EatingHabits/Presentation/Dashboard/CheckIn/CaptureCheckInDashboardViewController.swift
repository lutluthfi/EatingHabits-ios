//
//  CaptureCheckInDashboardViewController.swift
//  EatingHabits
//
//  Created by Arif Luthfiansyah on 13/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import UIKit

struct CaptureCheckInDashboardViewControllerRequestValue {
    let capturedImage: UIImage
    let category: MealTime.Category
    let checkInDateTime: Date
}

protocol CaptureCheckInDashboardViewControllerDelegate: class {
    func captureCheckInDashboardDidSuccess(_ viewController: UIViewController)
    func captureCheckInDashboardDidFailure(_ viewController: UIViewController)
}

class CaptureCheckInDashboardViewController: UIViewController {

    @IBOutlet weak var mealTimeCategoryButton: UIButton!
    @IBOutlet weak var capturedImageView: UIImageView!
    
    lazy var mealTimeStorage: MealTimeStorage? = {
        return (UIApplication.shared.delegate as? AppDelegate)?.mealTimeStorage
    }()
    
    weak var delegate: CaptureCheckInDashboardViewControllerDelegate?
    var requestValue: CaptureCheckInDashboardViewControllerRequestValue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mealTimeCategoryButton.isEnabled = false
        self.mealTimeCategoryButton.clipsToBounds = true
        self.mealTimeCategoryButton.layer.cornerRadius = 8
        
        let mealTimeCategoryButtonTitle = "#\(self.requestValue.category.rawValue.uppercased())"
        self.mealTimeCategoryButton.setTitle(mealTimeCategoryButtonTitle, for: .normal)
        self.capturedImageView.image = self.requestValue.capturedImage
    }
    
    @IBAction func onDoneBarButtonItemTapped(_ sender: UIBarButtonItem) {
        let mealTime = MealTime(category: self.requestValue.category, checkInDateTime: self.requestValue.checkInDateTime, id: UUID(), imageEncodedString: self.requestValue.capturedImage.jpegData(compressionQuality: 0.75)?.base64EncodedString())
        self.mealTimeStorage?.storeMealTime(mealTime: mealTime, completion: { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self.delegate?.captureCheckInDashboardDidSuccess(self)
                }
                break
            case .failure(_):
                DispatchQueue.main.async {
                    self.delegate?.captureCheckInDashboardDidFailure(self)
                }
                break
            }
        })
    }
    
}
