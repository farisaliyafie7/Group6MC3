//
//  ViewController.swift
//  Group6MC3
//
//  Created by Faris Ali Yafie on 21/07/20.
//  Copyright © 2020 Faris Ali Yafie. All rights reserved.
//

import UIKit

class SettingVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate{
    
    let reminder = ReminderController()
    
    @IBOutlet weak var switchAlcohol: UISwitch!
    @IBOutlet weak var switchEat: UISwitch!
    @IBOutlet weak var switchCaffeine: UISwitch!
    @IBOutlet weak var switchExercise: UISwitch!
    @IBOutlet weak var switchSugar: UISwitch!
    @IBOutlet weak var switchGadget: UISwitch!
    @IBOutlet weak var switchBed: UISwitch!
    @IBOutlet weak var switchEncouragement: UISwitch!
    
    @IBOutlet weak var soundLabel: UILabel!
    @IBOutlet weak var editableSound: UITextField!
    @IBOutlet weak var repeatLabel: UILabel!
    @IBOutlet weak var editableRepeat: UITextField!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var editableType: UITextField!
    
    var currentTextField = UITextField()
    var pickerView = UIPickerView()
    
    let soundList = ["Mute","Noise","Calm"]
    let repeatList = ["5 min", "10 min", "15 min", "20 min", "25 min", "30 min"]
    let typeList = ["Tone", "Tone + Vibrate", "Vibrate"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reminder.content.sound = .default
        customTextField()
        editableSound.delegate = self
        editableRepeat.delegate = self
        editableType.delegate = self
    }
    
    // clear all color and border UITextField
    func customTextField(){
        editableSound.backgroundColor = UIColor.clear
        editableRepeat.backgroundColor = UIColor.clear
        editableType.backgroundColor = UIColor.clear
        editableSound.borderStyle = .none
        editableRepeat.borderStyle = .none
        editableType.borderStyle = .none
        
        // default setting
        editableSound.text = soundList[1]
        editableRepeat.text = repeatList[0]
        editableType.text = typeList[1]
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
    
    // Start: Alarm Setting
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if currentTextField == editableSound{
            return soundList.count
        }else if currentTextField == editableRepeat{
            return repeatList.count
        }else if currentTextField == editableType{
            return typeList.count
        }else{
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if currentTextField == editableSound{
            return soundList[row]
        }else if currentTextField == editableRepeat{
            return repeatList[row]
        }else if currentTextField == editableType{
            return typeList[row]
        }else{
            return ""
        }
    }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if currentTextField == editableSound{
            editableSound.text = soundList[row]
        }else if currentTextField == editableRepeat{
            editableRepeat.text = repeatList[row]
        }else if currentTextField == editableType{
            editableType.text = typeList[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var attribute: String?
        if currentTextField == editableSound{
            attribute = soundList[row]
        }else if currentTextField == editableRepeat{
            attribute = repeatList[row]
        }else if currentTextField == editableType{
            attribute = typeList[row]
        }
        return NSAttributedString(string: attribute!, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        pickerView.dataSource = self
        pickerView.delegate = self
        
        currentTextField = textField
    
        if textField == editableSound{
            editableSound.inputView = pickerView
        } else if textField == editableRepeat{
            editableRepeat.inputView = pickerView
        }else if textField == editableType{
            editableType.inputView = pickerView
        }

        pickerView.backgroundColor = UIColor(red: 42/255, green: 36/255, blue: 57/255, alpha: 1)
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 255/255, green: 146/255, blue: 0/255, alpha: 1)
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector (categoryDoneClicked))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        //let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector (categoryDoneClicked)

        toolBar.setItems([spaceButton, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        currentTextField.inputAccessoryView = toolBar
    }
    
    @objc func categoryDoneClicked() {
         currentTextField.inputView = pickerView
         self.view.endEditing(true)
    }
    // End: Alarm Setting
}

