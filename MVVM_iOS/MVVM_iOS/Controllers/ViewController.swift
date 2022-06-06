//
//  ViewController.swift
//  MVVM_iOS
//
//  Created by Pooja Kadam on 05/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    private var employeeViewModel : EmployeesViewmodel!

    private var dataSource: EmployeeTableViewDataSource<EmployeeTableViewCell,EmployeeData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        callToViewModelForUIUpdate()
    }

    func callToViewModelForUIUpdate() {
        self.employeeViewModel = EmployeesViewmodel()
        self.employeeViewModel.bindEmployeeViewModelToController = {
            self.updateDataSource()
        }
    }

    func updateDataSource() {
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: self.employeeViewModel.empData.data, configureCell: { (cell, evm) in
            cell.employeeIdLabel.text = String(evm.id)
            cell.employeeNameLabel.text = evm.employeeName
        })
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }
    
    
}

