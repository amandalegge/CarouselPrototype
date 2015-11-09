//
//  WelcomeViewController.swift
//  carouselprototype
//
//  Created by Legge, Amanda on 11/4/15.
//  Copyright © 2015 Amanda Legge. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var carouselScrollView: UIScrollView!
    @IBOutlet weak var takeCarouselForASpinView: UIImageView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
            pageControl.hidden = false
            carouselScrollView.contentSize = CGSize(width: 1280, height: 568)
            takeCarouselForASpinView.alpha = 0
        
            self.carouselScrollView.delegate = self
        
        
        }
    
  
    func scrollViewDidEndDecelerating(carouselScrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        print("Decelerated")
        let page : Int = Int(round(carouselScrollView.contentOffset.x / 320))
            
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if pageControl.currentPage == 3{
       
            takeCarouselForASpinView.alpha = 1
            pageControl.hidden = true
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
