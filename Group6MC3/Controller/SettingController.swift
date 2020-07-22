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
        switch sender.isOn{
        case switchAlcohol.isOn : print("no alcohol");
        case switchEat.isOn : print("no eat");
            case switchCaffeine.isOn : print("no caffeine");
            case switchExercise.isOn : print("no exercise");
            case switchSugar.isOn : print("no sugar");
            case switchGadget.isOn : print("no gadget");
            case switchBed.isOn : print("reminder bed time");
            case switchEncouragement.isOn : print("");
            default : print("nothing")
        }
    }
    
 
}

