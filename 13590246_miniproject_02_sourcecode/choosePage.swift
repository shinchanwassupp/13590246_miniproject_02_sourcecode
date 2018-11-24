//
//  choosePage.swift
//  13590246_miniproject_02_sourcecode
//
//  Created by SHINCHAN on 17/11/2561 BE.
//  Copyright © 2561 Kukeat Chaiwan. All rights reserved.
//

import UIKit

class choosePage: UIViewController {
    
    var arrayOfLevels = [String]()

    @IBOutlet weak var easyBt: UIButton!
    
    @IBOutlet weak var mediumBt: UIButton!
    
    @IBOutlet weak var hardBt: UIButton!
    
    @IBAction func randomBt(_ sender: Any) {
        let numberOfLevels = UInt32(arrayOfLevels.count)
        let randomNumber = Int(arc4random() %  numberOfLevels)
        let vcName = arrayOfLevels[randomNumber]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: vcName)
        
        self.present(vc!, animated: true, completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfLevels = ["easyPage","mediumPage","hardPage"]

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
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
        if(motion == .motionShake){
            let numberOfLevels = UInt32(arrayOfLevels.count)
            let randomNumber = Int(arc4random() %  numberOfLevels)
            let vcName = arrayOfLevels[randomNumber]
            
            let vc = storyboard?.instantiateViewController(withIdentifier: vcName)
            
            self.present(vc!, animated: true, completion: nil)
        }
    }
}
