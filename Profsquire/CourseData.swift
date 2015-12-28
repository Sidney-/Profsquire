//
//  CourseData.swift
//  Profsquire
//
//  Created by Riyang Liu on 12/24/15.
//  Copyright © 2015 Profsquire. All rights reserved.
//

import Foundation

//A struct CourseData which contains all the information for each class.
struct CourseData {
    
    let course: String?
    let instructor: Int?
    let a: Int?
    let b: Int?
    let c: Int?
    let d: Int?
    let f: Int?
    let w: Int?
    let total: Int?
    let semester: String?
    let section: Int?
    let department: String?
    let subject: String?
    let year: Int?
    let withdrawalRate: Bool?
    let instructorGPA: Float?
    let overallInstructorGPA: Float?
    
    init(courseDataDictionary:[String:AnyObject]) {
        
        course = courseDataDictionary["course"] as? String
        instructor = courseDataDictionary["instuctor"] as? Int
        instructorGPA = courseDataDictionary["instructorGPA"] as? Float
        overallInstructorGPA = courseDataDictionary["overallInstructorGPA"] as? Float
        withdrawalRate = courseDataDictionary["withdrawalRate"] as? Bool
        a = courseDataDictionary["a"] as? Int
        b = courseDataDictionary["b"] as? Int
        c = courseDataDictionary["c"] as? Int
        d = courseDataDictionary["d"] as? Int
        f = courseDataDictionary["f"] as? Int
        w = courseDataDictionary["w"] as? Int
        total = courseDataDictionary["total"] as? Int
        semester = courseDataDictionary["semester"] as? String
        section = courseDataDictionary["section"] as? Int
        department = courseDataDictionary["department"] as? String
        subject = courseDataDictionary["subject"] as? String
        year = courseDataDictionary["year"] as? Int
    }
}
