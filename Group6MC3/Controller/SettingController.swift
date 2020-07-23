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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func switchAction(_ sender: UISwitch) {
        if(switchAlcohol.isOn){
            print("no alcohol")
        }else{
            print("nothing")
        }
        if(switchEat.isOn){
            print("no eat")
        }else{
            print("nothing")
        }
        if(switchCaffeine.isOn){
            print("no caffeine")
        }else{
            print("nothing")
        }
        if(switchExercise.isOn){
            print("no exercise")
        }else{
            print("nothing")
        }
        if(switchSugar.isOn){
            print("no sugar")
        }else{
            print("nothing")
        }
        if(switchGadget.isOn){
            print("no gadget")
        }else{
            print("nothing")
        }
        if(switchBed.isOn){
            print("reminder for bed time")
        }else{
            print("nothing")
        }
        if(switchEncouragement.isOn){
            print("For better life")
        }else{
            print("nothing")
        }
    }
    
    @IBAction func soundSetting(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func repeatSetting(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func typeSetting(_ sender: UITapGestureRecognizer) {
    }
    
}

