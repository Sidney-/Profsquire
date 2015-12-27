//
//  ViewController.swift
//  Profsquire
//
//  Created by Riyang Liu on 9/26/15.
//  Copyright © 2015 Profsquire. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
      
        /*self.searchBar.layer.borderColor = UIColor.whiteColor().CGColor
        self.searchBar.layer.borderWidth = 0.5
        searchBar.layer.cornerRadius = 20.0
        searchBar.clipsToBounds = true*/
        
        //hide navigation bar
        navigationController?.navigationBarHidden = true
        
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

