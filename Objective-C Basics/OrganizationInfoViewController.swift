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
    
    @objc var organization: OrganizationMO!
    
    var salarySum: Int!
    
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
}
