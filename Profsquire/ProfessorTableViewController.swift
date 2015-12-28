//
//  ProfessorTableViewController.swift
//  Profsquire
//
//  Created by Riyang Liu on 10/2/15.
//  Copyright © 2015 Profsquire. All rights reserved.
//

import UIKit

class ProfessorTableViewController: UITableViewController {
    /*
    //Variables.
    var sections: [String] = []
    var gradeDistributionBySections: [[CourseData]] = []
    var unSortedGradeDistribution: [[CourseData]]?
    var sortOn = false
    
    var scopeTransation = 0
    
    var allProfessors: [ProfessorData] = []
    var gradeDistributionResultBySearching:[CourseData] = []
    var gradeDistributionResult:[CourseData] = []
    var allCourseDataTransation: [CourseData] = []
    var courseNameTransation: String = ""
    var courseDataTransation: CourseData? {
        
        didSet {
            
            getData()
        }
    }
    
    var professorNameTransation: String = ""
    var professorResult:[CourseData] = []
    var professorResultBySearching:[CourseData] = []
    var allProfessorDataTransation:[ProfessorData] = []
    var professorDataTransation: ProfessorData? {
        
        didSet {
            
            getCourse()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (scopeTransation == 0) {
            
        retrieveAllProfessorData()
        configureView()
        getData()
        
        
        //Checking if the user is using the search bar or not.
        
            if (courseDataTransation != nil ){
            
                getGradeDistributionBySections(gradeDistributionResult)
            
            } else {
            
                getGradeDistributionBySections(gradeDistributionResultBySearching)
            
            }
        }
        
        if (scopeTransation == 1){
            
            configureView()
            getCourse()
            
            if (professorDataTransation != nil ){
                
                getGradeDistributionBySections(professorResult)
                
            } else {
                
                getGradeDistributionBySections(professorResultBySearching)
            }
        }
        
        
        
        
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
        //return 1
        return sections.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return 3
        return gradeDistributionBySections[section].count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("ProfessorCell") as! ProfessorTableViewCell
        
        let cell = tableView.dequeueReusableCellWithIdentifier("GradeCell") as! GradesTableViewCell
        
        var data:CourseData
        
        if (scopeTransation == 1) {
            
        data = gradeDistributionBySections[indexPath.section][indexPath.row]
        
        for var i = 0; i<allProfessors.count; i++ {
            
            if ( allProfessors[i].professorId! == data.professorId!) {
                
                cell.ProfessorName.text = allProfessors[i].professorName
            }}
        
        cell.A.text = String(stringInterpolationSegment: data.a!)
        cell.B.text = String(stringInterpolationSegment: data.b!)
        cell.C.text = String(stringInterpolationSegment: data.c!)
        cell.D.text = String(stringInterpolationSegment: data.d!)
        cell.F.text = String(stringInterpolationSegment: data.f!)
        cell.W.text = String(stringInterpolationSegment: data.w!)
        cell.Total.text = String(stringInterpolationSegment: data.total!)
        // Configure the cell...
            
        }
        
        if (scopeTransation == 0) {
            
            data = gradeDistributionBySections[indexPath.section][indexPath.row]
            
            cell.ProfessorName.text! = String(stringInterpolationSegment:data.course!)
            cell.A.text = String(stringInterpolationSegment: data.a!)
            cell.B.text = String(stringInterpolationSegment: data.b!)
            cell.C.text = String(stringInterpolationSegment: data.c!)
            cell.D.text = String(stringInterpolationSegment: data.d!)
            cell.F.text = String(stringInterpolationSegment: data.f!)
            cell.W.text = String(stringInterpolationSegment: data.w!)
            cell.Total.text = String(stringInterpolationSegment: data.total!)
            
        }
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
        
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        if let header = view as? UITableViewHeaderFooterView {
            
            header.textLabel!.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
        }
        
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 21
    }
    
    //This function gets all the data which is needed to display in the detail view table view.
    func getData() {
        
        if (courseDataTransation != nil ) {
            
            gradeDistributionResult = filteredGradeDistribution(courseDataTransation!, allData: allCourseDataTransation)
            
        } else {
            
            gradeDistributionResultBySearching = filteredGradeDistributionWithName(courseNameTransation, allData: allCourseDataTransation)
            
        }
    }
    
    //This function gets all the classes for the professor
    func getCourse(){
        
        if ( professorDataTransation != nil ) {
            
            professorResult = filteredProfessorResult(professorDataTransation!, allData: allCourseDataTransation)
            
        } else {
            
            professorResultBySearching = filteredProfessorWithName(professorNameTransation, allData: allCourseDataTransation)
            
        }
    }
        

    
    //This function filters needed data into an array from all the data.
    func filteredGradeDistribution(object:CourseData, allData:[CourseData]) -> [CourseData] {
        
        var filteredCourse: [CourseData] = []
        
        let objectCourse = object.course
        
        for course in allData {
            
            if (course.course == objectCourse) {
                
                filteredCourse.append(course)
            }
            
        }
        
        return filteredCourse
    }
    
    //This function filters needed courses into an array from all the courses.
    func filteredProfessorResult(object: ProfessorData, allData:[CourseData]) -> [CourseData] {
        
        var filteredCourse: [CourseData] = []
        
        let objectProfessor = object.professorId
        
        for course in allData {
            
            if (course.professorId == objectProfessor){
                
                filteredCourse.append(course)
            }
        }
        
        return filteredCourse
    }
    
    //This function filters needed data into an array from all the data when the user is using
    //the search bar.
    func filteredGradeDistributionWithName(name: String, allData:[CourseData]) -> [CourseData] {
        
        var filteredCourse: [CourseData] = []
        
        for course in allData {
            
            if ( course.course == name ) {
                
                filteredCourse.append(course)
            }
        }
        
        return filteredCourse
    }
    
    func configureView() {
        
        tableView.rowHeight = 38
    }
    
    //This function filters needed courses into an array from all the courses when the user is using
    //the search bar.
    func filteredProfessorWithName(name: String, allData:[CourseData])-> [CourseData] {
        
        var filteredCourse: [CourseData] = []
        
        for course in allData {
            
            if ( String(course.professorId) == name ){
                
                filteredCourse.append(course)
            }
        }
        
        return filteredCourse
    }
    
    //This function retrieve all the professor's data.
    func retrieveAllProfessorData() {
        
        let name = ProfessorList(professorData: GradeDistributionServiceProfessors().jsonResultArray).professorList
        
        dispatch_async(dispatch_get_main_queue()) {
            
            self.allProfessors = name
            
            self.tableView.reloadData()
        }
    }
    
    //This functions separates data by sections.
    func getGradeDistributionBySections(data: [CourseData]){
        
        var Fall2013: [CourseData] = []
        var Spring2014: [CourseData] = []
        var Fall2015: [CourseData] = []
        
        let section = SeparatedSections()
        
        for var i=0; i<data.count; i++ {
            
            if (data[i].year == 2013 && data[i].semester == "Fall") {
                
                Fall2013.append(data[i])
                
            }
            
            if (data[i].year == 2014 && data[i].semester == "Spring") {
                
                Spring2014.append(data[i])
            }
            
            if (data[i].year == 2014 && data[i].semester == "Fall") {
                
                Fall2015.append(data[i])
            }
        }
        
        section.getSections("2013 Fall", data:Fall2013)
        section.getSections("2014 Spring", data:Spring2014)
        section.getSections("2014 Fall", data: Fall2015)
        
        
        sections = section.sections
        gradeDistributionBySections = section.gradeDistributionBySections
        
        
    }
    
    //This functions calls the sortA class to rank which professor gives the most A.
    /*func sortTheA( data: [[CourseData]]){
    
    if (unSortedGradeDistribution == nil )
    {
    unSortedGradeDistribution = gradeDistributionBySections
    }
    let test = SortA()
    
    gradeDistributionBySections = test.sortFunc(data)
    
    
    }
    
    //This function calls the sortProfessor class.
    func sortTheProfessorName( data: [[CourseData]]){
    
    if (unSortedGradeDistribution == nil )
    {
    unSortedGradeDistribution = gradeDistributionBySections
    }
    let test = SortProfessorName()
    gradeDistributionBySections = test.sortFunc(data)
    
    
    }*/
    
    
    
    /*@IBAction func SortTheTableView(sender: UIBarButtonItem) {
    
    if(sortOn == false ) {
    
    sortTheA(gradeDistributionBySections)
    refreshData()
    sortOn = true
    sender.title = "Sort Name"
    
    } else {
    
    sortTheProfessorName(gradeDistributionBySections)
    refreshData()
    sortOn = false
    sender.title = "Sort A"
    }
    }*/
    
    /*func refreshData() {
        
        retrieveAllProfessorData()
        getData()
        
    }*/
    
    
    
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
    */
    
}

