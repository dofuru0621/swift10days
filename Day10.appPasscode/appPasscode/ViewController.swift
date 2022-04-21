//
//  ViewController.swift
//  appPasscode
//
//  Created by 郭家宇 on 2022/4/21.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var numBtns: [UIButton]!
    @IBOutlet var passCodeImageViews: [UIImageView]!
    
    var passcode = "1234"

    var entercode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    func imagechange(){
        switch entercode.count{
        case 1:
            for i in 0...3{
                passCodeImageViews[i].tintColor = .black
                if i > 0 {
                    passCodeImageViews[i].tintColor = .white
                    
                }
            }
        case 2:
            for i in 0...3 {
                passCodeImageViews[i].tintColor = .black
                if i > 1{
                    passCodeImageViews[i].tintColor = .white
                }
            }
        case 3:
            for i in 0...3 {
                passCodeImageViews[i].tintColor = .black
                if i > 2{
                    passCodeImageViews[i].tintColor = .white
                }
            }
        case 4:
            for i in passCodeImageViews {
                    i.tintColor = .black
                }
            checkPasscode()
        default:
            for i in passCodeImageViews{
                i.tintColor = .white
            }
        }
        print(entercode)
    }
    func checkPasscode(){
        if entercode == passcode{
            let controller = UIAlertController(title: "correct", message: "welcome", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default){
                (_) in self.reset()
            }
            controller.addAction(action)
            present(controller,animated: true,completion: nil)
        }else{
            let controller = UIAlertController(title: "Wrong", message: "Please Try Again!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            controller.addAction(action)
            present(controller, animated: true, completion: reset)
            passCodeImageViews[0].tintColor = .white
            passCodeImageViews[1].tintColor = .white
            passCodeImageViews[2].tintColor = .white
            passCodeImageViews[3].tintColor = .white
        }
    }
    func reset(){
        for i in passCodeImageViews{
            i.isHighlighted = false
        }
        entercode = ""
    }

    @IBAction func enterPasscde(_ sender: UIButton) {
        if entercode.count != 4{
            if let inputNumber = sender.currentTitle{
                entercode.append(inputNumber)
            }
        }
        imagechange()
    }
    
    @IBAction func backward(_ sender: UIButton) {
        if entercode.count != 0 {
            entercode = String(entercode.dropLast(1))
            imagechange()
        }
    }
}

