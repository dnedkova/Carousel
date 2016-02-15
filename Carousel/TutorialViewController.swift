//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Diana Nedkova on 2/14/16.
//  Copyright © 2016 Diana Nedkova. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var tutorialScrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tutorialScrollView.contentSize = CGSize(width: 1280, height: 568)
        tutorialScrollView.delegate = self
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page: Int = Int(round(tutorialScrollView.contentOffset.x / 320))
        
        pageControl.currentPage = page
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
