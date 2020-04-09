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
    @IBOutlet weak var closeBtnLabel: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageBanner.image = #imageLiteral(resourceName: "EatTime")
        self.imageBanner.contentMode = .scaleAspectFill
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 7.0/255.0, green: 169.0/255.0, blue: 20.0/255.0, alpha: 1.0)]
        self.closeBtnLabel.tintColor = UIColor(red: 155.0/255.0, green: 100.0/255.0, blue: 85.0/255.0, alpha: 1.0)
        self.titleLable.text = "When is the best time to have a meal?"
        self.bodyLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc felis sapien, ornare vitae orci nec, ultricies egestas turpis. Quisque et consectetur ex. Pellentesque auctor efficitur arcu. Cras vulputate lacus in suscipit fermentum. Proin quis lobortis eros, consectetur scelerisque tellus. Nam mi ex, egestas vel ex et, vehicula vestibulum nisi. Vestibulum semper eros a ipsum congue ultricies. Nullam quis fermentum orci. Duis dapibus, ipsum eget fermentum pulvinar, ante quam efficitur nunc, in aliquet mi nisi sed sapien. Fusce euismod rutrum erat, sit amet aliquet elit laoreet ut.\n\nCras diam velit, sagittis in efficitur sed, venenatis et lorem. Aenean maximus vestibulum eros sit amet semper. Vestibulum et scelerisque purus, vitae suscipit odio. Aenean efficitur quam vel massa lobortis, id tincidunt justo rhoncus. Praesent id viverra libero. Vivamus gravida mi non lacus pellentesque porttitor. In convallis metus leo, in congue lorem euismod laoreet. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque tincidunt ultrices ante, ut porttitor lacus ornare non. Morbi interdum lacus in felis ullamcorper laoreet. In sed consectetur lacus. Proin iaculis odio ac augue lobortis, eget molestie sapien feugiat. Sed felis eros, condimentum eu ornare sed, imperdiet et velit."
    }
    
    @IBAction func closeBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }


}
