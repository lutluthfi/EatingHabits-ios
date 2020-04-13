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
    
    var selectedImage: UIImage!
    
    let section = [
        SectionHeader(section: "Silver", badgeName: ["silver1", "silver2", "silver3"]),
        SectionHeader(section: "Gold", badgeName: ["gold1", "gold2", "gold3"]),
        SectionHeader(section: "Onyx", badgeName: ["onyx1", "onyx2", "onyx3"]),
        SectionHeader(section: "Ruby", badgeName: ["ruby1", "ruby2", "ruby3"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.topItem?.title = "Achievement"

    }

}

extension AchievementVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let category = section[indexPath.section].badgeName[indexPath.row]
        selectedImage = UIImage(named: category)
        print("pressed \(category)")
        
        performSegue(withIdentifier: "achievementDetails", sender: category)
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
