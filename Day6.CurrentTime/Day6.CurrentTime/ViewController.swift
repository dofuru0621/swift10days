//
//  ViewController.swift
//  Day6.CurrentTime
//
//  Created by 郭家宇 on 2022/4/13.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var currentTime: UILabel!
    @IBAction func refreshB(_ sender: UIButton) {
               var date = NSDate()

               var dateformatter = DateFormatter()

               dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

               var strNowTime = dateformatter.string(from: date as Date) as String

               currentTime.text = strNowTime;
      

    }
    override func viewDidLoad() {
        super.viewDidLoad()

    

        
    }

}

