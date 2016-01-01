//
//  ParsingDataFromCoreData.swift
//  Profsquire
//
//  Created by Riyang Liu on 12/29/15.
//  Copyright © 2015 Profsquire. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ParsingDataFromCoreData {
    
    var objectArray:[String] = []
    
    
    //Parsing any data with a key value
    func ParseData(key: String) -> [String]{
    
    let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let context:NSManagedObjectContext = appDel.managedObjectContext
    
    
    let request = NSFetchRequest(entityName: "Term")
    request.returnsObjectsAsFaults = false
    
    do {
    let results = try context.executeFetchRequest(request)
    
    if results.count > 0 {
    for result: AnyObject in results as! [NSManagedObject]{
    let ptr = result.valueForKey(key)
        
    objectArray.append(ptr as! String)
    
    }
    
    
    
    }else{ print("No Aliens")}
    } catch {
    print("Space Aliens: Part 2");
    }
        
        return objectArray
    }
    
    //filter array with a string.
    func filterData(key: String, objectCategory: String, object: String) -> [String]{
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        
        let request = NSFetchRequest(entityName: "Term")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.executeFetchRequest(request)
            
            if results.count > 0 {
                for result: AnyObject in results as! [NSManagedObject]{
                    
                    let ptr = result.valueForKey(key)
                    
                    let test = result.valueForKey(objectCategory) as! String
                    
                    if ( test == object ) {
                    
                    objectArray.append(ptr as! String)
                        
                    }
                    
                }
                
                
                
            }else{ print("No Aliens")}
        } catch {
            print("Space Aliens: Part 2");
        }
        
        return objectArray
    }

    }

