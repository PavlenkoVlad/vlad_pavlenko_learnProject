//
//  Organization.h
//  Objective-C Basics
//
//  Created by Hackintosh on 11/27/19.
//  Copyright © 2019 Hackintosh. All rights reserved.
//

#ifndef Organization_h
#define Organization_h


#endif /* Organization_h */

#import "Employee.h"

@interface Organization : NSObject {
    NSString * name;
    @private
    NSArray<Employee *> * employees;
}

@property (strong, nonatomic) NSString * name;

-(id)initWithName:(NSString *)name;
-(void)addEmployeeWithName:(NSString *)name;
-(void)addEmployee:(Employee *)employee;
-(double)calculateAverageSalary;
-(Employee *)employeeWithLowestSalary;
-(NSArray<Employee *> *)employeesWithSalary:(int)salary tolerance:(int)tolerance;
-(void)printToNSLog;

@end
