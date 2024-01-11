//
//  ReseltViewController.swift
//  Timer
//
//  Created by . HIKARU on 2024/01/10.
//

import UIKit

class ReseltViewController: UIViewController {
    
        @IBOutlet var label : UILabel!
        var timer : Timer!
        var countdown : Int = 0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        @objc func onTimerCalled() {
            
            updatelabel()
            
            countdown -= 1
            
            if countdown < 0 {
                
               showstopAlert()
                
                timer.invalidate()
            }}
        func updatelabel (){
            
            let remainingMinutes : Int = countdown / 60
            let remainingSeconds : Int = countdown % 60
            label.text = String(format: "%02d:%02d",remainingMinutes,remainingSeconds )
        }
        func showstopAlert (){
            let stopAlert = UIAlertController(title: "タイマーが終了しました。", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            stopAlert.addAction(okAction)
            present(stopAlert,animated: true)
        }
            func startTimer(time: Int ) {
                countdown = time
                if timer != nil {
                    timer.invalidate()
                }
               timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerCalled), userInfo: nil, repeats: true)
                
                timer.fire()
        }
        @IBAction func select30seconds() {
            countdown = countdown + 30
            updatelabel()
        }
        @IBAction func select60secounds() {
              countdown = countdown + 60
            updatelabel()
        }
        @IBAction func select300secounds(){
            countdown = countdown + 300
            updatelabel()
        }
        @IBAction func select600sexounds(){
            countdown = countdown + 600
            updatelabel()
        }
    @IBAction func start() {
        startTimer(time: countdown)
        
    }
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func reset() {
        countdown = 0
        updatelabel()
    }    }













