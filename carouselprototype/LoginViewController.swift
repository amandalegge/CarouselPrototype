//
//  LoginViewController.swift
//  carouselprototype
//
//  Created by Legge, Amanda on 11/4/15.
//  Copyright © 2015 Amanda Legge. All rights reserved.
//

import UIKit

class LoginViewController:
    UIViewController {
    
//    var initialY: CGFloat!
//    var offset: CGFloat!
//    
//    var secondY: CGFloat!
//    var offset2: CGFloat!

    
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var signInScrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var signInbutton: UIButton!
    @IBOutlet weak var logInNavBarImageView: UIImageView!
    @IBOutlet weak var signInSpinnerActivityIndicatorView: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInSpinnerActivityIndicatorView.alpha = 0
        
//        initialY = fieldParentView.frame.origin.y
//        offset = -40
//        
//        secondY = buttonParentView.frame.origin.y
//        offset2 = -80
    
        signInScrollView.contentSize = CGSize(width:320, height:600)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
        logInNavBarImageView.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        logInNavBarImageView.alpha = 0
        fieldParentView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.logInNavBarImageView.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.logInNavBarImageView.alpha = 1
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
//        fieldParentView.frame.origin.y = initialY + offset
//        
//        buttonParentView.frame.origin.y = secondY + offset2
        
        fieldParentView.transform = CGAffineTransformMakeTranslation(0, -90)
        buttonParentView.transform = CGAffineTransformMakeTranslation(0, -155)
        // Calculate the maximum scrollview content Offset y
        let maxContentOffsetY = signInScrollView.contentSize.height - signInScrollView.frame.size.height
        // Scroll the scrollview up to the maximum contentOffset
        signInScrollView.contentOffset.y = maxContentOffsetY
        // Enable scrolling while keyboard is shown
        signInScrollView.scrollEnabled = true
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
       
//        fieldParentView.frame.origin.y = initialY
//        
//        buttonParentView.frame.origin.y = secondY
    
        // Move the buttons back down to it's original position
        fieldParentView.transform = CGAffineTransformIdentity
        buttonParentView.transform = CGAffineTransformIdentity
        // Return the ScrollView to it's original position
        signInScrollView.contentOffset.y = 0
        // Disable scrolling when keyboard is hidden
        signInScrollView.scrollEnabled = false
    }

   
    @IBAction func onBackButton(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func didTapBackground(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func scrollViewDidScroll(signInScrollView: UIScrollView) {
        // If the scrollView has been scrolled down by 50px or more...
        if signInScrollView.contentOffset.y <= -2 {
            // Hide the keyboard
            view.endEditing(true)
            print("Sign In Scroll View was scrolled")
        }
    }


    @IBAction func didPressSignIn(sender: AnyObject){
        
        if self.emailTextField.text == "" || self.passwordTextField.text == "" {
            
            self.signInSpinnerActivityIndicatorView.alpha = 0
            
            let alertController = UIAlertController(title: "Email Required", message: "Please enter your email address.", preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in })
            
            alertController.addAction(okAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }else{
        
            self.validateCredentials()
        }
    }
    
    func validateCredentials(){
        
        signInSpinnerActivityIndicatorView.alpha = 1
        delay(2.0, closure: { () -> () in
        
            if self.emailTextField.text == "legge.amanda@gmail.com" && self.passwordTextField.text == "password" {
                self.performSegueWithIdentifier("welcomeSegue", sender: nil)
            }
                
            else {
                
                self.signInSpinnerActivityIndicatorView.alpha = 0
                
                let cancelController = UIAlertController(title: "Wrong Email or Password", message: "Please try again.", preferredStyle: .Alert)
                
                let cancelAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in })
                
                cancelController.addAction(cancelAction)
                
                self.presentViewController(cancelController, animated: true, completion: nil)
            }
        
        })
        
                    }
  
}
