//
//  ViewController.swift
//  LoginWithGoogle
//
//  Created by Boss on 18/02/2021.
//  Copyright © 2021 Boss. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil {
            print(user.userID!)
            let vc = storyboard?.instantiateViewController(identifier: "MasterViewController") as! MasterViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func onTapLoginGoogle(_sender: UIButton) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
    }
    
}

