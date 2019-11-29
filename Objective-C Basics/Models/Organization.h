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

#import "OrganizationMO+CoreDataClass.h"
#import "EmployeeMO+CoreDataClass.h"
#import "Employee.h"

@interface Organization : NSObject

@property (readonly) NSManagedObjectContext *context;
@property (readonly) Employee *employee;

-(id)initWithContext:(NSManagedObjectContext *)context;
-(OrganizationMO *)insertWithName:(NSString *)name;
-(void)addEmployeeWithName:(NSString *)name organization:(OrganizationMO *)organization;
-(void)addEmployee:(EmployeeMO *)employee organization:(OrganizationMO *)organization;
-(void)removeEmployee:(EmployeeMO *)employee organization:(OrganizationMO *)organization;
-(double)calculateAverageSalary:(OrganizationMO *)organization;
-(EmployeeMO *)employeeWithLowestSalary: (OrganizationMO *)organization;
-(NSSet<EmployeeMO *> *)employeesWithSalary:(int)salary tolerance:(int)tolerance organization:(OrganizationMO *)organization;

-(void)saveContext;

@end
