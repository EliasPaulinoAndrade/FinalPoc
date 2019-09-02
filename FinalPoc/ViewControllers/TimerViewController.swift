//
//  TimerViewController.swift
//  FinalPoc
//
//  Created by Jessica Lewinter on 29/08/19.
//  Copyright © 2019 Elias Paulino. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerView: UIView!
    var seconds = 20
    var isTimerCreated = false
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timerLabel.text = timeString(time: TimeInterval(seconds))
        runTimer()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(fireTimer))
        timerView.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = true
    }
    
    @IBAction func finishedTask(_ sender: UIButton) {
        timer.invalidate()
        let alertController = UIAlertController(title: "Task", message: "Your task has been completed", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            self.runTimer()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func fireTimer(time: Int) {
        print("Time started!!!")
    }
    
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1
        if seconds >= 0 {
            timerLabel.text = timeString(time: TimeInterval(seconds))
        } else {
            timer.invalidate()
            print("Time stopped")
        }
    }
}
