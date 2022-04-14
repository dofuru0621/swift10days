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
        cout = 0
    }
    @IBAction func tipB(_ sender: Any) {
        tap()
    }
    
    @IBAction func longPressB(_ sender: UILongPressGestureRecognizer) {tap()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    func tap(){
        cout = cout + 1
            scores.text = String(cout)
        if cout > 200 {
            view.backgroundColor = .red
            scores.textColor = .white
        }else if cout > 100  {
            view.backgroundColor = .blue
            scores.textColor = .gray
        }else if cout > 50 {
            view.backgroundColor = .green
            scores.textColor = .black
        }else if cout > 25{
            view.backgroundColor = .yellow
            scores.textColor = .black
        }else {
            view.backgroundColor = .white
            scores.textColor = .black
        }
        
        if cout > 300{
            
        }
        
    }

}

