//
//  ViewController.swift
//  randomMeal
//
//  Created by 郭家宇 on 2022/4/14.
//

import UIKit

class ViewController: UIViewController {
    //  設定早午餐種類、飯類、麵類
    var brunchItem = ["morningbreakfest","taiwanDabin","mywave"]
    var riceItem = ["whiteRice","friesRices","Risotto"]
    var noodleItem = ["soupnoodles","friesnoodles","wolongnoodles"]
    //  最後的陣列
    var regitemAns:Array = [String]()
    //  早午餐暫存陣列
    var regitem1:Array = [String]()
    //  飯類暫存陣列
    var regitem2:Array = [String]()
    //  麵類暫存陣列
    var regitem3:Array = [String]()
    //  設定switch有沒被按過
    var true1 = false
    var true2 = false
    var true3 = false
    @IBOutlet weak var finalLabel: UILabel!
    //  設定倍率 初始為1倍
    var probability1 = 1
    var probability2 = 1
    var probability3 = 1
    //  讀取總陣列裡的總位數
    var timesValue = 0
    @IBOutlet weak var brunchLabel: UILabel!
    
    @IBOutlet weak var riceLabel: UILabel!
    
    @IBOutlet weak var noodleLabel: UILabel!
    
    //打開switch加入 項目陣列進暫存陣列
    @IBAction func brunchSeg(_ sender: UISwitch) {
        if sender.isOn == true &&  true1 == false{
            regitem1 += brunchItem
            //print(regitem1)
        }
        
    }
    @IBAction func riceSeg(_ sender: UISwitch) {
        if sender.isOn && true2 == false{
            regitem2 += riceItem
            print(regitem2)
            true2 = true
            //print(regitem2)
        }
    }
    @IBAction func noodleSeg(_ sender: UISwitch) {
        if sender.isOn && true2 == false {
            regitem3 += noodleItem
            true3 = true
            //print(regitem3)
        }
    }
    //  調整倍率 用0倍跳出訊息匡
    @IBAction func brinchStepper(_ sender: UIStepper) {
        probability1 = Int(sender.value)
        alertFunction()
        brunchLabel.text = "\(probability1)x"
       
    }
    
    @IBAction func riceStepper(_ sender: UIStepper) {
        probability2 = Int(sender.value)
        alertFunction()
        riceLabel.text = "\(probability2)x"
    }
    
    @IBAction func noodleStepper(_ sender: UIStepper) {
        probability3 = Int(sender.value)
        alertFunction()
        noodleLabel.text = "\(probability3)x"
    }
    //  按下按鈕呼叫兩程式
    @IBAction func goButton(_ sender: UIButton) {
        cout()
        randomMeal()
    }
    
    func cout(){
        //如果大於一倍 加入額外倍率與暫存陣列進總暫存陣列
        if probability1 >= 1{
        for i in 1 ... probability1{
            regitemAns = regitemAns + regitem1
        }}
        if probability1 >= 1{
        for j in 1 ... probability2{
            regitemAns = regitemAns + regitem2
        }}
        print(regitemAns)
        if probability1 >= 1{
        for k in 1 ... probability1{
            regitemAns = regitemAns + regitem3
        }}
        //print(regitemAns)
    }
    //  設定alert訊息匡的樣式
    func alertFunction(){
        if probability1 == 0{
            let controller = UIAlertController(title: "倍率不為0", message: "要為0按左邊按鈕", preferredStyle: .alert)
               let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
               controller.addAction(okAction)
               present(controller, animated: true, completion: nil)
            probability1 = 1
        }
        if probability2 == 0{
            let controller = UIAlertController(title: "倍率不為0", message: "要為0按左邊按鈕", preferredStyle: .alert)
               let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
               controller.addAction(okAction)
               present(controller, animated: true, completion: nil)
            probability2 = 1
        }
        if probability3 == 0{
            let controller = UIAlertController(title: "倍率不為0", message: "要為0按左邊按鈕", preferredStyle: .alert)
               let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
               controller.addAction(okAction)
               present(controller, animated: true, completion: nil)
            probability3 = 1
        }
        
    }
    //  先計算出總共有幾項 在random 1 ～ 總數
    func randomMeal(){
        for times in regitemAns{
            timesValue = timesValue + 1
        }
        timesValue = Int.random(in: 1 ... timesValue)
        for timesRight in regitemAns{
            finalLabel.text = "Your final Meal's : \(regitemAns[timesValue])"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

