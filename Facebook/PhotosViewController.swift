//
//  PhotosViewController.swift
//  Facebook
//
//  Created by Terra Oldham on 11/2/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!
    var xOffset: CGFloat!
    var yOffset: CGFloat!
    
    @IBOutlet weak var actionsView: UIImageView!
    @IBOutlet weak var doneImageView: UIImageView!
    @IBAction func onDoneClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return imageView
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        //var point = scrollView.locationInView(view)
        //var velocity = scrollView.velocityInView(view)
        //var translation = scrollView.translationInView(view)
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.doneImageView.alpha = 0
            self.actionsView.alpha = 0
        })
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            self.doneImageView.alpha = 1
            self.actionsView.alpha = 1
            yOffset = scrollView.contentOffset.y
            if yOffset > 100 {
                dismissViewControllerAnimated(true, completion: nil)
            }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        scrollView.contentSize = CGSize(width: 320, height: 1000)
        scrollView.delegate = self
        

        
    }

}
