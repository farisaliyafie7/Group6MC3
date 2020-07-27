//
//  ClockVC.swift
//  Group6MC3
//
//  Created by Glendito Jeremiah Palendeng on 21/07/20.
//  Copyright © 2020 Faris Ali Yafie. All rights reserved.
//

import UIKit

class ClockVC: UIViewController {
    
    
    @IBOutlet weak var sleepScheduleOutlet: UIButton!
    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var sleepButtonOutlet: UIButton!
    @IBOutlet weak var bigLabel: UILabel!
    @IBOutlet weak var smallLabel: UILabel!
    
    
    @IBOutlet weak var bedtimeLabel: UILabel!
    @IBOutlet weak var waketimeLabel: UILabel!
    
    var timer = Timer()
    var isOrange : Bool = false
    var bedRecieved : String = ""
    var wakeRecieved : String = ""
    var timeToSleep : Bool = false
    var tappedSleep : Bool = false
    var tappedWake : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sleepScheduleOutlet.layer.cornerRadius = 5
        sleepScheduleOutlet.layer.shadowRadius = 5
        sleepScheduleOutlet.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector:#selector(updatePerSecond) , userInfo: nil, repeats: true)
        
    }
    
    @IBAction func sleepButtonTapped(_ sender: Any) {
//        if isWake == true{
//            sleepButtonOutlet.setImage(#imageLiteral(resourceName: "Wake Button"), for: .normal)
//            clockLabel.textColor = UIColor.white
//            isWake = false
//            bigLabel.text = "Wake Up!"
//        }
//        else if isWake == false{
//            sleepButtonOutlet.setImage(#imageLiteral(resourceName: "Sleep Button"), for: .normal)
//            clockLabel.textColor = #colorLiteral(red: 1, green: 0.5444618464, blue: 0, alpha: 1)
//            isWake = true
//            bigLabel.text = "Sleep Time!"
//        }
        
        if timeToSleep == false && isOrange == true{
            sleepButtonOutlet.setImage(#imageLiteral(resourceName: "Sleep Button"), for: .normal)
            clockLabel.textColor = #colorLiteral(red: 1, green: 0.5444618464, blue: 0, alpha: 1)
            bigLabel.text = "Rise and Shine!"
            smallLabel.text = "Tap when you're going to sleep"
            isOrange = false
            tappedWake = true
            
        }
        else if timeToSleep == true && isOrange == true{
            sleepButtonOutlet.setImage(#imageLiteral(resourceName: "Sleep Button"), for: .normal)
            clockLabel.textColor = #colorLiteral(red: 1, green: 0.5444618464, blue: 0, alpha: 1)
            bigLabel.text = "Sweet Dreams!"
            smallLabel.text = "Tap when you wake up"
            isOrange = false
            tappedSleep = true
        }
        
    }
    
    @IBAction func setSleepSchedule(_ sender: Any) {
        
    }
    
    @objc func updatePerSecond(){
        displayClock()
        checkTime()
        setWakeBedTime()
    }
    
    func checkTime(){
        if clockLabel.text == waketimeLabel.text && tappedWake == false{
            sleepButtonOutlet.setImage(#imageLiteral(resourceName: "Wake Button"), for: .normal)
            clockLabel.textColor = UIColor.white
            isOrange = true
            bigLabel.text = "Wake Up!"
            smallLabel.text = "Tap when you wake up"
            timeToSleep = false
            tappedSleep = false
            
        }
        else if clockLabel.text == bedtimeLabel.text && tappedSleep == false {
            sleepButtonOutlet.setImage(#imageLiteral(resourceName: "Wake Button"), for: .normal)
            clockLabel.textColor = UIColor.white
            isOrange = true
            bigLabel.text = "Sleep Time!"
            smallLabel.text = "Tap when you're going to sleep"
            timeToSleep = true
            tappedWake = false
        }
    }
    
    func displayClock(){
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        if hour < 10 && minute < 10{
            clockLabel.text = "0\(hour):0\(minute)"
        }
        else if hour < 10 {
            clockLabel.text = "0\(hour):\(minute)"
        }
        else if minute < 10{
            clockLabel.text = "\(hour):0\(minute)"
        }
        else{
            clockLabel.text = "\(hour):\(minute)"
        }
    }
    func setWakeBedTime(){
        if wakeRecieved == ""{
            waketimeLabel.text = "-"
            bedtimeLabel.text = "-"
        }
        else{
            waketimeLabel.text = wakeRecieved
            bedtimeLabel.text = bedRecieved
        }
    }
    
    @IBAction func unwindToHome (_ sender:UIStoryboardSegue){
        
    }
   
}
