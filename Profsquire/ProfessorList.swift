//
//  ProfessorList.swift
//  Profsquire
//
//  Created by Riyang Liu on 12/24/15.
//  Copyright © 2015 Profsquire. All rights reserved.
//

import Foundation

//Collecting all the professor data in one array.
struct ProfessorList {
    
    var professorList: [ProfessorData] = []
    var noneDuplicatedProfessorList: [ProfessorData] = []
    
    init(professorData: [[String:AnyObject]]) {
        
        for dictionary in professorData {
            
            let professorData = ProfessorData(professorDataDictionary: dictionary)
            
            professorList.append(professorData)
            
        }
        
        //Sorting array a to z in order to fiter the duplicated course's names.
        professorList.sortInPlace { $0.professorName < $1.professorName }
        
        
        //Comparing two ordered course's names, if it's different, add to noneDuplicatedArray.
        for var i = 1; i<professorList.count;i++ {
            
            if (professorList[i].professorName != professorList[i-1].professorName){
                
                noneDuplicatedProfessorList.append(professorList[i-1])
                
            }
            
        }
        
        //Appending the last course data into noneduplicated array.
        noneDuplicatedProfessorList.append(professorList[professorList.count-1])
    }
}
