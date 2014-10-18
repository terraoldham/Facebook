//
//  LogOutViewController.swift
//  Facebook
//
//  Created by Terra Oldham on 10/16/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class LogOutViewController: UIViewController, UIActionSheetDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        var actionSheet = UIActionSheet(title: "Log Out", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: "Log Out")
        actionSheet.showInView(view)
        performSegueWithIdentifier("logout segue", sender: self)
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func actionSheet(actionSheet: UIActionSheet!, clickedButtonAtIndex buttonIndex: Int) {
        
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
