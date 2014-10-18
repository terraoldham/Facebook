//
//  LoginViewController.swift
//  Facebook
//
//  Created by Terra Oldham on 10/16/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginActivity: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBAction func onClickLogin(sender: AnyObject) {
        loginButton.selected = true
        loginActivity.startAnimating()
        delay(2, closure: { () -> () in
            self.checkPassword()
            self.loginActivity.stopAnimating()
            self.loginButton.selected = false
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.enabled = false
        // Do any additional setup after loading the view.
    }

    @IBAction func onPasswordEditingChanged(sender: AnyObject) {
        checkButton()
    }
    @IBAction func onEmailEditingChanged(sender: AnyObject) {
        checkButton()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkButton () {
        if emailField.text.isEmpty || passwordField.text.isEmpty {
            loginButton.enabled = false
        }
        else {
            loginButton.enabled = true
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
        
    }
    func checkPassword () {
        if emailField.text == "email" && passwordField.text == "password" {
            //next page
            performSegueWithIdentifier("login segue", sender: self)
    
        }
        else {
            var alertView = UIAlertView(title: "Sign In Error", message: "Please enter the correct credentials.", delegate: self, cancelButtonTitle: "OK")
            alertView.show()

            //elsealertbutton
        }
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
