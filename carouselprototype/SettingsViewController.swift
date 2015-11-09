//
//  SettingsViewController.swift
//  carouselprototype
//
//  Created by Amanda Legge on 11/7/15.
//  Copyright © 2015 Amanda Legge. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsScrollView: UIScrollView!
    @IBOutlet weak var settingsImageView: UIImageView!
    @IBOutlet weak var logOutButton: UIButton!
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsScrollView.contentSize = settingsImageView.image!.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeSettingsAction(sender: AnyObject) {
  
        dismissViewControllerAnimated(true, completion: nil)
        
    }
  
    
    @IBAction func didClickLogOut(sender: AnyObject) {
    
        didSignOutControl()
        
    }
    
    func didSignOutControl(){
        
        let signOutController = UIAlertController(title: "Are you sure you want to sign out?", message:nil, preferredStyle: .ActionSheet)
    
        let signOutAction = UIAlertAction(title: "Sign Out", style: UIAlertActionStyle.Destructive, handler: { (UIAlertAction) -> Void in
           
            self.performSegueWithIdentifier("signOutSegue", sender: nil)
            
        })
    
        signOutController.addAction(signOutAction)
    
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
        })
        
        signOutController.addAction(cancelAction)
    
        presentViewController(signOutController, animated: true, completion: nil)
            
    }

}
