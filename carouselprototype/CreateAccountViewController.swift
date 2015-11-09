//
//  CreateAccountViewController.swift
//  carouselprototype
//
//  Created by Amanda Legge on 11/7/15.
//  Copyright © 2015 Amanda Legge. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var createAccountActivityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var createDroboxButton: UIButton!
    
    @IBOutlet weak var checkboxButton: UIButton!
    
    @IBOutlet weak var createAccountScrollView: UIScrollView!
    
    @IBOutlet weak var fieldParentView: UIView!
    
    @IBOutlet weak var buttonParentView: UIView!
    
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAccountScrollView.contentSize = createAccountScrollView.frame.size
        
        createAccountScrollView.contentInset.bottom = 100
        
        createAccountActivityIndicatorView.alpha = 0
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    func keyboardWillShow(notification: NSNotification) {
        fieldParentView.transform = CGAffineTransformMakeTranslation(0, -162)
        buttonParentView.transform = CGAffineTransformMakeTranslation(0, -264)
        // Enable scrolling while keyboard is shown
        createAccountScrollView.scrollEnabled = true
    
    }
   
       
    func keyboardWillHide(notification: NSNotification) {
        // Move the buttons back down to it's original position
        fieldParentView.transform = CGAffineTransformIdentity
        buttonParentView.transform = CGAffineTransformIdentity
        createAccountScrollView.contentOffset.y = 0
        // Disable scrolling when keyboard is hidden
        createAccountScrollView.scrollEnabled = false
    }
    
    func scrollViewDidScroll(createAccountScrollView: UIScrollView) {
        // If the scrollView has been scrolled down by 50px or more...
        if createAccountScrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
            }
        }
    

    @IBAction func didTapBackground(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tapCheckBox(sender: AnyObject) {
        
        if checkboxButton.selected == true{
            
            checkboxButton.selected = false
        }else{
            checkboxButton.selected = true
        }
    }
    
    @IBAction func backToHomeAction(sender: AnyObject) {
    
        navigationController?.popToRootViewControllerAnimated(true)
        
    }

    @IBAction func createDropboxAction(sender: AnyObject) {
        
        createAccountActivityIndicatorView.alpha = 1
        
            delay(2) { () -> () in
                
                self.performSegueWithIdentifier("createAccountWelcomeSegue", sender: nil)
                
        }
    
        
    
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

