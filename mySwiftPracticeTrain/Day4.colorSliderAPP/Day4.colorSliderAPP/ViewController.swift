//
//  ViewController.swift
//  Day4.colorSliderAPP
//
//  Created by 郭家宇 on 2022/4/13.
//

import UIKit

class ViewController: UIViewController {
    
    var redColor = 255
    var greenColor = 255
    var blueColor = 255
    var redcolor2 = "ff"
    var greencolor2 = "ff"
    var bluecolor2 = "ff"
    
    
    @IBOutlet weak var Rcolor: UILabel!
    @IBOutlet weak var Gcolor: UILabel!
    @IBOutlet weak var Bcolor: UILabel!
    @IBOutlet weak var colorHexLabel: UILabel!
    @IBAction func Rslider(_ sender: UISlider) {
        redColor = Int(sender.value)
        Rcolor.text = "R:\(redColor)"
        redcolor2 = Int2strHex(int: redColor)
        viewcolor()
        Hexinit()
    }
    @IBAction func Gslider(_ sender: UISlider) {
        greenColor = Int(sender.value)
        Gcolor.text = "G:\(greenColor)"
        greencolor2 = Int2strHex(int: greenColor)
        viewcolor()
        Hexinit()
    }
    @IBAction func Blider(_ sender: UISlider) {
        blueColor = Int(sender.value)
        Bcolor.text = "B:\(blueColor)"
        bluecolor2 = Int2strHex(int: blueColor)
        viewcolor()
        Hexinit()
    }
    func viewcolor(){
        view.backgroundColor = UIColor(red: CGFloat(redColor)/255, green: CGFloat(greenColor)/255, blue: CGFloat(blueColor)/255, alpha: 1)
        if redColor < 130 && blueColor < 130 && greenColor < 130{
            Rcolor.textColor = .white
            Bcolor.textColor = .white
            Gcolor.textColor = .white
            colorHexLabel.textColor = .white
        }else {
            Rcolor.textColor = .black
            Bcolor.textColor = .black
            Gcolor.textColor = .black
            colorHexLabel.textColor = .black
        }
        
    }
    func Hexinit(){
        colorHexLabel.text = "ColorHex:     #\(redcolor2)\(greencolor2)\(bluecolor2)"
    }
    func Int2strHex(int:Int)-> String
    {
        let str = String(int, radix: 16)
        return str
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

