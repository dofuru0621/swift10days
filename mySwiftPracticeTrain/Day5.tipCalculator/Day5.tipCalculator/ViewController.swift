//
//  ViewController.swift
//  Day5.tipCalculator
//
//  Created by 郭家宇 on 2022/4/13.
//

import UIKit

class ViewController: UIViewController {
    var inputCout:Float = 0.00
    var tipCout:Float = 0.00
    var tipvalue:Int = 0
    var totalCout:Float = 0.00
    @IBOutlet weak var tipP: UILabel!
    
    @IBOutlet weak var tipMoney: UILabel!
    @IBOutlet weak var totalMoney: UILabel!
    @IBOutlet weak var inputMoney: UITextField!
    @IBAction func tipSlider(_ sender: UISlider) {
        tipvalue = Int(sender.value)
        tipP.text = "(\(tipvalue)%)"
        coutMode()
    }
    func coutMode(){
        
        let inputText = inputMoney.text!
        var inputCout = Float(inputText)
        if inputCout == nil{
            print("error")
        }else if inputCout! > 0{
            tipCout = inputCout! * (Float(tipvalue)/100)
            print(tipCout)
            totalCout = tipCout + inputCout!
            print(totalCout)
            tipMoney.text = "$\(tipvalue)"
            totalMoney.text = "$\(totalCout)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

