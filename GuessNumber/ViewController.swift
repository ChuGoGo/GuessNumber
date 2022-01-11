//
//  ViewController.swift
//  GuessNumber
//
//  Created by Peter Pan on 2021/8/31.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
//    先設定答案為1到100的亂數
    var answer = Int.random(in: 1...100)
//    錯誤的次數為0
    var guessWrongCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func guess(_ sender: Any) {
//        輸入的數字
        let numberText = numberTextField.text!
//        設定為整數
        let number = Int(numberText)
//        如果數字不等於空值的話
        if number != nil {
            let guessNumber = number!
//            如果猜出的數字等於答案的話
            if guessNumber == answer {
                resultLabel.text = "準!"
//                如果猜出的數字比答案小的話
            } else if guessNumber < answer {
                resultLabel.text = "太小了"
//                清空你的數字籃
                numberTextField.text = ""
//                猜錯次數＋1
                guessWrongCount += 1
                countLabel.text = "猜錯\(guessWrongCount)次喔！"
//                如果不是比答案小，也不是答案的話。
            } else {
                resultLabel.text = "太大了"
                numberTextField.text = ""
                guessWrongCount += 1
                countLabel.text = "猜錯\(guessWrongCount)次喔！"
            }
//            如果猜了6次都沒猜中的話
            if guessWrongCount == 6 {
                countLabel.text = "您真爛！"
            }
        }
//        收起鍵盤
        view.endEditing(true)
    }
    
    
    @IBAction func replay(_ sender: Any) {
//        結果跑出在猜一次吧！
        resultLabel.text = "再猜一次吧！"
//        把輸入的地方清空
        numberTextField.text = ""
//        從新讓數字從1...100
        answer = Int.random(in: 1...100)
//        count重置為0
        guessWrongCount = 0
//        提示字重新
        countLabel.text = "猜錯0次喔！"
        
    }
    
}

