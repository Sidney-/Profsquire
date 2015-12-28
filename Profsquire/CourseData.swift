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
    let instructor: String?
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
    
    init(courseDataDictionary:[String:AnyObject]) {
        
        course = courseDataDictionary["COURSE"] as? String
        instructor = courseDataDictionary["INSTRUCTOR"] as? String
        a = courseDataDictionary["A"] as? Int
        b = courseDataDictionary["B"] as? Int
        c = courseDataDictionary["C"] as? Int
        d = courseDataDictionary["D"] as? Int
        f = courseDataDictionary["F"] as? Int
        w = courseDataDictionary["W"] as? Int
        total = courseDataDictionary["TOTAL"] as? Int
        semester = courseDataDictionary["SEMESTER"] as? String
        section = courseDataDictionary["SECTION"] as? Int
        department = courseDataDictionary["DEPARTMENT"] as? String
        subject = courseDataDictionary["SUBJECT"] as? String
        year = courseDataDictionary["YEAR"] as? Int
    }
}
