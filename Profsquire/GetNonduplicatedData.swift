//
//  GetNonduplicatedData.swift
//  Profsquire
//
//  Created by Riyang Liu on 12/29/15.
//  Copyright © 2015 Profsquire. All rights reserved.
//

import Foundation

class GetNonduplicatedData {
    
    //Filter duplicated instructor names, get nonduplicated array.
    
    var noneDuplicatedProfessorList: [String] = []

    func getNoneDuplicatedProfessorList(var professorData: [String]) -> [String] {
        
        //Sorting array a to z in order to fiter the duplicated course's names.
        professorData.sortInPlace { $0 < $1 }
        
        
        //Comparing two ordered course's names, if it's different, add to noneDuplicatedArray.
        for var i = 1; i<professorData.count;i++ {
            
            if (professorData[i] != professorData[i-1]){
                
                noneDuplicatedProfessorList.append(professorData[i-1])
                
            }
        
            
        }
        
        //Appending the last course data into noneduplicated array.
        noneDuplicatedProfessorList.append(professorData[professorData.count-1])
        
        return noneDuplicatedProfessorList
    }
    
    //Filter duplicated department names, get noneduplicated array.
    
    var noneDuplicatedDepartmentList:[String] = []
    
    func getNoneDuplicatedDepartmentList(var department:[String]) -> [String] {
        
        department.sortInPlace{ $0 < $1 }
        
        for var i = 1; i<department.count; i++ {
            
            if (department[i] != department[i-1]){
                
                noneDuplicatedDepartmentList.append(department[i-1])
            }
            
            }
        
            noneDuplicatedDepartmentList.append(department[department.count-1])
            
            return noneDuplicatedDepartmentList

    }
    
    //Filter duplicated courses names, get nonduplicated array.
    
    var noneDuplicatedCouresList:[String] = []
    
    func getNoneDuplicatedCourseList(var courseData: [String]) -> [String] {
        
        courseData.sortInPlace{ $0 < $1 }
        
        for var i = 1; i<courseData.count; i++ {
            
            if (courseData[i] != courseData[i-1]){
                
                noneDuplicatedCouresList.append(courseData[i-1])
            }
        }
        
        noneDuplicatedCouresList.append(courseData[courseData.count-1])
        return noneDuplicatedCouresList
    }
    
    
    
}