//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Diana Nedkova on 2/14/16.
//  Copyright © 2016 Diana Nedkova. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsScrollView: UIScrollView!
    
    @IBOutlet weak var settingsImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        settingsScrollView.contentSize = CGSize(width: 320, height: 695)
    }
    
    @IBAction func onCloseButtonTap(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func didPressSignOutButton(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "", message: "Are you sure you want to logout?", preferredStyle: .ActionSheet)
        let logoutAction = UIAlertAction(title: "Logout", style: .Destructive) { (action) in
            self.performSegueWithIdentifier("toSignInSegue", sender: self)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)

        
        alertController.addAction(logoutAction)
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
