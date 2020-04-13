//
//  DetailHistoryDashboardViewController.swift
//  EatingHabits
//
//  Created by Arif Luthfiansyah on 14/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import UIKit

struct DetailHistoryDashboardViewControllerRequestValue {
    let previewMealTime: MealTime
}

class DetailHistoryDashboardViewController: UIViewController {
    
    @IBOutlet weak var titleNavigationItem: UINavigationItem!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var categoryButton: UIButton!
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm a"
        return dateFormatter
    }()
    
    var requestValue: DetailHistoryDashboardViewControllerRequestValue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewDidLoad()
    }

    private func setupViewDidLoad() {
        self.categoryButton.clipsToBounds = true
        self.categoryButton.layer.cornerRadius = 8
        
        let previewMealTime = self.requestValue.previewMealTime
        if let unwrappedImageEncodedString = previewMealTime.imageEncodedString, let unwrappedImageData = Data(base64Encoded: unwrappedImageEncodedString) {
            self.previewImageView.image = UIImage(data: unwrappedImageData)
        }
        if let unwrappedCategory = previewMealTime.category?.rawValue {
            self.categoryButton.setTitle("#\(unwrappedCategory.uppercased())", for: .disabled)
        }
        if let unwrappedCheckInDateTime = previewMealTime.checkInDateTime {
            self.titleNavigationItem.title = dateFormatter.string(from: unwrappedCheckInDateTime)
        }
    }
    
}
