//
//  EmployeesViewmodel.swift
//  MVVM_iOS
//
//  Created by Pooja Kadam on 06/06/22.
//

import UIKit
import Foundation

class EmployeesViewmodel: NSObject {
    
    /* Instance of APiservice class */
    private var apiService : APIService!
    
    /* Binding between Viewcontroller and ViewModel */
    private(set) var empData : Employees! { // retrieves results from APIService and notify the view that there have been changes.
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    
    var bindEmployeeViewModelToController : (() -> ()) = {} //This needs to be called from the view controller class
    
    
    /* Initialization */
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetEmpData()
    }
    
    // MARK : - API Service call
    
    func callFuncToGetEmpData(){
        self.apiService.apiToGetEmployeeData { (empData) in
            print(empData)
        }
    }
    
}
