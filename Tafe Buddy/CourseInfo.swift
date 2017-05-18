//
//  StudentInfo.swift
//  Study Plan v2
//
//  Created by Ti Chuot on 23/2/17.
//  Copyright © 2017 Ti Chuot. All rights reserved.
//

import UIKit

class CourseInfo: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Change the back button color
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        //CHange navigation item Title color
       // self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        //Hide keyboard by tapping anywhere
        self.hideKeyboardWhenTappedAround()
    }
    
    //Hide keyboard by tapping anywhere
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignIn.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
}
