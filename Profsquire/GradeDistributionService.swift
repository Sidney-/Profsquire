//
//  GradeDistributionService.swift
//  Profsquire
//
//  Created by Riyang Liu on 12/24/15.
//  Copyright © 2015 Profsquire. All rights reserved.
//

import Foundation

//This class accesses a json file and draps out an array which contains all course data
class GradeDistributionService {
    
    var jsonResultArray: [[String:AnyObject]] = []
    
    init() {
        
        if let path = NSBundle.mainBundle().pathForResource("Semesters(Spring13-Fall14)", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                do {
                    let jsonResult:NSArray = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSArray
                    
                    jsonResultArray = jsonResult as! [[String : AnyObject]]
                    
                } catch {}
                
            } catch {}
        }
        
    }    
}