//
//  HomeViewController.swift
//  Week5Assignment_Tumblr
//
//  Created by Paul Chong on 3/5/15.
//  Copyright (c) 2015 Paul Chong. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeScrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScrollView.contentSize = CGSize(width: 320, height: 524)
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

}
