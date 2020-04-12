//
//  DashboardVC.swift
//  EatingHabits
//
//  Created by Vincent Anderson Ngadiman on 08/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {

    @IBOutlet weak var waktu: UILabel!
    @IBOutlet weak var checkIn: UIButton!
    
    @IBOutlet weak var labelHitam: UILabel!
    var timer: Timer? = nil
    
    @IBOutlet weak var keterangan: UILabel!
    
    func updateClock() {
        let now  = Date()
       let formatter = DateFormatter()
        waktu.text = formatter.string(from: now)
    }
    
    var status_breakfast: Bool = false
    var status_lunch: Bool = false
    var status_dinner: Bool = false
    
    @objc func getCurrentTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        let today = DateFormatter()
        today.dateFormat = "yyyy-MM-dd"
        let str_today = today.string(from: Date())
        
        let str = formatter.string(from: Date())
        waktu.text = str
       

         let tanggal = formatter.date(from: str)

        
        let breakfastStartTime = formatter.date(from: "07:00 AM")
        let breakfastEndTime = formatter.date(from: "11:59 AM")
        
        let lunchStartTime = formatter.date(from: "12:00 PM")
        let lunchEndTime = formatter.date(from: "05:59 PM")
        
        let DinnerStartTime = formatter.date(from: "06:00 PM")
        let DinnerEndTime = formatter.date(from: "08:59 PM")
    
    
            if (tanggal?.compare(breakfastStartTime!) == ComparisonResult.orderedDescending) && (tanggal?.compare(breakfastEndTime!) == ComparisonResult.orderedAscending) {
                keterangan.text = "Breakfast could be your energy to start your daily activity"
                if status_breakfast == false {
                    checkIn.isHidden = false
                }
            } else if (tanggal?.compare(lunchEndTime!) == ComparisonResult.orderedAscending) && (tanggal?.compare(lunchStartTime!) == ComparisonResult.orderedDescending) {
                keterangan.text = "Go for your lunch"
                if status_lunch == false {
                    checkIn.isHidden = false
                }
            } else if (tanggal?.compare(DinnerEndTime!) == ComparisonResult.orderedAscending) && (tanggal?.compare(DinnerStartTime!) == ComparisonResult.orderedDescending) {
                keterangan.text = "Have your Dinner"
                if status_dinner == false {
                    checkIn.isHidden = false
                }
            } else {
                checkIn.isHidden = true
                status_dinner = false
                status_lunch = false
                status_breakfast = false
                keterangan.text = "Good night, sleep tight :)"
            }

    }
    
    func smaller(time1: Date, time2: Date) -> Bool {
        return time1.compare(time2) == ComparisonResult.orderedAscending
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("tesss")
        labelHitam.layer.cornerRadius = 12
        labelHitam.layer.masksToBounds = true
        
        getCurrentTime()
        
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(getCurrentTime), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }
    
    @IBAction func CekIn(_ sender: Any) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        let str = formatter.string(from: Date())
        waktu.text = str
        
        let tanggal = formatter.date(from: str)
        
        let breakfastStartTime = formatter.date(from: "07:00 AM")
             let breakfastEndTime = formatter.date(from: "11:59 AM")
            
            let lunchStartTime = formatter.date(from: "12:00 PM")
            let lunchEndTime = formatter.date(from: "05:59 PM")
            
            let DinnerStartTime = formatter.date(from: "06:00 PM")
            let DinnerEndTime = formatter.date(from: "08:59 PM")
        
                if (tanggal?.compare(breakfastStartTime!) == ComparisonResult.orderedDescending) && (tanggal?.compare(breakfastEndTime!) == ComparisonResult.orderedAscending) {
                    let alert = UIAlertController(title: "Success", message: "Don't forget to catch your lunch", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    }))
                    
                    self.present(alert, animated: true, completion: nil)
                    
                    //kirim checkIn breakfast ke core data
                    
                    checkIn.isHidden = true
                    status_breakfast = true
                    
                } else if (tanggal?.compare(lunchEndTime!) == ComparisonResult.orderedAscending) && (tanggal?.compare(lunchStartTime!) == ComparisonResult.orderedDescending) {
                    let alert = UIAlertController(title: "Success", message: "Don't forget to have your dinner tonight", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    }))
                    
                    self.present(alert, animated: true, completion: nil)
                    
                    //kirim checkIn lunch ke core data
                    
                    checkIn.isHidden = true
                    status_lunch = true
                    
                } else if (tanggal?.compare(DinnerEndTime!) == ComparisonResult.orderedAscending) && (tanggal?.compare(DinnerStartTime!) == ComparisonResult.orderedDescending) {
                    let alert = UIAlertController(title: "Success", message: "Don't forget to have enough sleep tonight!", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    }))
                    
                    self.present(alert, animated: true, completion: nil)
                    
                    //kirim checkIn dinner ke core data
                    checkIn.isHidden = true
                    status_dinner = true
                    
                } else {
                    checkIn.isHidden = true
                }

    }
    
}
