//
//  FilterCourseTableViewController.swift
//  Profsquire
//
//  Created by Riyang Liu on 12/30/15.
//  Copyright © 2015 Profsquire. All rights reserved.
//

import UIKit

class FilterCourseTableViewController: UITableViewController {

    
    var departmentTransation: String = ""
    var course:[String] = []
    var noneDuplicatedCourse:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Parsing course data
        //course = ParsingDataFromCoreData().ParseData("course")
        //noneDuplicatedCourse = GetNonduplicatedData().getNoneDuplicatedProfessorList(course)
        
        course = ParsingDataFromCoreData().filterData("course", objectCategory: "department", object: departmentTransation)
        noneDuplicatedCourse.append("All Courses")
        noneDuplicatedCourse += GetNonduplicatedData().getNoneDuplicatedProfessorList(course)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return noneDuplicatedCourse.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = noneDuplicatedCourse[indexPath.row]
        cell.textLabel?.textColor = UIColor.darkGrayColor()

        return cell
    }
    
    
    
    //override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //if segue.identifier == "showFilteredProfessor" {
            
            //self.dismissViewControllerAnimated(true, completion: {});
            
            /*if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let object: String
                
                object = noneDuplicatedDepartment[indexPath.row]
                
                
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! FilterCourseTableViewController
                controller.departmentTransation = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
                
            }*/
        //}
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            
            if segue.identifier == "unwindCourse" {
                
                /*let nextView:MasterTableViewController = (segue.destinationViewController as! UINavigationController).topViewController as! MasterTableViewController
                nextView.pushClosure = {
                self.performSegueWithIdentifier("FilterCourse", sender:nil)}*/
                
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    
                    let object: String
                    
                    object = noneDuplicatedCourse[indexPath.row]
                    
                    let controller = segue.destinationViewController as! MasterTableViewController
                    controller.courseTransation = object
                    controller.filterCourseOn = true
                    //controller.filterDepartmentOn = true
                    controller.showFilterOfCourse = false
                    controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                    controller.navigationItem.leftItemsSupplementBackButton = true
                    //dismissViewControllerAnimated(true, completion: {})
                    
                }
            }
            
        }




   
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
