//
//  NavigationController.swift
//  Profsquire
//
//  Created by Riyang Liu on 12/26/15.
//  Copyright © 2015 Profsquire. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.tintColor = UIColor.clearColor()
        
        
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        //self.navigationController?.navigationBar.backgroundImageForBarMetrics(.Default)
        //self.navigationController?.navigationBar.shadowImage = UIImage()
       
        
        //self.navigationController?.navigationBar.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.7)
        //self.navigationController?.navigationBar.translucent = true
        //self.navigationController?.navigationBar.tintColor.colorWithAlphaComponent(0.5)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func addBlurEffect() {
        // Add blur view
        let bounds = self.navigationController?.navigationBar.bounds as CGRect!
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light)) as UIVisualEffectView
        visualEffectView.frame = bounds
        visualEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.navigationController?.navigationBar.addSubview(visualEffectView)
        
        // Here you can add visual effects to any UIView control.
        // Replace custom view with navigation bar in above code to add effects to custom view.
    }

}
