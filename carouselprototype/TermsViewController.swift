//
//  TermsViewController.swift
//  carouselprototype
//
//  Created by Amanda Legge on 11/8/15.
//  Copyright © 2015 Amanda Legge. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {

    @IBOutlet weak var termsWebView: UIWebView!
  
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://www.dropbox.com/terms?mobile=1"
        
        // Convert the url String to a NSURL object.
        let requestURL = NSURL(string:url)
        // Place the URL in a URL Request.
        let request = NSURLRequest(URL: requestURL!)
        // Load Request into WebView.
        termsWebView.loadRequest(request)

        // Do any additional setup after loading the view.
    }
 

    @IBAction func didTouchDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    
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
