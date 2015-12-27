//
//  ProfessorData.swift
//  Profsquire
//
//  Created by Riyang Liu on 12/24/15.
//  Copyright © 2015 Profsquire. All rights reserved.
//

import Foundation

//A struct of professorData which contains professor Id and professor name.
struct ProfessorData {
    
    let professorId:Int?
    let professorName: String?
    
    init(professorDataDictionary:[String:AnyObject]) {
        
        professorId = professorDataDictionary["id"] as? Int
        professorName = professorDataDictionary["name"] as? String
        
    }
    
}
