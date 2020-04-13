//
//  AchievementVC.swift
//  EatingHabits
//
//  Created by Muhammad Faruuq Qayyum on 10/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import UIKit

class AchievementVC: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    var selectedItem: String!
    
    let section = [
        SectionHeader(section: "Silver", badgeName: ["silver1", "silver2", "LockedAchievement"]),
        SectionHeader(section: "Gold", badgeName: ["LockedAchievement", "LockedAchievement", "LockedAchievement"]),
        SectionHeader(section: "Onyx", badgeName: ["LockedAchievement", "LockedAchievement", "LockedAchievement"]),
        SectionHeader(section: "Ruby", badgeName: ["LockedAchievement", "LockedAchievement", "LockedAchievement"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.topItem?.title = "Achievement"

    }

}


func getSectionName(section: String) {
    
}

extension AchievementVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
 //       let image = UIImage(named: section[indexPath.section].badgeName[indexPath.row])

        let category = section[indexPath.section].badgeName[indexPath.row]
        selectedItem = category
        //print("pressed \(category)")
        if selectedItem == "LockedAchievement" {
            let alert = UIAlertController(title: "Locked!", message: "Keep doing a good habit to unlock your achievements", preferredStyle: .alert)
            let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        } else {
        performSegue(withIdentifier: "achievementDetails", sender: category)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? AchievementDetailsVC {
           if selectedItem == "silver1" {
            detailsVC.image = UIImage (named: "silver1")
            detailsVC.footer = "You are a breakfast soldier!"
            detailsVC.desc = "Congratulations on your first 7-day of doing good habit. Keep it up to achieve more!"
        } else if selectedItem == "silver2" {
        detailsVC.image = UIImage (named: "silver2")
        detailsVC.footer = "You value yourself!"
        detailsVC.desc = "Congratulations on your first 14-day of doing good habit. Keep it up to achieve more!"
        } else if selectedItem == "silver3" {
        detailsVC.image = UIImage (named: "silver3")
        detailsVC.footer = "You are what you are!"
        detailsVC.desc = "Congratulations on your first 21-day of doing good habit. Keep it up to achieve more!"
        }
        
            
        }
        
        
    }

}


extension AchievementVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "achievementCell", for: indexPath) as? AchievementCell {
            let badgeImage = self.section[indexPath.section].badgeName[indexPath.row]
            cell.badgeImg.image = UIImage(named: "\(badgeImage)")
            return cell
        }
        return AchievementCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return section.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let section = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "achievementSection", for: indexPath) as? AchievementSection {
            
            let sectionHeader = self.section[indexPath.section]
            section.sectionLabel.text = sectionHeader.section
            
            return section
        }
        return AchievementSection()
    }
    
}
