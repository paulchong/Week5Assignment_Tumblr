//
//  AccountViewController.swift
//  Week5Assignment_Tumblr
//
//  Created by Paul Chong on 3/6/15.
//  Copyright (c) 2015 Paul Chong. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var accountScrollView: UIScrollView!
    
    @IBOutlet weak var accountImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accountScrollView.contentSize = accountImage.frame.size
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

}
