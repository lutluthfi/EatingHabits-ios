//
//  SummaryDashboardViewController.swift
//  EatingHabits
//
//  Created by Arif Luthfiansyah on 12/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import UIKit

class SummaryDashboardViewController: UITableViewController {
    class Constant {
        static let headerSection = 0
        static let mealTimeCategorySection = 1
        static let readingsSection = 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewDidLoad()
    }
    
    private func setupViewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
    }
    
}

extension SummaryDashboardViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case Constant.headerSection:
            return 1
        case Constant.mealTimeCategorySection:
            return MealTime.Category.allCases.count - 1
        case Constant.readingsSection:
            return 1
        default:
            return .zero
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case Constant.headerSection:
            return HeaderSummaryDashboardTableViewCell.height
        case Constant.mealTimeCategorySection:
            return MealTimeSummaryDashboardTableViewCell.height
        case Constant.readingsSection:
            return ReadingsSummaryDashboardTableViewCell.height
        default:
            return .zero
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case Constant.headerSection:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderSummaryDashboardTableViewCell.identifier, for: indexPath) as? HeaderSummaryDashboardTableViewCell else {
                fatalError("Cannot dequeue reusable cell \(HeaderSummaryDashboardTableViewCell.identifier) with reuseIdentifier: \(HeaderSummaryDashboardTableViewCell.identifier)")
            }
            
            cell.fill()
            
            return cell
        case Constant.mealTimeCategorySection:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MealTimeSummaryDashboardTableViewCell.identifier, for: indexPath) as? MealTimeSummaryDashboardTableViewCell else {
                fatalError("Cannot dequeue reusable cell \(MealTimeSummaryDashboardTableViewCell.identifier) with reuseIdentifier: \(MealTimeSummaryDashboardTableViewCell.identifier)")
            }
            
            let category = MealTime.Category.allCases[indexPath.row]
            cell.fill(category: category)
            
            return cell
        case Constant.readingsSection:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ReadingsSummaryDashboardTableViewCell.identifier, for: indexPath) as? ReadingsSummaryDashboardTableViewCell else {
                fatalError("Cannot dequeue reusable cell \(ReadingsSummaryDashboardTableViewCell.identifier) with reuseIdentifier: \(ReadingsSummaryDashboardTableViewCell.identifier)")
            }
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == Constant.readingsSection {
//            Animation 1
//            let transformTranslate = CATransform3DTranslate(CATransform3DIdentity, -self.view.bounds.width / 2, .zero, .zero)
//            cell.layer.transform = transformTranslate
//            cell.alpha = 0.5
//
//            UIView.animate(withDuration: 0.75) {
//                cell.layer.transform = CATransform3DIdentity
//                cell.alpha = 1
//            }
            
            let transformTranslate = CATransform3DTranslate(CATransform3DIdentity, .zero, 64, .zero)
            cell.layer.transform = transformTranslate
            cell.alpha = 0
            
            UIView.animate(withDuration: 0.5) {
                cell.layer.transform = CATransform3DIdentity
                cell.alpha = 1
            }
        }
    }
    
}
