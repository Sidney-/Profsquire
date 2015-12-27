//
//  SeparatedSections.swift
//  Profsquire
//
//  Created by Riyang Liu on 12/25/15.
//  Copyright © 2015 Profsquire. All rights reserved.
//

import Foundation

//Separating Sections by Fall2013, Spring2014 and Fall2014.
//Separating data by sections too.
class SeparatedSections {
    
    var sections: [String] = []
    var gradeDistributionBySections: [[CourseData]] = []
    
    func getSections( section: String, data:[CourseData]) -> ([String], [[CourseData]]){
        
        sections = sections + [section]
        gradeDistributionBySections = gradeDistributionBySections + [data]
        
        return (sections, gradeDistributionBySections)
    }
}