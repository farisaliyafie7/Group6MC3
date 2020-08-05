//
//  OnboardingVC.swift
//  Group6MC3
//
//  Created by Glendito Jeremiah Palendeng on 29/07/20.
//  Copyright © 2020 Faris Ali Yafie. All rights reserved.
//

import UIKit

class OnboardingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func getStarted(_ sender: Any) {
        Core.shared.setIsNotNewUser()
        dismiss(animated: true, completion: nil)
    }
    
}

class Core {
    static let shared = Core()
    
    func isNewUser() -> Bool{
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setIsNotNewUser(){
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}
