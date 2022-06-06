//
//  APIService.swift
//  MVVM_iOS
//
//  Created by Pooja Kadam on 06/06/22.
//

import Foundation

class APIService : NSObject {
    
    private let sourceURL = URL(string:"http://dummy.restapiexample.com/api/v1/employees")!
    
    func apiToGetEmployeeData(completion: @escaping (Employees) -> ()) {
        URLSession.shared.dataTask(with: sourceURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                let empData = try! jsonDecoder.decode(Employees.self, from: data)
                    completion(empData)
//                    print(empData as Any)
                } catch {
                    print("error on decode: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
