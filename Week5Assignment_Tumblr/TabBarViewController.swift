//
//  TabBarViewController.swift
//  Week5Assignment_Tumblr
//
//  Created by Paul Chong on 3/4/15.
//  Copyright (c) 2015 Paul Chong. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    // setting up buttons in tab bar
    @IBOutlet weak var homeButton: UIButton!
    var isHighLighted:Bool = false
    // calling and initializing images from images folder
    let home_icon = UIImage(named: "home_icon") as UIImage?
    let home_selected_icon = UIImage(named: "home_selected_icon") as UIImage?
    let trending_icon = UIImage(named: "trending_icon") as UIImage?
    let trending_selected_icon = UIImage(named: "trending_selected_icon") as UIImage?
    
    // setting up the subviews
    @IBOutlet weak var homeViewContainer: UIView!
    var homeViewController: HomeViewController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // adding highlighting behaviour for buttons
        homeButton.setImage(home_icon, forState: .Normal)
        homeButton.setImage(home_selected_icon, forState: .Highlighted)

        // defining storyboards
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as HomeViewController
        
        // adding view controllers to the view
        addChildViewController(homeViewController)
        homeViewController.view.frame = homeViewContainer.frame
        homeViewContainer.addSubview(homeViewController.view)
        homeViewController.didMoveToParentViewController(self)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func didPressHomeButton(sender: UIButton) {
        
        dispatch_async(dispatch_get_main_queue(), {
            
            if self.isHighLighted == false{
                sender.highlighted = true;
                self.isHighLighted = true
            }else{
                sender.highlighted = false;
                self.isHighLighted = false
            }
        })
        
    }
    
    @IBAction func didPressSearchButton(sender: AnyObject) {
    }
    
    @IBAction func didPressComposeButton(sender: AnyObject) {
    }
    
    @IBAction func didPressAccountButton(sender: AnyObject) {
    }
    
    @IBAction func didPressTrendingButton(sender: AnyObject) {
    }
    
    
}


// questions to address:
//  1. how to ensure when one button is highlighted, that all other buttons are no longer highlighted.  How to do this efficiently?
//  2. how to encapsulate the highlighting code in a function, instead of writing it out for each button.
//   - assume need to call image, create action, create variable for each button and iamge, but highlighting code should be modularised

//  Quesiton for Joe:  does it make sense to have a single view container on the hamburger referenced by all view controllers, or have one for each view controller?

