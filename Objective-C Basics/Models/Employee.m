//
//  Employee.m
//  Objective-C Basics
//
//  Created by Hackintosh on 11/27/19.
//  Copyright © 2019 Hackintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"
#import "EmployeeMO+CoreDataClass.h"
#import "OrganizationMO+CoreDataClass.h"

@interface Employee()

@end

@implementation Employee

@synthesize context = _context;

-(id)initWithContext:(NSManagedObjectContext *)context {
    self = [super init];
    _context = context;
    return self;
}

- (EmployeeMO *)insertWithFirstName:(NSString *)firstName lastName:(NSString *)lastName salary:(int)salary {
    EmployeeMO *employee = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:_context];
    employee.firstName = firstName;
    employee.lastName = lastName;
    employee.fullName = [[NSString alloc] initWithFormat:@"%@ %@", firstName, lastName];
    employee.salary = salary;
    [self saveContext];
    return employee;
}

- (void)saveContext {
    NSError *error = nil;
    if ([_context hasChanges] && ![_context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
