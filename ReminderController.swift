//
//  ReminderController.swift
//  Group6MC3
//
//  Created by Faris Ali Yafie on 23/07/20.
//  Copyright © 2020 Faris Ali Yafie. All rights reserved.
//
import UserNotifications

// This class has function to give user notifications
class ReminderController{
    
    // 1. Ask for permission
    let center = UNUserNotificationCenter.current()
    // 2. Create the notification content
    let content = UNMutableNotificationContent()
    // 3. Create the notification trigger like...
    let date = Date().addingTimeInterval(15)
    // 4. Create the request for each reminder
    let uuidReminder = ["alcohol": UUID().uuidString,
                        "eat": UUID().uuidString,
                        "caffeine": UUID().uuidString,
                        "exercise": UUID().uuidString,
                        "sugar": UUID().uuidString,
                        "gadget": UUID().uuidString,
                        "bed": UUID().uuidString,
                        "encouragement": UUID().uuidString
                        ]
    
    // Start: add notification
    func avoidAlcoholReminder(){
        content.title = "Avoid Alcohol"
        content.body = "No more alcohol until sleep time"
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date().addingTimeInterval(10))
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: uuidReminder["alcohol"]!, content: content, trigger: trigger)
        // 5. Register to notification center
        center.add(request) { (error) in
            //Check the parameter and handle any errors
            }
    }
    func avoidEatReminder(){
        content.title = "Avoid Late Eat"
        content.body = "No more eat until sleep time"
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date().addingTimeInterval(15))
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: uuidReminder["eat"]!, content: content, trigger: trigger)
        center.add(request) { (error) in
            //Check the parameter and handle any errors
        }
    }
    func avoidFaffeineReminder(){
        content.title = "Avoid Caffeine"
        content.body = "No more caffeine consume until sleep time"
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date().addingTimeInterval(20))
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: uuidReminder["caffeine"]!, content: content, trigger: trigger)
        center.add(request) { (error) in
            //Check the parameter and handle any errors
        }
    }
    func avoidExerciseReminder(){
        content.title = "Avoid Exercise"
        content.body = "No more exercise until sleep time"
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date().addingTimeInterval(25))
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: uuidReminder["exercise"]!, content: content, trigger: trigger)
        center.add(request) { (error) in
            //Check the parameter and handle any errors
        }
    }
    func avoidSugarReminder(){
        content.title = "Avoid Sugar"
        content.body = "No more sugar consume until sleep time"
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date().addingTimeInterval(30))
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: uuidReminder["sugar"]!, content: content, trigger: trigger)
        center.add(request) { (error) in
            //Check the parameter and handle any errors
        }
    }
    func avoidGadgetReminder(){
        content.title = "Avoid Gadget"
        content.body = "No more gadget use until sleep time"
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date().addingTimeInterval(35))
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: uuidReminder["gadget"]!, content: content, trigger: trigger)
        center.add(request) { (error) in
            //Check the parameter and handle any errors
        }
    }
    func bedTimeReminder(){
        content.title = "Bed Time"
        content.body = "Prepare for sleep time"
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: uuidReminder["bed"]!, content: content, trigger: trigger)
        center.add(request) { (error) in
            //Check the parameter and handle any errors
        }
    }
    func encouragementReminder(){
        content.title = "Encouragement"
        content.body = "Test"
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date().addingTimeInterval(40))
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: uuidReminder["bed"]!, content: content, trigger: trigger)
        center.add(request) { (error) in
            //Check the parameter and handle any errors
        }
    }
    // End: add notification
    
    // Start: cancel notification
    func cancelAlcoholReminder(){
        center.removePendingNotificationRequests(withIdentifiers: [uuidReminder["alcohol"]!])
    }
    func cancelEatReminder(){
        center.removePendingNotificationRequests(withIdentifiers: [uuidReminder["eat"]!])
    }
    func cancelCaffeineReminder(){
        center.removePendingNotificationRequests(withIdentifiers: [uuidReminder["caffeine"]!])
    }
    func cancelExerciseReminder(){
        center.removePendingNotificationRequests(withIdentifiers: [uuidReminder["exercise"]!])
    }
    func cancelSugarReminder(){
        center.removePendingNotificationRequests(withIdentifiers: [uuidReminder["sugar"]!])
    }
    func cancelGadgetReminder(){
        center.removePendingNotificationRequests(withIdentifiers: [uuidReminder["gadget"]!])
    }
    func cancelBedReminder(){
        center.removePendingNotificationRequests(withIdentifiers: [uuidReminder["bed"]!])
    }
    func cancelEncouragementReminder(){
        
    }
    // End: cancel notification
}
