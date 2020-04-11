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
    
    let section = [
        SectionHeader(section: "Silver", badgeName: "LockedAchievement"),
        SectionHeader(section: "Gold", badgeName: "LockedAchievement"),
        SectionHeader(section: "Onyx", badgeName: "LockedAchievement"),
        SectionHeader(section: "Ruby", badgeName: "LockedAchievement")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.topItem?.title = "Achievement"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AchievementVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("You tapped")
    }

}

extension AchievementVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "achievementCell", for: indexPath) as? AchievementCell {
            let badgeImage = self.section[indexPath.row]
            cell.badgeImg.image = UIImage(named: "\(badgeImage.badgeName)")
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
