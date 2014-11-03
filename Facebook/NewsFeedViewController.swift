//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    @IBOutlet weak var imageViewOne: UIImageView!
    @IBOutlet weak var imageViewTwo: UIImageView!
    @IBOutlet weak var imageViewThree: UIImageView!
    @IBOutlet weak var imageViewFour: UIImageView!
    @IBOutlet weak var imageViewFive: UIImageView!
    var image: UIImage!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    var isPresenting: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
    }

    @IBAction func onImage1(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("zoom segue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as PhotosViewController
        destinationViewController.image = sender.view! as UI
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
            var photoVC = toViewController as PhotosViewController
            imageViewOne.hidden = true
            photoVC.imageView.hidden = true
            toViewController.view.alpha = 0
            
            
            var window = UIApplication.sharedApplication().keyWindow
            var newPhoto = UIImageView(frame: imageViewOne.frame)
            newPhoto.image = imageViewOne.image
            newPhoto.contentMode = imageViewOne.contentMode
            //window.addSubview(newPhoto)
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                newPhoto.frame = photoVC.imageView.frame
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    //newPhoto.removeFromSuperview()
                    photoVC.imageView.hidden = false
                    transitionContext.completeTransition(true)
            }
        } else {
            var feedVC = toViewController as NewsFeedViewController
            var window = UIApplication.sharedApplication().keyWindow
            imageViewOne.hidden = true
            //feedVC.imageViewOne.hidden = true
            
            var smallPhoto = UIImageView(frame: imageViewOne.frame)
            smallPhoto.image = imageViewOne.image
            smallPhoto.contentMode = imageViewOne.contentMode
            //window.addSubview(smallPhoto)
            
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
                    //smallPhoto.removeFromSuperview()
                    feedVC.imageViewOne.hidden = false
            }
        }
    }
    
    
 
    //@IBAction func onImage2(sender: UITapGestureRecognizer) {
        //two
        //func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
            //var destinationViewController = segue.destinationViewController as PhotosViewController
            //destinationViewController.image = self.imageViewTwo.image
        //}
        //performSegueWithIdentifier("zoom segue", sender: self)
    //}
    
    //@IBAction func onImage3(sender: UITapGestureRecognizer) {
        //three
        //func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
            //var destinationViewController = segue.destinationViewController as PhotosViewController
            //destinationViewController.image = self.imageViewThree.image
        //}
        //performSegueWithIdentifier("zoom segue", sender: self)
    //}

    
    //@IBAction func onImage4(sender: UITapGestureRecognizer) {
        //four
        //func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
            //var destinationViewController = segue.destinationViewController as PhotosViewController
            //destinationViewController.image = self.imageViewFour.image
        //}
        //performSegueWithIdentifier("zoom segue", sender: self)
    //}
    
    //@IBAction func onImage5(sender: UITapGestureRecognizer) {
        //five
        //func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
            //var destinationViewController = segue.destinationViewController as PhotosViewController
            //destinationViewController.image = self.imageViewFive.image
        //}
        //performSegueWithIdentifier("zoom segue", sender: self)
    //}
    
   // override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        //var destinationViewController = segue.destinationViewController as PhotosViewController
        //destinationViewController.image = self.imageView.image
        
    //}
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
}
