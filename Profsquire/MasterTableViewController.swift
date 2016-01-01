//
//  MasterTableViewController.swift
//  Profsquire
//
//  Created by Riyang Liu on 12/24/15.
//  Copyright © 2015 Profsquire. All rights reserved.
//

import UIKit
import CoreData

class MasterTableViewController: UITableViewController {
    
    @IBOutlet weak var filterButton: UIBarButtonItem!
    
    var showFilterOfCourse = false
    var filterDepartmentOn = false
    var filterCourseOn = false
    
    var departmentTransation: String = ""
    var courseTransation: String = ""
    var department:[String] = []
    var noneDuplicatedDepartment:[String] = []
    var pushClosure:(()->())?
    //Variables
    let searchController = UISearchController(searchResultsController: nil)

    var instructorArray:[String] = []
    var noneDuplicatedInstructorArray:[String] = []
    var filteredProfessors = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        
        //Parsing instructor data
        instructorArray = ParsingDataFromCoreData().ParseData("instructor")
        noneDuplicatedInstructorArray = GetNonduplicatedData().getNoneDuplicatedProfessorList(instructorArray)
        
        //department = ParsingDataFromCoreData().ParseData("department")
        //noneDuplicatedDepartment = GetNonduplicatedData().getNoneDuplicatedProfessorList(department)


        
        //Preparing all the course data.
        /*courseData = GradeDistribution(courseData: GradeDistributionService().jsonResultArray).noneDuplicatedDataArray
            allCourseData = GradeDistribution(courseData: GradeDistributionService().jsonResultArray).courseDataArray
        
        
        //Preparing all the professor data.
        
        professorData = ProfessorList(professorData: GradeDistributionServiceProfessors().jsonResultArray).noneDuplicatedProfessorList*/
            
        
        
        //Adding a search bar on the top of the table view.
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.placeholder = "Search a course or a professor"
        
        //costumize search bar
        //searchController.searchBar.searchBarStyle = UISearchBarStyle.Minimal
        searchController.searchBar.barTintColor = UIColor.clearColor()
        searchController.searchBar.backgroundImage = UIImage()
        searchController.searchBar.setBackgroundImage(UIImage(), forBarPosition:.Any, barMetrics: .Default)
        searchController.searchBar.translucent = true
        

        
        //show navigation bar
        navigationController?.navigationBarHidden = false
        //navigationController?.navigationBar.translucent = true
        
        
        //tableview background image
        tableView.backgroundView = UIImageView(image: UIImage(named: "Profsquire-Background"))
        
