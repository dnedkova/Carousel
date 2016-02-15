//
//  ImageTimelineViewController.swift
//  Carousel
//
//  Created by Diana Nedkova on 2/14/16.
//  Copyright © 2016 Diana Nedkova. All rights reserved.
//

import UIKit

class ImageTimelineViewController: UIViewController {
    
    @IBOutlet weak var timelineScrollView: UIScrollView!
    
    @IBOutlet weak var feedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timelineScrollView.contentSize = CGSize(width: 320, height: 1564)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

