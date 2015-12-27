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
    let professorId: Int?
    let a: Int?
    let b: Int?
    let c: Int?
    let d: Int?
    let f: Int?
    let w: Int?
    let total: Int?
    let semester: String?
    let year: Int?
    
    init(courseDataDictionary:[String:AnyObject]) {
        
        course = courseDataDictionary["course"] as? String
        professorId = courseDataDictionary["professor_id"] as? Int
        a = courseDataDictionary["a"] as? Int
        b = courseDataDictionary["b"] as? Int
        c = courseDataDictionary["c"] as? Int
        d = courseDataDictionary["d"] as? Int
        f = courseDataDictionary["f"] as? Int
        w = courseDataDictionary["w"] as? Int
        total = courseDataDictionary["total"] as? Int
        semester = courseDataDictionary["semester"] as? String
        year = courseDataDictionary["year"] as? Int
    }
}
