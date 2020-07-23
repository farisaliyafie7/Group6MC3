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
        reminder.content.sound = .default
        // Do any additional setup after loading the view.
    }
    
    // Start : All Switch Actions
    @IBAction func alcoholSwitched(_ sender: UISwitch) {
        if(switchAlcohol.isOn){
            print("no alcohol")
            reminder.avoidAlcoholReminder()
        }
    }
    @IBAction func eatSwitched(_ sender: UISwitch) {
        if(switchEat.isOn){
            print("no eat")
            reminder.avoidEatReminder()
        }
    }
    @IBAction func caffeineSwitched(_ sender: UISwitch) {
        if(switchCaffeine.isOn){
            print("no caffeine")
            reminder.avoidFaffeineReminder()
        }
    }
    @IBAction func exerciseSwitched(_ sender: UISwitch) {
        if(switchExercise.isOn){
            print("no exercise")
            reminder.avoidExerciseReminder()
        }
    }
    @IBAction func sugarSwitched(_ sender: UISwitch) {
        if(switchSugar.isOn){
            print("no sugar")
            reminder.avoidSugarReminder()
        }
    }
    @IBAction func gadgetSwitched(_ sender: UISwitch) {
        if(switchGadget.isOn){
            print("no gadget")
            reminder.avoidGadgetReminder()
        }
    }
    @IBAction func bedSwitched(_ sender: UISwitch) {
        if(switchBed.isOn){
            print("reminder for bed time")
            reminder.bedTimeReminder()
        }
    }
    @IBAction func encouragementSwitched(_ sender: UISwitch) {
        if(switchEncouragement.isOn){
            print("For better life")
            reminder.encouragementReminder()
        }
    }
    // End: All Switch Actions
    
    @IBAction func soundSetting(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func repeatSetting(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func typeSetting(_ sender: UITapGestureRecognizer) {
    }
    
}

