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
    // 4. Create the request like...
    let uuidStr = UUID().uuidString
    
    func avoidAlcoholReminder(){
        content.title = "Avoid Alcohol"
        content.body = "No more alcohol until sleep time"
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date().addingTimeInterval(10))
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let uuidAlcohol = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidAlcohol, content: content, trigger: trigger)
        center.add(request) { (error) in
            //Check the parameter and handle any errors
        }
    }
    func avoidEatReminder(){
        content.title = "Avoid Late Eat"
        content.body = "No more eat until sleep time"
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date().addingTimeInterval(15))
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let uuidEat = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidEat, content: content, trigger: trigger)
        center.add(request) { (error) in
            //Check the parameter and handle any errors
        }
    }
    func avoidFaffeineReminder(){
        content.title = "Avoid Caffeine"
        content.body = "No more caffeine consume until sleep time"
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date().addingTimeInterval(20))
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let uuidCaffeine = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidCaffeine, content: content, trigger: trigger)
        center.add(request) { (error) in
            //Check the parameter and handle any errors
        }
    }
    func avoidExerciseReminder(){
        content.title = "Avoid Exercise"
        content.body = "No more exercise until sleep time"
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date().addingTimeInterval(25))
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let uuidExercise = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidExercise, content: content, trigger: trigger)
        center.add(request) { (error) in
            //Check the parameter and handle any errors
        }
    }
    func avoidSugarReminder(){
        content.title = "Avoid Sugar"
        content.body = "No more sugar consume until sleep time"
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date().addingTimeInterval(30))
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let uuidSugar = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidSugar, content: content, trigger: trigger)
        center.add(request) { (error) in
            //Check the parameter and handle any errors
        }
    }
    func avoidGadgetReminder(){
        content.title = "Avoid Gadget"
        content.body = "No more gadget use until sleep time"
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date().addingTimeInterval(35))
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let uuidGadget = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidGadget, content: content, trigger: trigger)
        center.add(request) { (error) in
            //Check the parameter and handle any errors
        }
    }
    func bedTimeReminder(){
        content.title = "Bed Time"
        content.body = "Prepare for sleep time"
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let uuidBed = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidBed, content: content, trigger: trigger)
        center.add(request) { (error) in
            //Check the parameter and handle any errors
        }
    }
    func encouragementReminder(){
        
    }
}
