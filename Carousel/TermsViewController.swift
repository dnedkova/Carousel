//
//  TermsViewController.swift
//  Carousel
//
//  Created by Diana Nedkova on 2/14/16.
//  Copyright © 2016 Diana Nedkova. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {
    
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = "https://www.dropbox.com/terms?mobile=1"
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        
        webView.loadRequest(request)
        
    }
    
    @IBAction func onTapDoneButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
