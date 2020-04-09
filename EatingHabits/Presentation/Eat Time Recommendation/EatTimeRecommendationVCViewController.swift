//
//  EatTimeRecommendationVCViewController.swift
//  EatingHabits
//
//  Created by Muhammad Faruuq Qayyum on 09/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import UIKit

class EatTimeRecommendationVCViewController: UIViewController {
    
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var imageBanner: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 7.0/255.0, green: 169.0/255.0, blue: 20.0/255.0, alpha: 1.0)]
    }
    
    @IBAction func CloseBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
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
