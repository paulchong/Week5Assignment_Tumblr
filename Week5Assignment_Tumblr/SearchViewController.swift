//
//  SearchViewController.swift
//  Week5Assignment_Tumblr
//
//  Created by Paul Chong on 3/7/15.
//  Copyright (c) 2015 Paul Chong. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    
    @IBOutlet weak var searchScrollView: UIScrollView!
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var loadingImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchScrollView.contentSize = searchImage.frame.size

        super.viewDidLoad()
        searchImage.hidden = true
        super.viewDidLoad()
        delay(3) {
            self.searchImage.hidden = false
        }
        
        var images = UIImage.animatedImageNamed("loading-", duration: 0.7)
        loadingImage.image = images
        
        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
