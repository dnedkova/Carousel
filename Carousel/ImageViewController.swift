//
//  ImageViewController.swift
//  Carousel
//
//  Created by Diana Nedkova on 2/15/16.
//  Copyright © 2016 Diana Nedkova. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var photoForSharing: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.contentSize = CGSize(width: 960, height: 568)
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        
        NSUserDefaults.standardUserDefaults().setBool(true, forKey:"image_fullscreen")
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    @IBAction func onTapCloseButton(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey:"swipe")
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    @IBAction func onTapShareButton(sender: AnyObject) {
        let contentToShare : Array = [photoForSharing]
        let activityViewController = UIActivityViewController(activityItems: contentToShare, applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: {})
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}