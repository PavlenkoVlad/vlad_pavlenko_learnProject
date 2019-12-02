//
//  RequestManager.swift
//  Objective-C Basics
//
//  Created by Hackintosh on 12/2/19.
//  Copyright © 2019 Hackintosh. All rights reserved.
//

import Foundation
import Alamofire

@objc
class RequestManagerObjc: NSObject {
    
    @objc
    public static func fetchOrganizations(completion: @escaping ([String : AnyObject]) -> Void) {
        AF.request("http://gitlab.faifly.com/ios-general/ios-tutorial/uploads/ffffec34fa4a727922bb1e09cc24b21d/tutorial.json").validate().responseJSON { response in
            switch response.result {
            case .success:
                completion(response.value as! [String: AnyObject])
                /*
                guard let response = response.value as? [String: Any], let organizations = response["organizations"] as? NSArray else { return }
                for organization in organizations {
                    guard let organization = organization as? [String: Any], let name = organization["name"] as? String, let employees = organization["employees"] as? NSArray else { continue }
                    print(name)
                    for employee in employees {
                        guard let employee = employee as? [String: Any] else { continue }
                        print((employee["order"] as! NSNumber).intValue)
                        //print(employee["isActive"] as! String)
                       // print(employee["salary"] as! String)
                        print(employee["last_name"] as! String)
                        print(employee["first_name"] as! String)
                    }
                }*/
            case .failure:
                print("error")
            }
        }
    }
}
