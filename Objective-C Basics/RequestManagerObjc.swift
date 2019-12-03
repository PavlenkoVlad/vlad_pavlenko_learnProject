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
            case .failure:
                print("error")
            }
        }
    }
}
