//
//  Organization.m
//  Objective-C Basics
//
//  Created by Hackintosh on 11/27/19.
//  Copyright © 2019 Hackintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Organization.h"
#import "EmployeeMO+CoreDataClass.h"
#import "EmployeeMO+CoreDataProperties.h"
#import "OrganizationMO+CoreDataClass.h"
#import "OrganizationMO+CoreDataProperties.h"

@interface Organization()

@end

@implementation Organization

@synthesize context = _context;
@synthesize employee = _employee;

- (id)initWithContext:(NSManagedObjectContext *)context {
    self = [super init];
    _context = context;
    _employee = [[Employee alloc] initWithContext:_context];
    return self;
}

- (OrganizationMO *)insertWithName:(NSString *)name {
    OrganizationMO *organization = [NSEntityDescription insertNewObjectForEntityForName:@"Organization" inManagedObjectContext:_context];
    organization.name = name;
    organization.employees = [NSSet new];
    [self saveContext];
    return organization;
}

- (void)addEmployeeWithName:(NSString *)name organization:(OrganizationMO *)organization{
    int salary = ((arc4random() % 490) + 10) * 10;
    NSArray * arrayOfFullNameComponents = [name componentsSeparatedByString:@" "];
    EmployeeMO *employee = [_employee insertWithFirstName:arrayOfFullNameComponents[0] lastName:arrayOfFullNameComponents[1] salary:salary];
    [self addEmployee:employee organization:organization];
}

- (void)addEmployee:(EmployeeMO *)employee organization:(OrganizationMO *)organization {
    [organization addEmployeesObject:employee];
    //employee.organization = organization;
    [self saveContext];
}

- (void)removeEmployee:(EmployeeMO *)employee organization:(OrganizationMO *)organization {
    [organization removeEmployeesObject:employee];
    [self saveContext];
}

- (double)calculateAverageSalary:(OrganizationMO *)organization {
    NSSet *employees = organization.employees;
    int sumOfSalary = 0;
    for (id employee in employees) {
        sumOfSalary += [employee salary];
    }
    return sumOfSalary / (double) employees.count;
}

- (EmployeeMO *)employeeWithLowestSalary:(OrganizationMO *)organization{
    NSSet *employees = organization.employees;
    NSSortDescriptor * descriptor = [[NSSortDescriptor alloc] initWithKey:@"salary" ascending:YES];
    NSArray * descriptorsArray = [[NSArray alloc] initWithObjects:descriptor, nil];
    NSArray * sortedEmployees = [employees sortedArrayUsingDescriptors:descriptorsArray];
    return sortedEmployees[0];
}

-(NSSet<Employee *> *)employeesWithSalary:(int)salary tolerance:(int)tolerance organization:(OrganizationMO *)organization {
    int upperBound = salary + tolerance;
    int bottomBound = salary - tolerance;
    NSSet *employees = organization.employees;
    NSMutableArray<Employee *> * employeesWithSalaryArray = [NSMutableArray new];
    for (id employee in employees) {
        if ([employee salary] >= bottomBound && [employee salary] <= upperBound) {
            [employeesWithSalaryArray addObject:employee];
        }
    }
    return [NSSet setWithArray:employeesWithSalaryArray];
}

- (void)saveContext {
    NSError *error = nil;
    if ([_context hasChanges] && ![_context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