        //left baritem color
        navigationController!.navigationBar.barStyle = UIBarStyle.Black
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    
    }
    
    override func viewWillAppear(animated: Bool) {
        

        if showFilterOfCourse == true {
        pushClosure?()
            
            showFilterOfCourse = false
        }
        
        if departmentTransation == "All Departments" {
            
            instructorArray = ParsingDataFromCoreData().ParseData("instructor")
            noneDuplicatedInstructorArray = GetNonduplicatedData().getNoneDuplicatedProfessorList(instructorArray)
            filterButton.title = "Filter"
            filterButton.titlePositionAdjustmentForBarMetrics(.Default)

        } else {
            
        
        if filterCourseOn == true {
            
            
            if courseTransation != "" {
                print(courseTransation)
                if courseTransation == "All Courses" {
                    print(departmentTransation)
                    instructorArray = ParsingDataFromCoreData().filterData("instructor", objectCategory: "department", object: departmentTransation)
                    noneDuplicatedInstructorArray = GetNonduplicatedData().getNoneDuplicatedProfessorList(instructorArray)
                    print(noneDuplicatedInstructorArray)
                    filterButton.title = departmentTransation
                    filterButton.titlePositionAdjustmentForBarMetrics(.Default)

                    
                } else {
                    
                    instructorArray = ParsingDataFromCoreData().filterData("instructor", objectCategory: "course", object: courseTransation)
                    noneDuplicatedInstructorArray = GetNonduplicatedData().getNoneDuplicatedProfessorList(instructorArray)
                    filterButton.title = courseTransation
                    filterButton.titlePositionAdjustmentForBarMetrics(.Default)
                    
                }
            }
        
        }
            
            
        }
        
        tableView.reloadData()
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
        
        if searchController.active && searchController.searchBar.text != "" {
            
            //if scopeSelected == 0 {
                
            return filteredProfessors.count
                
            //}
            
            //if scopeSelected == 1 {
                
                //return noneDuplicatedInstructorArray.count
            //}
        }
        return noneDuplicatedInstructorArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let professor: String
        //if scopeSelected == 0 {
        
        if searchController.active && searchController.searchBar.text != "" {
            professor = filteredProfessors[indexPath.row]
        } else {
            professor = noneDuplicatedInstructorArray[indexPath.row]
        }
        
        cell.textLabel?.text = professor.lowercaseString
            cell.textLabel?.textColor = UIColor.darkGrayColor()
       
        
        /*if scopeSelected == 1 {
            
            if searchController.active && searchController.searchBar.text != "" {
                
                professor = filteredProfessors[indexPath.row]
                
            } else {
                
                professor = professorData[indexPath.row]
                
            }
            
            cell.textLabel?.text = professor.professorName
            //cell.textLabel?.textColor = UIColor.redColor()
        }
        
        //cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.7)
        //cell.backgroundView?.tintColor = UIColor.whiteColor().colorWithAlphaComponent(0.7)
        //cell.backgroundColor = UIColor(white: 1, alpha: 0.7)
        //cell.backgroundView?.backgroundColor = UIColor(white: 1, alpha: 0.7)*/
        
        return cell
}

    //Transfering all the data from the master view controller to the detail view controller.
    //Letting the detail master view know which course that the user want to check.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "FilterCourse" {
            
            
        //if let indexPath = self.tableView.indexPathForSelectedRow {
            
            let object: String
            
            //object = noneDuplicatedDepartment[indexPath.row]
            object = departmentTransation
            
            
            let controller = (segue.destinationViewController as! UINavigationController).topViewController as! FilterCourseTableViewController
            controller.departmentTransation = object
            controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
            controller.navigationItem.leftItemsSupplementBackButton = true
           
       // }
        }

        
        /*if segue.identifier == "Grades" {
        
            if (scopeSelected == 0) {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let object: CourseData
                
                if searchController.active && searchController.searchBar.text != "" {
                    
                    object = filteredCourses[indexPath.row]
                    
                } else {
                    
                    object = courseData[indexPath.row]
                    
                }
                
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! ProfessorTableViewController
                controller.courseDataTransation = object
                controller.allCourseDataTransation = allCourseData
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
                controller.scopeTransation = scopeSelected
                
                }
                
            }
            
            if (scopeSelected == 1) {
                
                if let indexPath =  self.tableView.indexPathForSelectedRow {
                    
                    let object: ProfessorData
                    
                    if searchController.active && searchController.searchBar.text != "" {
                        
                        object = filteredProfessors[indexPath.row]
                        
                    } else {
                        
                        object = professorData[indexPath.row]
                        
                    }
                    
                    let controller = (segue.destinationViewController as! UINavigationController).topViewController as! ProfessorTableViewController
                    controller.allCourseDataTransation = allCourseData
                    controller.professorDataTransation = object
                    controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                    controller.navigationItem.leftItemsSupplementBackButton = true
                    controller.scopeTransation = scopeSelected
                }
            }
        }*/
        
        
        /*if segue.identifier == "FilterDepartment" {
            
            if filterDepartmentOn == true {
            print(filterDepartmentOn)
            pushClosure = {
                self.performSegueWithIdentifier("FilterCourse", sender:nil)
            
                }
                filterDepartmentOn = false
            }          }*/
    }
    
    @IBAction func unwindWithSelectedDepartment(segue:UIStoryboardSegue) {
        
        if showFilterOfCourse == true {
            pushClosure = {
                self.performSegueWithIdentifier("FilterCourse", sender:nil)
                
            }
            
            }
        
    }
    
    @IBAction func unwindWithSelectedCourse(segue:UIStoryboardSegue) {
        
        
    }
    
    
    
    //Searching the text that the user types in.
    func filterContentForSearchText(searchText: String, scope: String = "all") {
        
        //if scopeSelected == 0 {
        
        filteredProfessors = noneDuplicatedInstructorArray.filter { professor in
            //let categoryMatch = ( scope == "All") || ( CourseData.semester == scope )
            return professor.lowercaseString.containsString(searchText.lowercaseString)
            }
        //}
        
        /*if scopeSelected == 1 {
            
            filteredProfessors = professorData.filter { ProfessorData in
                //let categoryMatch = ( scope == "All") || ( CourseData.semester == scope )
                return ProfessorData.professorName!.lowercaseString.containsString(searchText.lowercaseString)
            }
            
        }*/
        
        tableView.reloadData()
    }
    
    
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


//An extension file that supports the Search bar.
extension MasterTableViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

extension MasterTableViewController: UISearchBarDelegate {
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
        
        /*if (selectedScope == 0){
            
            scopeSelected = 0
            tableView.reloadData()
        }
        
        if (selectedScope == 1 ){
            
            scopeSelected = 1
            tableView.reloadData()
            
        }*/
    }
}

