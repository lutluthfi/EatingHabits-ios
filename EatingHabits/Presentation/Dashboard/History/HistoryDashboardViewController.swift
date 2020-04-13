//
//  HistoryDashboardViewController.swift
//  EatingHabits
//
//  Created by Arif Luthfiansyah on 12/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import UIKit

class HistoryDashboardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loadingIndicatorView: UIActivityIndicatorView!
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter
    }()
    lazy var mealTimeStorage: MealTimeStorage? = {
        return (UIApplication.shared.delegate as? AppDelegate)?.mealTimeStorage
    }()
    
    private var displayedMealTimesCheckInDate: [String] = [] {
        willSet {
            self.displayedMealTimesCheckInDate.removeAll()
        }
    }
    private var displayedMealTimesByCheckInDate: [String : [MealTime]] = [:] {
        willSet {
            self.displayedMealTimesByCheckInDate.removeAll()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.doFetchMealTimes()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? DetailHistoryDashboardViewController {
            if let requestValue = sender as? DetailHistoryDashboardViewControllerRequestValue {
                destinationViewController.requestValue = requestValue
            }
        }
    }
    
    private func setupViewDidLoad() {
        self.collectionView.contentInset = .zero
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.loadingIndicatorView.hidesWhenStopped = true
    }
    
    private func doFetchMealTimes() {
        self.loadingIndicatorView.startAnimating()
        self.mealTimeStorage?.mealTimes(completion: { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    let groupedMealtimesByCheckInDate = Dictionary(grouping: response) { (mealtime) -> String in
                        return self.dateFormatter.string(from: mealtime.checkInDateTime!)
                    }
                    self.displayedMealTimesCheckInDate = groupedMealtimesByCheckInDate.keys.sorted(by: { $0 > $1 })
                    self.displayedMealTimesByCheckInDate = groupedMealtimesByCheckInDate
                    self.collectionView.reloadData()
                    self.loadingIndicatorView.stopAnimating()
                }
                break
            case .failure(_):
                DispatchQueue.main.async {
                    self.loadingIndicatorView.stopAnimating()
                    let tryAgainAlertAction = UIAlertAction(title: "Try again", style: .default) { (_) in
                        self.doFetchMealTimes()
                    }
                    let alertViewController = UIAlertController(title: "Failure", message: "Failed to retrieved your meal time history", preferredStyle: .alert)
                    alertViewController.addAction(tryAgainAlertAction)
                    self.present(alertViewController, animated: true) { }
                }
                break
            }
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.bounds.width / 3
        let height = self.view.bounds.width / 3
        return .init(width: width, height: height)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.displayedMealTimesCheckInDate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let key = self.displayedMealTimesCheckInDate[section]
        return self.displayedMealTimesByCheckInDate[key]?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoryMealTimeCollectionViewCell.identifier, for: indexPath) as? HistoryMealTimeCollectionViewCell else { fatalError() }
        
        let key = self.displayedMealTimesCheckInDate[indexPath.section]
        let mealTime = self.displayedMealTimesByCheckInDate[key]?[indexPath.row]
        if let unwrappedMealTime = mealTime, let unwrappedImageEncodedString = unwrappedMealTime.imageEncodedString {
            cell.fill(with: unwrappedImageEncodedString)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderHistoryMealTimeCollectionReusableView.identifier, for: indexPath) as? HeaderHistoryMealTimeCollectionReusableView else { fatalError() }
        
        let key = self.displayedMealTimesCheckInDate[indexPath.section]
        let mealTime = self.displayedMealTimesByCheckInDate[key]?[indexPath.row]
        if let unwrappedMealTime = mealTime, let unwrappedCheckInDateTime = unwrappedMealTime.checkInDateTime {
            cell.fill(with: unwrappedCheckInDateTime)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let key = self.displayedMealTimesCheckInDate[indexPath.section]
        let mealTime = self.displayedMealTimesByCheckInDate[key]?[indexPath.row]
        guard let unwrappedMealTime = mealTime else { return }
        let requestValue = DetailHistoryDashboardViewControllerRequestValue(previewMealTime: unwrappedMealTime)
        self.performSegue(withIdentifier: "DetailHistoryDashboardViewController", sender: requestValue)
    }
    
}
