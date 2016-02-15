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
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    @IBOutlet weak var checkBoxButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createScrollView.delegate = self
        
        createScrollView.contentSize = createScrollView.frame.size
        createScrollView.contentInset.bottom = 115
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -110
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
