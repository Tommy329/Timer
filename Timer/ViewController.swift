//
//  ViewController.swift
//  Timer
//
//  Created by . HIKARU on 2023/12/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label : UILabel!
    var timer : Timer!
    var countdown : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @objc func onTimerCalled() {
        
        let remainingMinutes : Int = countdown / 60
        let remainingSeconds : Int = countdown % 60
        label.text = String(format: "%02d:%02d",remainingMinutes,remainingSeconds )
        
        countdown -= 1
        
        if countdown < 0 {
            let stopAlert = UIAlertController(title: "タイマーが終了しました。", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            stopAlert.addAction(okAction)
            present(stopAlert,animated: true)
            timer.invalidate()
        }}
    @IBAction func select30seconds() {
        countdown = 30
        
       timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerCalled), userInfo: nil, repeats: true)
        
        timer.fire()
        
    }


}

