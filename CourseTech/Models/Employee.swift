//
//  Employee.swift
//  CourseTech
//
//  Created by Tyler Higgs on 8/4/20.
//  Copyright © 2020 Tyler Higgs. All rights reserved.
//

import Foundation

class Employee {
    
    private let firstName: String
    private let lastName: String
    
    private let isBoss: Bool
    
    init(_ fName: String, _ lName: String, _ hasControl: Bool) {
        self.firstName = fName
        self.lastName = lName
        self.isBoss = hasControl
    }
}
