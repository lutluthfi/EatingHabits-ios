//
//  AchievementDetailsVC.swift
//  EatingHabits
//
//  Created by Muhammad Faruuq Qayyum on 11/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import UIKit

class AchievementDetailsVC: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var achievementImage: UIImageView!
    @IBOutlet weak var footerLabel: UILabel!
    @IBOutlet weak var achievementDescription: UILabel!
    @IBOutlet weak var boardBtn: UIButton!
    
    var image: UIImage!
    var header: String!
    var footer: String!
    var desc: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        boardBtn.setTitle("Achievement Board", for: .normal)
        boardBtn.setTitleColor(.white, for: .normal)
        boardBtn.backgroundColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.3)
        boardBtn.layer.cornerRadius = 8
        
        headerLabel.text = header
        achievementImage.image = image
        footerLabel.text = footer
        achievementDescription.text = desc
        
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
