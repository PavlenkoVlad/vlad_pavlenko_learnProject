//
//  EmployeesDataSource.h
//  Objective-C Basics
//
//  Created by Hackintosh on 11/28/19.
//  Copyright © 2019 Hackintosh. All rights reserved.
//

#ifndef EmployeesDataSource_h
#define EmployeesDataSource_h


#endif /* EmployeesDataSource_h */

#import "Employee.h"

@protocol EmployeesDataSource <NSObject>

@required
- (void) addEmployee:(EmployeeMO *)employeeMO;

@end
