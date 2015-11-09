//
//  IntroViewController.swift
//  CarouselPrototype
//
//  Created by Amanda Legge on 11/3/15.
//  Copyright © 2015 Amanda Legge. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introViewController: UIImageView!
    @IBOutlet weak var tile1ImageView: UIImageView!
    @IBOutlet weak var tile2ImageView: UIImageView!
    @IBOutlet weak var tile3ImageView: UIImageView!
    @IBOutlet weak var tile4ImageView: UIImageView!
    @IBOutlet weak var tile5ImageView: UIImageView!
    @IBOutlet weak var tile6ImageView: UIImageView!
    
    var xOffsets: [Float] = [-50, 45, 25, 100, -120, -85]
    var yOffsets: [Float] = [-285, -240, -415, -408, -500, -500]
    var scales: [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations: [Float] = [-10, -10, 10, 10, 10, -10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        introScrollView.contentSize = introViewController.image!.size
        introScrollView.delegate = self
        
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(introscrollView: UIScrollView) {
        // This method is called as the user scrolls
        let offset = CGFloat(introscrollView.contentOffset.y)
        
        
        // Tile variables
        
        //Tile1
        let tx1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -50, r2Max: 0)
        let ty1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
        let scale1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        let rotation1 =  convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile1ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(tx1), CGFloat(ty1))
        tile1ImageView.transform = CGAffineTransformScale(tile1ImageView.transform, CGFloat(scale1), CGFloat(scale1))
        tile1ImageView.transform = CGAffineTransformRotate(tile1ImageView.transform, CGFloat(Double(rotation1) * M_PI/180))
        
        //Tile2
        let tx2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 45, r2Max: 0)
        let ty2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -240, r2Max: 0)
        let scale2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        let rotation2 =  convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile2ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(tx2), CGFloat(ty2))
        tile2ImageView.transform = CGAffineTransformScale(tile2ImageView.transform, CGFloat(scale2), CGFloat(scale2))
        tile2ImageView.transform = CGAffineTransformRotate(tile2ImageView.transform, CGFloat(Double(rotation2) * M_PI/180))
        
        //Tile3
        let tx3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 25, r2Max: 0)
        let ty3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -415, r2Max: 0)
        let scale3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max: 1)
        let rotation3 =  convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile3ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(tx3), CGFloat(ty3))
        tile3ImageView.transform = CGAffineTransformScale(tile3ImageView.transform, CGFloat(scale3), CGFloat(scale3))
        tile3ImageView.transform = CGAffineTransformRotate(tile3ImageView.transform, CGFloat(Double(rotation3) * M_PI/180))
        
        //Tile4
        let tx4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 100, r2Max: 0)
        let ty4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -408, r2Max: 0)
        let scale4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        let rotation4 =  convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile4ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(tx4), CGFloat(ty4))
        tile4ImageView.transform = CGAffineTransformScale(tile4ImageView.transform, CGFloat(scale4), CGFloat(scale4))
        tile4ImageView.transform = CGAffineTransformRotate(tile4ImageView.transform, CGFloat(Double(rotation4) * M_PI/180))
        
        //Tile5
        let tx5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -120, r2Max: 0)
        let ty5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -500, r2Max: 0)
        let scale5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        let rotation5 =  convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile5ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(tx5), CGFloat(ty5))
        tile5ImageView.transform = CGAffineTransformScale(tile5ImageView.transform, CGFloat(scale5), CGFloat(scale5))
        tile5ImageView.transform = CGAffineTransformRotate(tile5ImageView.transform, CGFloat(Double(rotation5) * M_PI/180))
        
        //Tile6
        let tx6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -85, r2Max: 0)
        let ty6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -500, r2Max: 0)
        let scale6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        let rotation6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile6ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(tx6), CGFloat(ty6))
        tile6ImageView.transform = CGAffineTransformScale(tile6ImageView.transform, CGFloat(scale6), CGFloat(scale6))
        tile6ImageView.transform = CGAffineTransformRotate(tile6ImageView.transform, CGFloat(Double(rotation6) * M_PI/180))
        
        
        
        
    }
  
}
