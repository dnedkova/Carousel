//
//  IntroViewController.swift
//  Carousel
//
//  Created by Diana Nedkova on 2/13/16.
//  Copyright © 2016 Diana Nedkova. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    @IBOutlet weak var introScrollVIew: UIScrollView!
    
    @IBOutlet weak var introImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        introScrollVIew.contentSize = introImage.image!.size
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
