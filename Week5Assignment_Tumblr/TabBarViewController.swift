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
    var homeIsHighLighted:Bool = false
    
    @IBOutlet weak var accountButton: UIButton!
    var accountIsHighLighted:Bool = false
    
    // calling and initializing images from images folder
    let home_icon = UIImage(named: "home_icon") as UIImage?
    let home_selected_icon = UIImage(named: "home_selected_icon") as UIImage?
    let trending_icon = UIImage(named: "trending_icon") as UIImage?
    let trending_selected_icon = UIImage(named: "trending_selected_icon") as UIImage?
    let account_icon = UIImage(named: "account_icon") as UIImage?
    let account_selected_icon = UIImage(named: "account_selected_icon") as UIImage?
    
    
    // setting up the subviews
    @IBOutlet weak var homeViewContainer: UIView!
    var homeViewController: HomeViewController!
    
    @IBOutlet weak var accountViewContainer: UIView!
    var accountViewController: AccountViewController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // adding highlighting behaviour for buttons
        homeButton.setImage(home_icon, forState: .Normal)
        homeButton.setImage(home_selected_icon, forState: .Highlighted)
        accountButton.setImage(account_icon, forState: .Normal)
        accountButton.setImage(account_selected_icon, forState: .Highlighted)

        
        // defining storyboards
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as HomeViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as AccountViewController
        
        // adding view controllers to the view
        addChildViewController(homeViewController)
        homeViewController.view.frame = homeViewContainer.frame
        homeViewContainer.addSubview(homeViewController.view)
        homeViewController.didMoveToParentViewController(self)
        
        addChildViewController(accountViewController)
        accountViewController.view.frame = accountViewContainer.frame
        accountViewContainer.addSubview(accountViewController.view)
        accountViewController.didMoveToParentViewController(self)
        
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
            if self.homeIsHighLighted == false{
                sender.highlighted = true;
                self.homeIsHighLighted = true
            }else{
                sender.highlighted = false;
                self.homeIsHighLighted = false
            }
        })

        hideViewContainers()
        homeViewContainer.hidden = false
    }
    
    @IBAction func didPressSearchButton(sender: UIButton) {
    }
    
    @IBAction func didPressComposeButton(sender: UIButton) {
    }
    
    @IBAction func didPressAccountButton(sender: UIButton) {
        dispatch_async(dispatch_get_main_queue(), {
            if self.accountIsHighLighted == false{
                sender.highlighted = true;
                self.accountIsHighLighted = true
            }else{
                sender.highlighted = false;
                self.accountIsHighLighted = false
            }
        })
        hideViewContainers()
        accountViewContainer.hidden = false
    }
    
    @IBAction func didPressTrendingButton(sender: UIButton) {
    }
    
    // function to make all viewContainers hidden
    
    func hideViewContainers(){
        accountViewContainer.hidden = true
        homeViewContainer.hidden = true
        
    }
    
    // function to make all buttons unhighlighted
    
    func unhighlightButtons(){
        println("unhighlightButtons working")
        homeIsHighLighted = false
        accountIsHighLighted = false
    }
    
    
}

// Next Steps:
//  1. complete the unhighlightButtons function:  when called it ensures all buttons revert to unhighlighted mode


// questions to address:
//  1. how to ensure when one button is highlighted, that all other buttons are no longer highlighted.  How to do this efficiently?
//  2. how to encapsulate the highlighting code in a function, instead of writing it out for each button.
//   - assume need to call image, create action, create variable for each button and iamge, but highlighting code should be modularised

//  Quesiton for Joe:  does it make sense to have a single view container on the hamburger referenced by all view controllers, or have one for each view controller?

