//
//  OrganizationInfoViewController.swift
//  Objective-C Basics
//
//  Created by Hackintosh on 12/2/19.
//  Copyright © 2019 Hackintosh. All rights reserved.
//

import UIKit

class OrganizationInfoViewController: UIViewController {

    @IBOutlet weak var organizationInfoLabel: UILabel!
    
    var salarySumAlertController: UIAlertController!
    
    @objc var context: NSManagedObjectContext!
    var employeeController: Employee!
    
    @objc static let employeesOrderHasChanged = Notification.Name("OrganizationInfoViewController.employeesOrderHasChanged")
    @objc var organization: OrganizationMO!
    var salarySum: Int!
    var employeesOrders = ["firstName", "lastName", "fullName", "salary", "dateOfBirth"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        organizationInfoLabel.text = "Organization Name: \(organization.name!)"
        calculateSalarySum()
        employeeController = Employee.init(context: context)
    }
    
    func calculateSalarySum() {
        salarySum = 0
        for employee in organization.employees! {
            salarySum += Int(employee.salary)
        }
    }

    @IBAction func salarySumButtonPressed(_ sender: UIButton) {
        if let alert = salarySumAlertController {
            self.present(alert, animated: true, completion: nil)
        } else {
            salarySumAlertController = UIAlertController(title: "Salary Sum", message: "\(salarySum!)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            salarySumAlertController.addAction(okAction)
            self.present(salarySumAlertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func randomizeButtonPressed(_ sender: UIButton) {
        let randomIndex = Int.random(in: 0..<employeesOrders.count)
        let employeeOrder = employeesOrders[randomIndex]
        NotificationCenter.default.post(name: OrganizationInfoViewController.employeesOrderHasChanged, object: employeeOrder)
    }
    
    @IBAction func fetchOrganizationsButtonPressed(_ sender: UIButton) {
        RequestManagerObjc.fetchOrganizations(completion: fetchOrganizationsParseResponse(response:))
    }
    
//  TODO: 1. Split into several functions; 2. Add Alert Sheet with Organization; 3. Implement selecting of organization and unwind to MainViewController + reload tableView with new employees of new selected organization;
    func fetchOrganizationsParseResponse(response:[String: AnyObject]) {
        guard let organizations = response["organizations"] as? NSArray else { return }
        
        for organization in organizations {
            guard let organization = organization as? [String: AnyObject], let name = organization["name"] as? String, let employees = organization["employees"] as? NSArray else { continue }
            
            let searchPredicate = NSPredicate(format: "name == %@", name)
            let fetchRequest = OrganizationMO.fetchRequest()
            fetchRequest.predicate = searchPredicate
            
            guard let organizationsResultSearch = try? context.count(for: fetchRequest) else {
                    print("error")
                    continue
            }
            
            if organizationsResultSearch > 0 {
                continue
            } else {
                let organizationMO = NSEntityDescription.insertNewObject(forEntityName: "Organization", into: context) as! OrganizationMO
                organizationMO.name = name
                
                for employee in employees {
                    guard let employee = employee as? [String: AnyObject] else { continue }
                    
                    let firstName = employee["first_name"] as! String
                    let lastName = employee["last_name"] as! String
                    var salary = (employee["employee"] as? NSNumber)?.int32Value
                    if salary == nil {
                        salary = (Int32.random(in: 0...490) + 10) * 10
                    }
                    let dateOfBirth = Date()
                    let employeeMO = employeeController.insert(withFirstName: firstName, lastName: lastName, salary: salary!, dateOfBirth: dateOfBirth)!
                    organizationMO.addEmployeesObject(employeeMO)
                }
                
                do {
                    if (context.hasChanges) {
                        try context.save()
                    }
                } catch (let error) {
                    print(error)
                }
            }
        }
    }
}
