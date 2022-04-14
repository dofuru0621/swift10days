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
<li>餐點ImageView</li>  

```
1986. 我是順序清單.
1999. 我是順序清單.
1986\. 我只是一般文字.   
1999\. 我只是一般文字.
```
