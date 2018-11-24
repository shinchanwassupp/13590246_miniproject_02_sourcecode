//
//  hardPage.swift
//  13590246_miniproject_02_sourcecode
//
//  Created by SHINCHAN on 17/11/2561 BE.
//  Copyright © 2561 Kukeat Chaiwan. All rights reserved.
//

import UIKit

class hardPage: UIViewController {
    
    var timer = Timer()
    var limitTime = 15
    var checkStatusToPlay = false
    var score = 0
    
    var arrayOfLevels = [String]()
    
    @IBOutlet weak var showTimer: UILabel!
    
    @IBOutlet weak var showScore: UILabel!
    
    @IBOutlet weak var showImage: UIImageView!
    
    @IBAction func tap(_ sender: Any) {
        if checkStatusToPlay {
            score += 1
            showScore.text = String(score)
            
            if score>=50{
                showImage.image = UIImage(named: "bg_fire2")
                showScore.textColor = UIColor.white
            }//end if >=50
            
        }//end if checkStatusToPlay
    }
    
    @IBAction func startBt(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1,target: self,
                                     selector: #selector(easyPage.processTimer), userInfo: nil,
                                     repeats: true)
        checkStatusToPlay = true
    }
    
    
    override func viewDidLoad() {
        arrayOfLevels = ["choose"]
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @objc func processTimer() {
        if limitTime > 0 {
            limitTime -= 1
            showTimer.text = "Timer: \(limitTime)"
        }else if limitTime == 0{
            checkStatusToPlay = false
            let alert = UIAlertController(title: "End Game", message: "Do you will play again, Your Score \(score) Right?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Back to home", style: .default, handler: {UIAlertAction in self.startOver()})
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }else{
            timer.invalidate()
        }
    }
    

    
    func startOver()   {
        score = 0
        let numberOfLevels = UInt32(arrayOfLevels.count)
        let randomNumber = Int(arc4random() %  numberOfLevels)
        let vcName = arrayOfLevels[randomNumber]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: vcName)
        
        self.present(vc!, animated: true, completion: nil)
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
