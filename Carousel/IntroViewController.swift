//
//  IntroViewController.swift
//  Carousel
//
//  Created by Diana Nedkova on 2/13/16.
//  Copyright © 2016 Diana Nedkova. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var introScrollVIew: UIScrollView!
    
    @IBOutlet weak var introImage: UIImageView!
    
    @IBOutlet weak var tile1Image: UIImageView!
    @IBOutlet weak var tile2Image: UIImageView!
    @IBOutlet weak var tile3Image: UIImageView!

    @IBOutlet weak var tile4Image: UIImageView!
    @IBOutlet weak var tile5Image: UIImageView!
    @IBOutlet weak var tile6Image: UIImageView!
    
    var yOffsets : [CGFloat] = [-290, -260, -415, -410, -500, -480]
    var xOffsets: [CGFloat]  = [-55, 35, 16, 100, -110, -95]
    var scales : [CGFloat] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [CGFloat] = [-10, -10, 10, 10, 10, -10]
    var tiles : [UIImageView] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        introScrollVIew.contentSize = introImage.image!.size
        introScrollVIew.delegate = self
        tiles = [tile1Image, tile2Image, tile3Image, tile4Image, tile5Image, tile6Image]

        
    }
  
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let offset = CGFloat(introScrollVIew.contentOffset.y)
        var tx, ty, scale, rotation : CGFloat
        
        
        for i in 0..<tiles.count {
            
            
            tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[i], r2Max: 0)
            ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[i], r2Max: 0)
            scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[i], r2Max: 1)
            rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[i], r2Max: 0)
            
            tiles[i].transform = CGAffineTransformMakeTranslation(tx, ty)
            tiles[i].transform = CGAffineTransformScale(tiles[i].transform, scale, scale)
            tiles[i].transform = CGAffineTransformRotate(tiles[i].transform, CGFloat(rotation * CGFloat(M_PI / 180)))
            
        }
        
      
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    
    
}
