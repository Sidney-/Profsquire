//
//  GradeDistribution.swift
//  Profsquire
//
//  Created by Riyang Liu on 12/24/15.
//  Copyright © 2015 Profsquire. All rights reserved.
//

import Foundation

struct GradeDistribution {
    
    var courseDataArray: [CourseData] = []
    var noneDuplicatedDataArray: [CourseData] = []
    
    //Getting two arrays of data type “CourseData”, one array contains all the course's data, the
    //other one filters duplicated course‘s names.
    init(courseData: [[String:AnyObject]]) {
        
        for dictionary in courseData {
            
            let courseData = CourseData(courseDataDictionary: dictionary)
            
            courseDataArray.append(courseData)
            
        }
        
        //Sorting array a to z in order to fiter the duplicated course's names.
        courseDataArray.sortInPlace { $0.course < $1.course }
        
        
        //Comparing two ordered course's names, if it's different, add to noneDuplicatedArray.
        for var i = 1; i<courseDataArray.count;i++ {
            
            if (courseDataArray[i].course != courseDataArray[i-1].course){
                
                noneDuplicatedDataArray.append(courseDataArray[i-1])
                
            }
            
        }
        
        //Appending the last course data into noneduplicated array.
        noneDuplicatedDataArray.append(courseDataArray[courseDataArray.count-1])
        
    }
    
}
