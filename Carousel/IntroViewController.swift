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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        introScrollVIew.contentSize = introImage.image!.size
        introScrollVIew.delegate = self
        
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        var offset = Float(introScrollVIew.contentOffset.y)
        // Dispose of any resources that can be recreated.
    }
    
    
}
