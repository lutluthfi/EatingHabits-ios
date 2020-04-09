

import UIKit

class SummaryViewController: UIViewController {
   
    @IBOutlet weak var trackedDay: UIView!
    
    @IBOutlet weak var dayGoes: UILabel!
    
    @IBOutlet weak var breakfast1: UIView!
    
    @IBOutlet weak var lunch1: UIView!
    
    @IBOutlet weak var dinner1: UIView!
    
    @IBOutlet weak var percentage1: UILabel!
    
    @IBOutlet weak var percentage2: UILabel!

    @IBOutlet weak var percentage3: UILabel!
    
    @IBOutlet weak var nextLabel: UIView!
    
    @IBOutlet weak var progressView1: UIProgressView!
    let progress1 = Progress(totalUnitCount: 5)
    
    @IBOutlet weak var progressView2: UIProgressView!
    let progress2 = Progress(totalUnitCount: 7)
    
    @IBOutlet weak var progressView3: UIProgressView!
    let progress3 = Progress(totalUnitCount: 7)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView1.transform = progressView1.transform.scaledBy(x: 1, y: 10)
        progressView2.transform = progressView2.transform.scaledBy(x: 1, y: 10)
        progressView3.transform = progressView3.transform.scaledBy(x: 1, y: 10)
        
        trackedDay.layer.cornerRadius = 15
        breakfast1.layer.cornerRadius = 10
        lunch1.layer.cornerRadius = 10
        dinner1.layer.cornerRadius = 10
        nextLabel.layer.cornerRadius = 15
        progressView1.layer.cornerRadius = 15
        progressView2.layer.cornerRadius = 15
        progressView3.layer.cornerRadius = 15
    }
    @IBAction func summaryButtons(_ sender: Any) {
       
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            (timer) in guard self.progress1.isFinished == false else {
                timer.invalidate()
                print("finished")
                return
                }
                self.progress1.completedUnitCount += 1
                
                let progressFloat = Float(self.progress1.fractionCompleted)
                self.progressView1.setProgress(progressFloat, animated: true)
                self.progressView1.progress = progressFloat
              
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
                  (timer) in guard self.progress2.isFinished == false else {
                      timer.invalidate()
                      print("finished")
                      return
                      }
                      self.progress2.completedUnitCount += 1
                      
                      let progressFloat = Float(self.progress2.fractionCompleted)
                      self.progressView2.setProgress(progressFloat, animated: true)
                      self.progressView2.progress = progressFloat
                
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
                            (timer) in guard self.progress3.isFinished == false else {
                                timer.invalidate()
                                print("finished")
                                return
                                }
                                self.progress3.completedUnitCount += 1
                                
                                let progressFloat = Float(self.progress3.fractionCompleted)
                                self.progressView3.setProgress(progressFloat, animated: true)
                                self.progressView3.progress = progressFloat
                }
            }
        }
    }
    func mealTime() {
        
    }
}

