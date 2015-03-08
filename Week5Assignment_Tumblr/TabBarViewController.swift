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
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
    //create button array
    @IBOutlet var buttons: [UIButton]!
    var selectedIndex: Int! = 0
    
    // calling and initializing images from images folder
    let home_icon = UIImage(named: "home_icon") as UIImage?
    let home_selected_icon = UIImage(named: "home_selected_icon") as UIImage?
    let trending_icon = UIImage(named: "trending_icon") as UIImage?
    let trending_selected_icon = UIImage(named: "trending_selected_icon") as UIImage?
    let account_icon = UIImage(named: "account_icon") as UIImage?
    let account_selected_icon = UIImage(named: "account_selected_icon") as UIImage?
    let search_icon = UIImage(named: "search_icon") as UIImage?
    let search_selected_icon = UIImage(named: "search_selected_icon") as UIImage?

    
    // setting up the subviews
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!

    
    // create array to hold view controllers
    var viewControllersArray: [UIViewController]! = [UIViewController]()
    
    @IBOutlet weak var contentViewContainer: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // adding highlighting behaviour for buttons
        homeButton.setImage(home_icon, forState: .Normal)
        homeButton.setImage(home_selected_icon, forState: .Highlighted)
        accountButton.setImage(account_icon, forState: .Normal)
        accountButton.setImage(account_selected_icon, forState: .Highlighted)
        trendingButton.setImage(trending_icon, forState: .Normal)
        trendingButton.setImage(trending_selected_icon, forState: .Highlighted)
        searchButton.setImage(search_icon, forState: .Normal)
        searchButton.setImage(search_selected_icon, forState: .Highlighted)
        
        // defining storyboards
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
      
        // all other view controllers
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        
        viewControllersArray = [homeViewController, searchViewController, searchViewController, accountViewController, trendingViewController]
        
        addChildViewController(viewControllersArray[selectedIndex])
        viewControllersArray[selectedIndex].view.frame = contentViewContainer.frame
        contentViewContainer.addSubview(viewControllersArray[selectedIndex].view)
        viewControllersArray[selectedIndex].didMoveToParentViewController(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        var destinationVC = segue.destinationViewController as UIViewController
//        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
//        destinationVC.transitioningDelegate = self
//        
//    }
        
    @IBAction func didPressTabBar(sender: UIButton) {
        println(sender.tag)
        selectedIndex = sender.tag
        
        for button in buttons {
            button.highlighted = false
        }
        
        dispatch_async(dispatch_get_main_queue(), {
            if self.buttons[self.selectedIndex].highlighted == false{
                sender.highlighted = true;
                self.buttons[self.selectedIndex].highlighted = true
            }else{
                sender.highlighted = false;
                self.buttons[self.selectedIndex].highlighted = false
            }
        })
        
        addChildViewController(viewControllersArray[selectedIndex])
        viewControllersArray[selectedIndex].view.frame = contentViewContainer.frame
        contentViewContainer.addSubview(viewControllersArray[selectedIndex].view)
        viewControllersArray[selectedIndex].didMoveToParentViewController(self)
        
    }
    
}

// Next Steps:
//  0. connect the tap gesture on composeVC to an event in tabBarVC - refer to previous projects
//  1. complete the unhighlightButtons function:  when called it ensures all buttons revert to unhighlighted mode


// questions to address:
//  1. how to ensure when one button is highlighted, that all other buttons are no longer highlighted.  How to do this efficiently?
//  2. how to encapsulate the highlighting code in a function, instead of writing it out for each button.
//   - assume need to call image, create action, create variable for each button and iamge, but highlighting code should be modularised

//  Quesiton for Joe:  does it make sense to have a single view container on the hamburger referenced by all view controllers, or have one for each view controller?

