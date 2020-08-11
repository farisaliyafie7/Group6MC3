//
//  ClockVC.swift
//  Group6MC3
//
//  Created by Glendito Jeremiah Palendeng on 21/07/20.
//  Copyright © 2020 Faris Ali Yafie. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

struct PersonModel {
    let bedTime : String
    let wakeTime: String
}

class ClockVC: UIViewController, AVAudioPlayerDelegate {
    
    
    @IBOutlet weak var sleepScheduleOutlet: UIButton!
    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var sleepButtonOutlet: UIButton!
    @IBOutlet weak var bigLabel: UILabel!
    @IBOutlet weak var smallLabel: UILabel!
    
    
    @IBOutlet weak var bedtimeLabel: UILabel!
    @IBOutlet weak var waketimeLabel: UILabel!
    
    let setting = SettingVC()
    var audioPlayer : AVAudioPlayer!
    var snoozeTemp : String = ""
    
    
    
    var timer = Timer()
    var timer2 = Timer()
    var timer3 = Timer()
    
    var isOrange : Bool = false

    var timeToSleep : Bool = false
    var tappedSleep : Bool = false
    var tappedWake : Bool = false
    var successRate : Bool = false
    
    
    
    var set = setSchedule()
    
    let alert = UIAlertController(title: "Alarm", message: "It's time to wake up!", preferredStyle: .alert)
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sleepScheduleOutlet.layer.cornerRadius = 5
        sleepScheduleOutlet.layer.shadowRadius = 5
        sleepScheduleOutlet.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        print(UserDefaults.standard.dictionaryRepresentation().keys)
        
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector:#selector(updatePerSecond) , userInfo: nil, repeats: true)
        setWakeBedTime()
        
        retrieve()
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        timer2 = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector:#selector(checkTimeDidAppear) , userInfo: nil, repeats: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        retrieve()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        if  Core.shared.isNewUser(){
//        let vc = storyboard?.instantiateViewController(identifier: "pageCtrl") as! PageCtrlOnboardingVC
//            vc.modalPresentationStyle = .fullScreen
//            present(vc,animated: true)
//        }
    }
    
    @IBAction func sleepButtonTapped(_ sender: Any) {
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
        
    }
    
    func checkTime(){
        // waktunya untuk bangun
        if clockLabel.text == waketimeLabel.text && tappedWake == false {
            sleepButtonOutlet.setImage(#imageLiteral(resourceName: "Wake Button"), for: .normal)
            clockLabel.textColor = UIColor.white
            isOrange = true
            bigLabel.text = "Wake Up!"
            smallLabel.text = "Tap when you wake up"
            timeToSleep = false
            tappedSleep = false
             
            //play sound and vibrate
            
            if setting.defaults.String(forKey: "AlarmMode") == "Tone"{
                alarmSound()
            }
            else if setting.defaults.String(forKey: "AlarmMode") == "Vibrate"{
                vibrate()
            }
            else if setting.defaults.String(forKey: "AlarmMode") == "Tone + Vibrate"{
                alarmSound()
                vibrate()
            }
        }
            
        //waktunya untuk tidur
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
    @objc func checkTimeDidAppear(){
        if clockLabel.text == waketimeLabel.text && tappedWake == false {
            showAlarmAlert()
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
        if set.people.isEmpty == true{
            waketimeLabel.text = "-"
            bedtimeLabel.text = "-"
        }
        else{
            
            waketimeLabel.text = set.people[0].value(forKeyPath: "wakeTime") as? String
            bedtimeLabel.text = set.people[0].value(forKeyPath: "bedTime") as? String
            
        }
    }
    func retrieve() -> [PersonModel]{
        //1
            var person = [PersonModel]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            let managedContext =
              appDelegate.persistentContainer.viewContext
            
            //2
            let fetchRequest =
              NSFetchRequest<NSManagedObject>(entityName: "Person")
            
            //3
            do {
                let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
                    if set.people.isEmpty == true{
                              waketimeLabel.text = "-"
                              bedtimeLabel.text = "-"
                          }
                          else{
                              waketimeLabel.text = result[0].value(forKeyPath: "wakeTime") as? String
                              bedtimeLabel.text = result[0].value(forKeyPath: "bedTime") as? String
                              
                          }
                
            } catch let error as NSError {
              print("Could not fetch. \(error), \(error.userInfo)")
            
            
        }
            return person
    }
    
    func alarmSound(){
        // set alarm sound
        if setting.defaults.String(forKey: "Sound") == "noise"{
            playSound("Annoying_Alarm2")
        }
        else if setting.defaults.String(forKey: "Sound") == "calm"{
            playSound("Relaxing_Alarm2")
        }
        else if setting.defaults.String(forKey: "Sound") == "mute"{

        }
        
    }
    
    func vibrate(){
        //vibrate phone first
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        //set vibrate callback
        AudioServicesAddSystemSoundCompletion(SystemSoundID(kSystemSoundID_Vibrate),nil,
                                              nil,
                                              { (_:SystemSoundID, _:UnsafeMutableRawPointer?) -> Void in
                                                print("callback", terminator: "") //todo
        },
                                              nil)
    }
    
    func cancelVibrate(){
        AudioServicesRemoveSystemSoundCompletion(kSystemSoundID_Vibrate)
    }
    
    
    func playSound(_ soundName: String) {

        let url = URL(
            fileURLWithPath: Bundle.main.path(forResource: soundName, ofType: "mp3")!)

        var error: NSError?

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        } catch let error1 as NSError {
            error = error1
            audioPlayer = nil
        }

        if let err = error {
            print("audioPlayer error \(err.localizedDescription)")
        } else {
            audioPlayer!.delegate = self
            audioPlayer!.prepareToPlay()
        }
        //negative number means loop infinity
        audioPlayer!.numberOfLoops = -1
        audioPlayer!.play()
    }
    
    func showAlarmAlert(){
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (action:UIAlertAction!) in
            self.dismissAlarm()
        } ))
        alert.addAction(UIAlertAction(title: "Snooze", style: .default, handler:{ (action:UIAlertAction!) in
            self.snoozeAlarm()
        } ))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    func dismissAlarm(){
        audioPlayer!.stop()
        audioPlayer!.currentTime = 0
        cancelVibrate()
        timer3.invalidate()
        
    }
    
    func snoozeAlarm(){
            
            timer3 = Timer.scheduledTimer(timeInterval: 600, target: self, selector:#selector(doesSnooze) , userInfo: nil, repeats: true)
        
    }
    
    @objc func doesSnooze (){
        showAlarmAlert()
    }
    @IBAction func unwindToHome (_ sender:UIStoryboardSegue){
        
    }
   

}

class Core {
    static let shared = Core()
    
    func isNewUser() -> Bool{
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setIsNotNewUser(){
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}
