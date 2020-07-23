//
//  ViewController.swift
//  Group6MC3
//
//  Created by Faris Ali Yafie on 21/07/20.
//  Copyright © 2020 Faris Ali Yafie. All rights reserved.
//

import UIKit

class SettingController: UIViewController {
    
    @IBOutlet weak var switchAlcohol: UISwitch!
    @IBOutlet weak var switchEat: UISwitch!
    @IBOutlet weak var switchCaffeine: UISwitch!
    @IBOutlet weak var switchExercise: UISwitch!
    @IBOutlet weak var switchSugar: UISwitch!
    @IBOutlet weak var switchGadget: UISwitch!
    @IBOutlet weak var switchBed: UISwitch!
    @IBOutlet weak var switchEncouragement: UISwitch!
    
    let reminder = ReminderController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func switchAction(_ sender: UISwitch) {
        if(switchAlcohol.isOn){
            print("no alcohol")
            reminder.avoidAlcoholReminder()
        }
        if(switchEat.isOn){
            print("no eat")
            reminder.avoidEatReminder()
        }
        if(switchCaffeine.isOn){
            print("no caffeine")
            reminder.avoidFaffeineReminder()
        }
        if(switchExercise.isOn){
            print("no exercise")
            reminder.avoidExerciseReminder()
        }
        if(switchSugar.isOn){
            print("no sugar")
            reminder.avoidSugarReminder()
        }
        if(switchGadget.isOn){
            print("no gadget")
            reminder.avoidGadgetReminder()
        }
        if(switchBed.isOn){
            print("reminder for bed time")
            reminder.bedTimeReminder()
        }
        if(switchEncouragement.isOn){
            print("For better life")
            reminder.encouragementReminder()
        }
        reminder.notification()
    }
    
    @IBAction func soundSetting(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func repeatSetting(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func typeSetting(_ sender: UITapGestureRecognizer) {
    }
    
}

