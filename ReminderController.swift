//
//  ReminderController.swift
//  Group6MC3
//
//  Created by Faris Ali Yafie on 23/07/20.
//  Copyright © 2020 Faris Ali Yafie. All rights reserved.
//

import UIKit
import UserNotifications

// This class has function to give user notifications
class ReminderController: UIViewController {

    // 1. Ask for permission
    let center = UNUserNotificationCenter.current()
    // 2. Create the notification content
    let content = UNMutableNotificationContent()
    // 3. Create the notification trigger
    let date = Date().addingTimeInterval(8)
    // 4. Create the request
    let uuidStr = UUID().uuidString
    
    func notification(){
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: uuidStr, content: content, trigger: trigger)
        
        // 5. Register the request
        center.add(request) { (error) in
            //Check the parameter and handle any errors
        }
    }
    
    func avoidAlcoholReminder() -> UNMutableNotificationContent{
        content.title = "Avoid Alcohol"
        content.body = "No more alcohol until sleep time"
        return content
    }
    func avoidEatReminder() -> UNMutableNotificationContent{
        content.title = "Avoid Late Eat"
        content.body = "No more eat until sleep time"
        return content
    }
    func avoidFaffeineReminder() -> UNMutableNotificationContent{
        content.title = "Avoid Caffeine"
        content.body = "No more caffeine consume until sleep time"
        return content
    }
    func avoidExerciseReminder() -> UNMutableNotificationContent{
        content.title = "Avoid Exercise"
        content.body = "No more exercise until sleep time"
        return content
    }
    func avoidSugarReminder() -> UNMutableNotificationContent{
        content.title = "Avoid Sugar"
        content.body = "No more sugar consume until sleep time"
        return content
    }
    func avoidGadgetReminder() -> UNMutableNotificationContent{
        content.title = "Avoid Gadget"
        content.body = "No more gadget use until sleep time"
        return content
    }
    func bedTimeReminder() -> UNMutableNotificationContent{
        content.title = "Bed Time"
        content.body = "Prepare for sleep time"
        return content
    }
    func encouragementReminder(){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
