//
//  ViewController.swift
//  PubliCarro
//
//  Created by Filipe da Silva Oliveira on 08/09/15.
//  Copyright © 2015 TambaTech. All rights reserved.
//

import UIKit
import Parse
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func Login(){
        PFUser.logInWithUsernameInBackground("myUsername", password:"myPassword") {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                print("Login successful")
                print("----\n%@", user?.email)
            } else {
                print("Login failed")
            }
        }

    }
    func SaveUser() {
        let user = PFUser()
        user.username = "myUsername"
        user.password = "myPassword"
        user.email = "email@example.com"
        // other fields can be set just like with PFObject
        user["phone"] = "415-392-0202"
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                print(errorString)
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

