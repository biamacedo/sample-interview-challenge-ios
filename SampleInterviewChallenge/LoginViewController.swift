//
//  ViewController.swift
//  SampleInterviewChallenge
//
//  Created by Beatriz Macedo on 8/24/15.
//  Copyright (c) 2015 iOS Challenges. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submit(sender: AnyObject) {
        let usernameText = usernameField.text
        let passwordText = passwordField.text
        
        if (validateUsername(usernameText) && validatePassword(passwordText)){
            self.performSegueWithIdentifier("loginSegue", sender: sender)
        }
    }
    
    func validateUsername(text: String) -> Bool{
        // Checking each character of username if it's an alphabetic character
        for character in text {
            // Retrieving first character and separating of composed of multiple unicode characters
            let uni = String(character).unicodeScalars
            // Getting first char value from compost unicode
            let firstCharValue = uni[uni.startIndex].value
            // Checking if it is a letter character, if not returns false and shows error alert
            if !NSCharacterSet.letterCharacterSet().longCharacterIsMember(firstCharValue)  {
                sendAlert("Username Invalid", message: "Please input a username containing only letters.", button: "Back")
                return false
            }
        }
        // Checking if string length is bigger than 8, if not throws error alert
        if count(text) > 8  {
            return true
        }
        sendAlert("Username Invalid", message: "Please input a username more than 8 characters.", button: "Back")
        return false
    }
    
    func validatePassword(text: String) -> Bool{
        // Checking if string length is bigger than 8, if not throws error alert
        if count(text) > 8 {
            return true
        }
        sendAlert("Password Invalid", message: "Please input a password more than 8 characters.", button: "Back")
        return false
    }
    
    func sendAlert(title: String, message: String, button: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: button, style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

}

