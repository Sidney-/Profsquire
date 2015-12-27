//
//  DepartmentPickerView.swift
//  Profsquire
//
//  Created by Riyang Liu on 12/26/15.
//  Copyright © 2015 Profsquire. All rights reserved.
//

import UIKit

class DepartmentPickerView: UIPickerView, UIPickerViewDelegate {
    
    //picker view
    var pickerViewArray = ["Math", "Art", "Science", "Business"]
    
    
    override func numberOfRowsInComponent(component: Int) -> Int {
        
        return pickerViewArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewArray[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        print(pickerViewArray[row])
    }
    
    
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
