//
//  ViewController.swift
//  tips
//
//  Created by 郭家宇 on 2022/4/12.
//

import UIKit

class ViewController: UIViewController {
    var cout = 0
    
    @IBOutlet weak var scores: UILabel!
    @IBAction func resetB(_ sender: UIBarButtonItem) {
        scores.text = "0"
    }
    @IBAction func tipB(_ sender: Any) {
        cout = cout + 1
        scores.text = String(cout)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

