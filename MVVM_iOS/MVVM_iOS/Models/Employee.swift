//
//  Employee.swift
//  MVVM_iOS
//
//  Created by Pooja Kadam on 06/06/22.
//

import Foundation

//MARK: - Employee

struct Employees: Codable {
    let status: String
    let data: [EmployeeData]
}


//MARK: - EmployeeData

struct EmployeeData: Codable {
    let id: Int
    let employeeName : String
    let employeeAge, employeeSalary: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
