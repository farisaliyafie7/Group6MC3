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
            reminder.avoidAlcoholReminder()
        }else{
            reminder.cancelAlcoholReminder()
        }
    }
    @IBAction func eatSwitched(_ sender: UISwitch) {
        if(switchEat.isOn){
            reminder.avoidEatReminder()
        }else{
            reminder.cancelEatReminder()
        }
    }
    @IBAction func caffeineSwitched(_ sender: UISwitch) {
        if(switchCaffeine.isOn){
            reminder.avoidFaffeineReminder()
        }else{
            reminder.cancelCaffeineReminder()
        }
    }
    @IBAction func exerciseSwitched(_ sender: UISwitch) {
        if(switchExercise.isOn){
            reminder.avoidExerciseReminder()
        }else{
            reminder.cancelExerciseReminder()
        }
    }
    @IBAction func sugarSwitched(_ sender: UISwitch) {
        if(switchSugar.isOn){
            reminder.avoidSugarReminder()
        }else{
            reminder.cancelSugarReminder()
        }
    }
    @IBAction func gadgetSwitched(_ sender: UISwitch) {
        if(switchGadget.isOn){
            reminder.avoidGadgetReminder()
        }else{
            reminder.cancelGadgetReminder()
        }
    }
    @IBAction func bedSwitched(_ sender: UISwitch) {
        if(switchBed.isOn){
            reminder.bedTimeReminder()
        }else{
            reminder.cancelBedReminder()
        }
    }
    @IBAction func encouragementSwitched(_ sender: UISwitch) {
        if(switchEncouragement.isOn){
            reminder.encouragementReminder()
        }else{
            reminder.cancelEncouragementReminder()
        }
    }
    // End: All Switch Actions
    
    // Start: All Alarm Tap Gesture Action
    @IBAction func soundSetting(_ sender: UITapGestureRecognizer) {
        
    }
    @IBAction func repeatSetting(_ sender: UITapGestureRecognizer) {
        
    }
    @IBAction func typeSetting(_ sender: UITapGestureRecognizer) {
        
    }
    // End: All Alarm Tap Gesture Action
}

