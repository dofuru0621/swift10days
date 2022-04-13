//
//  ViewController.swift
//  Day3.guessNumber
//
//  Created by 郭家宇 on 2022/4/12.
//

import UIKit

class ViewController: UIViewController {

    var ans = 0
    let inputNum = 0
    var minNum = 0
    var maxNum = 100
    @IBOutlet weak var inputNumber: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func guessButton(_ sender: Any) {
        guessMode()
    }
        
    @IBAction func reset(_ sender: UIBarButtonItem) {
        newgame()
    }
    @IBOutlet weak var peepNum: UILabel!
    @IBAction func peepButton(_ sender: Any) {
        peepNum.textColor = .black
        peepNum.text = String(ans)
    }
    
    func guessMode(){
        let inputText = inputNumber.text!
        var inputNum = Int(inputText)
        if inputNum == nil{
            messageLabel.text = "please input \(minNum) ~ \(maxNum) "
        }else if inputNum! > maxNum{
            messageLabel.text = "Too High! please input \(minNum) ~ \(maxNum) "
        }else if inputNum! < minNum {
            messageLabel.text = "Too Low! input \(minNum) ~ \(maxNum) "
        }else if inputNum! > ans && inputNum! <= maxNum{
            maxNum = inputNum!
            messageLabel.text = "Fighting! input \(minNum) ~ \(maxNum)"
        }else if inputNum! < ans && inputNum! >= minNum{
            minNum = inputNum!
            messageLabel.text = "Fighting! input \(minNum) ~ \(maxNum)"
        }else{
            messageLabel.text = "Congulations!! One more game?"
            
        }
        
    }
    func newgame(){
        var ans = 0
        let inputNum = 0
        var minNum = 0
        var maxNum = 100
        inputNumber.text = "0"
        messageLabel.text = "Welcome!!"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ans = Int.random(in: 1...100)
    }


}

