//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    var image: UIImage!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    var isPresenting: Bool = true
    var currentSender: UIImageView!
    var newPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
    }

    @IBAction func onImage1(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("zoom segue", sender: sender)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as PhotosViewController
        currentSender = sender.view! as UIImageView
        destinationViewController.image = currentSender.image
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = self
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            var newPhotoFrame = view.convertRect(currentSender.frame, fromView: currentSender.superview)
            newPhoto = UIImageView(frame: newPhotoFrame)
            
            var photoVC = toViewController as PhotosViewController
            var transitionFrame = view.convertRect(photoVC.imageView.frame, fromView: photoVC.imageView.superview)
            var window = UIApplication.sharedApplication().keyWindow
            var photoCenter = newPhoto.center
            
            newPhoto.image = photoVC.image
            newPhoto.frame.size = imageSizing(newPhoto)
            newPhoto.center = photoCenter
            newPhoto.image = photoVC.image
            newPhoto.contentMode = UIViewContentMode.ScaleAspectFit
            window.addSubview(newPhoto)
            toViewController.view.alpha = 0
        
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.newPhoto.frame = transitionFrame
                toViewController.view.alpha = 1
                photoVC.imageView.hidden = true
                
                }) { (finished: Bool) -> Void in
                    self.newPhoto.removeFromSuperview()
                    photoVC.imageView.hidden = false
                    transitionContext.completeTransition(true)
            }
        } else {
            //containerView.addSubview(toViewController.view)
            
            var photoVC = fromViewController as PhotosViewController
            var transitionFrame = view.convertRect(currentSender.frame, fromView: photoVC.imageView.superview)
            var window = UIApplication.sharedApplication().keyWindow
            var secondPhotoFrame = view.convertRect(photoVC.imageView.frame, fromView: photoVC.imageView.superview)
            var secondPhoto = UIImageView(frame: secondPhotoFrame)
            var secondCenter = currentSender.center
            
            //secondPhoto.frame.size = currentSender.frame.size
            secondPhoto.image = photoVC.imageView.image
            secondPhoto.contentMode = UIViewContentMode.ScaleAspectFill
            window.addSubview(secondPhoto)
            toViewController.view.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                //secondPhoto.view.frame.size = self.view.currentSender.frame.size
                secondPhoto.frame.size = transitionFrame.size
                secondPhoto.center.y = secondCenter.y + 110
                secondPhoto.center.x = secondCenter.x
                photoVC.view.hidden = true
                photoVC.view.alpha = 0
                toViewController.view.alpha = 1
                
                }) { (finished: Bool) -> Void in
                    secondPhoto.removeFromSuperview()
                    photoVC.view.removeFromSuperview()
                    transitionContext.completeTransition(true)
                    
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
   func imageSizing(imageView: UIImageView) -> CGSize {
    var newSize = imageView.frame.size
    if (imageView.frame.height / imageView.frame.width) < (imageView.image!.size.height / imageView.image!.size.width) {
        newSize.height = imageView.image!.size.height / imageView.image!.size.width * imageView.frame.width
    } else {
        newSize.width = imageView.image!.size.width / imageView.image!.size.height * imageView.frame.height
    }
        return newSize
   }
    

}