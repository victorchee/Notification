//
//  ViewController.swift
//  Notification
//
//  Created by qihaijun on 11/10/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Actions
        let acceptAction = UIMutableUserNotificationAction()
        acceptAction.identifier = "ACCEPT_ACTION"
        acceptAction.title = "Accept"
        acceptAction.activationMode = .Background
        acceptAction.destructive = false
        acceptAction.authenticationRequired = false
        
        let destructAction = UIMutableUserNotificationAction()
        destructAction.identifier = "DESTRUCT_ACTION"
        destructAction.title = "Destruct"
        destructAction.activationMode = .Background
        destructAction.destructive = true
        destructAction.authenticationRequired = false
        
        // Category
        let category = UIMutableUserNotificationCategory()
        category.identifier = "CATEGORY"
        let actions = [acceptAction, destructAction]
        category.setActions(actions, forContext: .Default)
        category.setActions(actions, forContext: .Minimal)
        
        // Registration
        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: [category])
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func postNotification(sender: UIButton) {
        let notification = UILocalNotification()
        notification.fireDate = NSDate().dateByAddingTimeInterval(10.0)
        notification.alertBody = "Local Notification with actions"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.category = "CATEGORY"
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }

}

