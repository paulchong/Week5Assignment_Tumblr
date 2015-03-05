//
//  TabBarViewController.swift
//  Week5Assignment_Tumblr
//
//  Created by Paul Chong on 3/4/15.
//  Copyright (c) 2015 Paul Chong. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    
    @IBOutlet weak var homeButton: UIButton!
    var isHighLighted:Bool = false
    
    let home_icon = UIImage(named: "home_icon") as UIImage?
    let home_selected_icon = UIImage(named: "home_selected_icon") as UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeButton.setImage(home_icon, forState: .Normal)
        homeButton.setImage(home_selected_icon, forState: .Highlighted)

        // Do any additional setup after loading the view.
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
        sender.setImage(home_selected_icon, forState: UIControlState.Highlighted)
        
        dispatch_async(dispatch_get_main_queue(), {
            
            if self.isHighLighted == false{
                sender.highlighted = true;
                self.isHighLighted = true
            }else{
                sender.highlighted = false;
                self.isHighLighted = false
            }
        })
        println(isHighLighted)
        
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
