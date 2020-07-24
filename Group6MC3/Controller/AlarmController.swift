//
//  AlarmController.swift
//  Group6MC3
//
//  Created by Faris Ali Yafie on 23/07/20.
//  Copyright © 2020 Faris Ali Yafie. All rights reserved.
//

import UIKit

class AlarmController: UIViewController, UIPickerViewDelegate{

    let setting = SettingVC()
    
    let pickerView = UIPickerView()
    
    func createSoundPicker(){
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        //bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneSoundTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolbar.tintColor = UIColor(red: 255/255, green: 146/255, blue: 0/255, alpha: 1)
        toolbar.setItems([spaceButton, doneBtn], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        // assign picker to label
        
        // assign toolbar
        
        // picker mode
        
    }
    
    @objc func doneSoundTapped(){
        //formatter
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
