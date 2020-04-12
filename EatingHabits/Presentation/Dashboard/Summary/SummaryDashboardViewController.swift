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
    }
    
    private func setupViewDidLoad() {
        
    }
    
}

extension SummaryDashboardViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case Constant.headerSection:
            break
        case Constant.mealTimeCategorySection:
            break
        case Constant.readingsSection:
            break
        default:
            return .zero
        }
        
        return .zero
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .zero
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case Constant.headerSection:
                break
            case Constant.mealTimeCategorySection:
                break
            case Constant.readingsSection:
                break
            default:
                return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
}
