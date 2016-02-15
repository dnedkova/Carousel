
//
//  SignInViewController.swift
//  Carousel
//
//  Created by Diana Nedkova on 2/13/16.
//  Copyright © 2016 Diana Nedkova. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var signinScrollView: UIScrollView!
    
    @IBOutlet weak var fieldParentView: UIView!
    
    @IBOutlet weak var buttonParentView: UIView!
    
    @IBOutlet weak var loginNavBar: UIImageView!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var signInIndicator: UIActivityIndicatorView!
    
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        signinScrollView.delegate = self
        signinScrollView.contentSize = signinScrollView.frame.size
        signinScrollView.contentInset.bottom = 100
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120
        
    }
    
    override func viewWillAppear(animated: Bool) {
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.3, animations: {
            
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
            
        })
    }
    
    @IBAction func tabBackButton(sender: AnyObject) {
        
        navigationController!.popViewControllerAnimated(true)

    }
    func keyboardWillShow(notification: NSNotification) {
        print("keyboardWillShow")
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        signinScrollView.contentOffset.y = signinScrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification) {
        buttonParentView.frame.origin.y = buttonInitialY
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if signinScrollView.contentOffset.y <= -50 {
            view.endEditing(true)
        }
    }
    
    
    @IBAction func didPressSignInButton(sender: AnyObject) {
        
        
        if emailField.text!.isEmpty == false && passwordField.text!.isEmpty == false {
            
            signInIndicator.startAnimating()
            
            delay(2, closure: { () -> () in
                
                self.signInIndicator.stopAnimating()
                if self.emailField.text == "a" && self.passwordField.text == "a" {
                    
                    
                    self.performSegueWithIdentifier("tutorialSegue", sender: nil)
                } else {
                    
                    let wrongAlertController = UIAlertController(title: "Ivalid Email or Password", message: "Please enter a valid email or password", preferredStyle: .Alert)
                    let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                    
                    wrongAlertController.addAction(cancelAction)
                
                    
                    self.presentViewController(wrongAlertController, animated: true, completion: nil)
                }
            
            })
            
        }
        
        if emailField.text!.isEmpty {
            let emailAlertController = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            emailAlertController.addAction(cancelAction)
            
            self.presentViewController(emailAlertController, animated: true, completion: nil)
        }
        if passwordField.text!.isEmpty {
            let passwordAlertController = UIAlertController(title: "Password Required", message: "Please enter your password", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            passwordAlertController.addAction(cancelAction)
            
            self.presentViewController(passwordAlertController, animated: true, completion: nil)
        }
    
}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


