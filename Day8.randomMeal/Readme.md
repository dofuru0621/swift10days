# randomMealApp(早午餐版)


你有想早午晚餐的選擇障礙嗎？不妨自己做一個app讓他決定吧！  
目的：學習autolayout,Switch,Stepper,UIAlert
UISwitch 使用
UIstepper 使用
StringArray 應用
UIAlertController 實現

## App功能介紹
選擇想要吃的種類並且點擊倍率，可以選擇的項目如下：  
1.早午餐  
2.飯類  
3.麵類  
最後會顯示電腦抽中的餐點

<img width="250" alt="截圖 2022-04-14 下午5 36 20" src="https://user-images.githubusercontent.com/74231280/163358887-0e6d585d-1b97-4ca3-80c2-aa2984cef7b2.png"><img width="250" alt="截圖 2022-04-14 下午5 56 21" src="https://user-images.githubusercontent.com/74231280/163361707-28294c6c-7f8f-4e8d-b77f-1deb81cb269a.png"><img width="250" alt="截圖 2022-04-14 下午5 56 29" src="https://user-images.githubusercontent.com/74231280/163361727-77accf7d-dff5-42de-8030-f04fccd1ef76.png">

## Demo影片
![demo](https://user-images.githubusercontent.com/74231280/163361531-eb6c64f8-7660-4ef8-8b5c-37cae9a6400f.gif)

要做這個畫面的樂透抽餐點程式
需要
> 7 個 Label  
> 3 個 Switch  
> 3 個 Stepper  
> 1 個 Button
  
## Storyboard
左半部為餐點類名稱，右半部為選擇功能區  
選擇餐點: 使用Switch，決定要不要加入餐點  
調整倍率: 使用Stepper，判斷餐點類的機率為多少  

<img width="250" alt="截圖 2022-04-14 下午5 36 20" src="https://user-images.githubusercontent.com/74231280/163358887-0e6d585d-1b97-4ca3-80c2-aa2984cef7b2.png">

## Outlet定義
<li>餐點Label</li>  

```
    @IBOutlet weak var brunchLabel: UILabel!
    @IBOutlet weak var riceLabel: UILabel!
    @IBOutlet weak var noodleLabel: UILabel!
```

<li>開關Switch</li>  

![ 1212](https://user-images.githubusercontent.com/74231280/163372492-39032f58-4729-49ba-9daa-910c44727ec9.gif)


```
    @IBOutlet weak var brunchLabel: UILabel!
    @IBOutlet weak var riceLabel: UILabel!
    @IBOutlet weak var noodleLabel: UILabel!
```  
<li>倍率UIStepper</li>  


![螢幕錄製_2022-04-14_下午6_31_38_AdobeCreativeCloudExpress (1)](https://user-images.githubusercontent.com/74231280/163373680-7524a349-0fb9-41c8-b69f-653d25397b8d.gif)




### 把Slider.value存進去常數裡，倍率的label.Text隨著Slider.value改變
> 如果不小心改到0倍請放心，會跳出訊息匡跟你說的！
<img width="206" alt="截圖 2022-04-14 下午6 31 58" src="https://user-images.githubusercontent.com/74231280/163372615-7490d26d-2615-40fe-93a2-6a23cd76662a.png">


```
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
```
UIStepper已在Storyboard中設定最小值為1，最大值為100 

<img width="150" alt="截圖 2022-04-14 下午6 37 27" src="https://user-images.githubusercontent.com/74231280/163371700-cec5035a-5235-4a9b-a7cd-c72ccc0e0600.png">

### 設定初始值

```
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

```

## 按下Go!後所產生的動作
按下按鈕會呼叫以下兩種程式

```
    @IBAction func goButton(_ sender: UIButton) {
        cout()
        randomMeal()
    }
```

```
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
```


```
    //先計算出總共有幾項 在random 1 ～ 總數
    func randomMeal(){
        for times in regitemAns{
            timesValue = timesValue + 1
        }
        timesValue = Int.random(in: 1 ... timesValue)
        for timesRight in regitemAns{
            finalLabel.text = "Your final Meal's : \(regitemAns[timesValue])"
        }
    }
```
##  設定alert樣式
```
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
```

因為我是邊學邊做，花的總時間大概前前後後快兩小時！  
一次會練到很多物件！！  
本來是還有我畫的imageView但是圖太醜就不放了  
By.Peanut
