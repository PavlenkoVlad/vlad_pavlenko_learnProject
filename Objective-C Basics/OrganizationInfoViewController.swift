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
    
    @objc static let employeesOrderHasChanged = Notification.Name("OrganizationInfoViewController.employeesOrderHasChanged")
    @objc var organization: OrganizationMO!
    var salarySum: Int!
    var employeesOrders = ["firstName", "lastName", "fullName", "salary", "dateOfBirth"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        organizationInfoLabel.text = "Organization Name: \(organization.name!)"
        calculateSalarySum()
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
}
