//
//  PhotosViewController.swift
//  Facebook
//
//  Created by Terra Oldham on 11/2/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet var viewView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!
    var xOffset: CGFloat!
    var yOffset: CGFloat!
    var imageCenter: CGFloat!
    
    @IBOutlet weak var actionsView: UIImageView!
    @IBOutlet weak var doneImageView: UIImageView!
    @IBAction func onDoneClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return imageView
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        imageCenter = imageView.center.y
        println(imageCenter)
        println(imageCenter)
        yOffset = scrollView.contentOffset.y
        var alphaColorPercent = 1 - yOffset / (568 / 2)
        println(yOffset)
        println(alphaColorPercent)
        self.viewView.backgroundColor = UIColor(white: 0, alpha: alphaColorPercent)
    
        
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.doneImageView.alpha = 0
            self.actionsView.alpha = 0
        })
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            self.viewView.backgroundColor = UIColor(white: 0, alpha: 1)
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
