//
//  AboutCarouselViewController.swift
//  Carousel
//
//  Created by Diana Nedkova on 2/15/16.
//  Copyright © 2016 Diana Nedkova. All rights reserved.
//

import UIKit

class AboutCarouselViewController: UIViewController {
    
    @IBOutlet weak var checkboxFullScreen: UIButton!
    
    @IBOutlet weak var checkboxPhotoSwiped: UIButton!

    @IBOutlet weak var checkboxPhotoShared: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let openedFullScreen = NSUserDefaults.standardUserDefaults().boolForKey("image_fullscreen")
        if openedFullScreen == true {
            checkboxFullScreen.selected = true
        }
        
        let photoSwiped = NSUserDefaults.standardUserDefaults().boolForKey("swiped")
        if photoSwiped == true {
            checkboxPhotoSwiped.selected = true
        }
        
        let photoShared = NSUserDefaults.standardUserDefaults().boolForKey("photo_shared")
        if photoShared == true {
            checkboxPhotoShared.selected = true
            
        }
    }
    
    @IBAction func onTapCloseButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
