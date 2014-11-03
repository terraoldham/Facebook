//
//  PhotosViewController.swift
//  Facebook
//
//  Created by Terra Oldham on 11/2/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!
    
    @IBAction func onDoneClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image

    }

}
