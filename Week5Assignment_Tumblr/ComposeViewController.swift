//
//  ComposeViewController.swift
//  Week5Assignment_Tumblr
//
//  Created by Paul Chong on 3/6/15.
//  Copyright (c) 2015 Paul Chong. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var quoteImage: UIImageView!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var linkImage: UIImageView!
    @IBOutlet weak var chatImage: UIImageView!
    @IBOutlet weak var textImage: UIImageView!
    
    
    
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImage.hidden = true
        super.viewDidLoad()
        delay(1) {
            self.photoImage.hidden = false
        }
        
        quoteImage.hidden = true
        super.viewDidLoad()
        delay(0.5) {
            self.quoteImage.hidden = false
        }

        textImage.hidden = true
        super.viewDidLoad()
        delay(0.3) {
            self.textImage.hidden = false
        }
        
        linkImage.hidden = true
        super.viewDidLoad()
        delay(0.8) {
            self.linkImage.hidden = false
        }
        
        videoImage.hidden = true
        super.viewDidLoad()
        delay(1.2) {
            self.videoImage.hidden = false
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    @IBAction func didTapOnNevermind(sender: UITapGestureRecognizer) {
        println("registering tap")
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
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
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
    
}

//  NEXT STEP:  Already setup the animated transitions between tabBarVC and composeVC.  Now need to create the animations with the circles.


