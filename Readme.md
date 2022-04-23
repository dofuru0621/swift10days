# appPasscode

## APP執行畫面：

<img width="250" alt="截圖 2022-04-23 下午8 30 42" src="https://user-images.githubusercontent.com/74231280/164894787-45d20318-c828-419c-94c6-6771c3d15970.png"><img width="250" alt="截圖 2022-04-23 下午8 30 52" src="https://user-images.githubusercontent.com/74231280/164894789-f6e2a4af-7107-4932-8901-282064ecf99c.png"><img width="250" alt="截圖 2022-04-23 下午8 31 47" src="https://user-images.githubusercontent.com/74231280/164894791-110fda81-b86e-4558-82ad-275d53489aea.png">

### 建立IBOutlet :

* [UIImageView] 表示當前密碼
* [UIButton] 數字按鍵

### 建立IBAction ：
* UIButton enterPasscode 輸入密碼
* UIButton backward 清除密碼一位數

## 1. 建立IBOutlet：

> 拉物件記得改collection

```
    @IBOutlet var numBtns: [UIButton]!
    @IBOutlet var passCodeImageViews: [UIImageView]!
```  

## 2.建立程式會使用到的數值：

```  
    var passcode = "9999"
    var entercode = ""
```  

## 3.建立enterPasscde：
```
   @IBAction func enterPasscde(_ sender: UIButton) {
        //如果輸入不到四個 則按鈕的值加入entercode裏且更改顯示顏色
        if entercode.count != 4{
            if let inputNumber = sender.currentTitle{
                entercode.append(inputNumber)
            }
        }
        imagechange()
    }
```

## 4.建立backward：
```
  @IBAction func backward(_ sender: UIButton) {
        //如果entercode裏不為0，代表有值，則按倒退鍵把最後一個值刪掉且更改顯示顏色
        if entercode.count != 0 {
            entercode = String(entercode.dropLast(1))
            imagechange()
        }
    }
```
## 5.建立imagechange:
根據輸入的個數更改圖案，讓人看的出來輸入幾位數
![螢幕錄製_2022-04-23_下午9_04_52_AdobeCreativeCloudExpress](https://user-images.githubusercontent.com/74231280/164895836-3cdbeb4c-af40-4e84-abc3-a2eb6af2a668.gif)

```
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
    }
```

## 6.建立checkPasscode():

```
      func checkPasscode(){
        //如果輸入的值是正確的，跳出訊息匡跟你說
        if entercode == passcode{
            let controller = UIAlertController(title: "correct", message: "Welcome :D", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default){
                (_) in self.reset()
            }
            controller.addAction(action)
            present(controller,animated: true,completion: nil)
        }else{
            //否則跳出錯誤Reset後重新輸入
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
```

## 7.建立checkPasscode():
```
  func reset(){
        //  輸入歸0,圖案初始化
        for i in passCodeImageViews{
            i.isHighlighted = false
        }
        entercode = ""
    }
```
