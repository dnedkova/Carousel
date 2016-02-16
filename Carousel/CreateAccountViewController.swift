//
//  CreateAccountViewController.swift
//  Carousel
//
//  Created by Diana Nedkova on 2/14/16.
//  Copyright © 2016 Diana Nedkova. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var createScrollView: UIScrollView!
    
    @IBOutlet weak var buttonParentView: UIView!
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    @IBOutlet weak var checkBoxButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createScrollView.delegate = self
        
        createScrollView.contentSize = createScrollView.frame.size
        createScrollView.contentInset.bottom = 120
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -103
    }
    
    @IBAction func onTapBackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    func keyboardWillShow(notification: NSNotification) {

        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        createScrollView.contentOffset.y = createScrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification) {
        buttonParentView.frame.origin.y = buttonInitialY
        
    }
    
    @IBAction func onSelectCheckbox(sender: AnyObject) {
        checkBoxButton.selected = !checkBoxButton.selected
    }
    
    @IBAction func onTapCreateButton(sender: AnyObject) {
        
        if firstName.text!.isEmpty || lastName.text!.isEmpty || email.text!.isEmpty || password.text!.isEmpty {
            let AlertController = UIAlertController(title: "Information Required", message: "Please provide required information", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            AlertController.addAction(cancelAction)
            
            self.presentViewController(AlertController, animated: true, completion: nil)
        } else if checkBoxButton.selected == false {
            let AlertController = UIAlertController(title: "", message: "Please agree with Terms of Service", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            AlertController.addAction(cancelAction)
            
            self.presentViewController(AlertController, animated: true, completion: nil)
            
        } else {
            activityIndicator.startAnimating()
            
            delay(2, closure: { () -> () in
                
                self.activityIndicator.stopAnimating()

                self.performSegueWithIdentifier("tutorialSegue", sender: nil)
                })
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
