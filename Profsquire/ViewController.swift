//
//  ViewController.swift
//  Profsquire
//
//  Created by Riyang Liu on 9/26/15.
//  Copyright © 2015 Profsquire. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var allData: [CourseData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        allData = GradeDistribution(courseData: GradeDistributionService().jsonResultArray).courseDataArray
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        for (var i = 0; i < 5; i++){
     
            let newTerm = NSEntityDescription.insertNewObjectForEntityForName("Term", inManagedObjectContext: context) as NSManagedObject
        
            newTerm.setValue(allData[i].year, forKey: "year")
            newTerm.setValue(allData[i].semester, forKey: "semester")
            newTerm.setValue(allData[i].department, forKey: "department")
            newTerm.setValue(allData[i].subject, forKey: "subject")
            newTerm.setValue(allData[i].course, forKey: "course")
            newTerm.setValue(allData[i].section, forKey: "section")
            newTerm.setValue(allData[i].instructor, forKey: "instructor")
            newTerm.setValue(allData[i].a, forKey: "a")
            newTerm.setValue(allData[i].b, forKey: "b")
            newTerm.setValue(allData[i].c, forKey: "c")
            newTerm.setValue(allData[i].d, forKey: "d")
            newTerm.setValue(allData[i].f, forKey: "f")
            newTerm.setValue(allData[i].w, forKey: "w")
            newTerm.setValue(allData[i].total, forKey: "total")
            newTerm.setValue(instructorGPA(allData[i].a!, b: allData[i].b!, c: allData[i].c!, d: allData[i].d!, f: allData[i].f!), forKey: "instructorGPA")
            newTerm.setValue(withdrawalRate( allData[i].w!, totalStudents: allData[i].total!), forKey: "withdrawalRate")
        
            do {
                try context.save()
            } catch {
                print("Space Aliens");
            }
            
        }
        
        //let request = NSFetchRequest(entityName: "Term")
        //let instructor = "Soleymani"
        //request.predicate = NSPredicate(format: "instructor == %@", instructor)
        //print(request.predicate)
        
        let request = NSFetchRequest(entityName: "Term")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.executeFetchRequest(request)
            
            if results.count > 0 {
                for result: AnyObject in results{
                    print(result.year)
                }
            }else{ print("No Aliens")}
        } catch {
            print("Space Aliens: Part 2");
        }
        
        
        
        
      
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
    
    func deleteAllData(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Term")
        fetchRequest.returnsObjectsAsFaults = false
        
        do
        {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                managedContext.deleteObject(managedObjectData)
            }
        } catch let error as NSError {
            print("Detele all data in Term error : \(error) \(error.userInfo)")
        }
    }
    
    func instructorGPA(a:Int, b:Int, c:Int, d:Int, f:Int) -> Float {
        
        let courseTotal = a + b + c + d + f
        let instructorPoints = ((a*4) + (b*3) + (c*2) + (d*1) + (f*0))
        let instructorGPA:Float = Float(instructorPoints)/Float(courseTotal)
        
        return instructorGPA
    }
    
    func withdrawalRate( w:Int, totalStudents:Int ) -> Float{
        return ((Float(w)/Float(totalStudents)) * 100)
    }


}

