//
//  Organization.m
//  Objective-C Basics
//
//  Created by Hackintosh on 11/27/19.
//  Copyright © 2019 Hackintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Organization.h"

@interface Organization()

@end

@implementation Organization

@synthesize name;
@synthesize employees;

-(id)initWithName:(NSString *)name {
    self = [super init];
    self.name = name;
    self.employees = [NSArray new];
    return self;
}

-(void)addEmployeeWithName:(NSString *)name {
    int salary = ((arc4random() % 490) + 10) * 10;
    NSArray * arrayOfFullNameComponents = [name componentsSeparatedByString:@" "];
    Employee * newEmployee = [[Employee alloc] initWithFirstName:arrayOfFullNameComponents[0] lastName:arrayOfFullNameComponents[1] salary:salary];
    [self addEmployee:newEmployee];

}

-(void) addEmployee:(Employee *)employee {
    NSMutableArray * tempEmoloyeesArray = [[NSMutableArray alloc] init];
    tempEmoloyeesArray = [NSMutableArray arrayWithArray:employees];
    [tempEmoloyeesArray addObject:employee];
    employees = [NSArray arrayWithArray:tempEmoloyeesArray];
}

-(double)calculateAverageSalary {
    int sumOfSalary = 0;
    for (id employee in employees) {
        sumOfSalary += [employee salary];
    }
    return sumOfSalary / (double) employees.count;
}

-(Employee *)employeeWithLowestSalary {
    NSSortDescriptor * descriptor = [[NSSortDescriptor alloc] initWithKey:@"salary" ascending:YES];
    NSArray * descriptorsArray = [[NSArray alloc] initWithObjects:descriptor, nil];
    NSArray * sortedEmployees = [employees sortedArrayUsingDescriptors:descriptorsArray];
    return sortedEmployees[0];
}

-(NSArray<Employee *> *)employeesWithSalary:(int)salary tolerance:(int)tolerance {
    int upperBound = salary + tolerance;
    int bottomBound = salary - tolerance;
    NSMutableArray<Employee *> * employeesWithSalaryArray = [NSMutableArray new];
    for (id employee in employees) {
        if ([employee salary] >= bottomBound && [employee salary] <= upperBound) {
            [employeesWithSalaryArray addObject:employee];
        }
    }
    return [NSArray arrayWithArray:employeesWithSalaryArray];
}

-(void)printToNSLog {
    NSLog(@"\nOrganization\nname:%@\nemployees:%@", name, employees);
}

@end
