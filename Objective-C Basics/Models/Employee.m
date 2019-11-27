//
//  Employee.m
//  Objective-C Basics
//
//  Created by Hackintosh on 11/27/19.
//  Copyright © 2019 Hackintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"

@interface Employee()

@end

@implementation Employee

@synthesize fullname = _fullname;
@synthesize salary = _salary;

- (id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName salary:(int)salary {
    self = [super init];
    self->firstName = firstName;
    self->lastName = lastName;
    _fullname = [[NSString alloc] initWithFormat:@"%@ %@", firstName, lastName];
    _salary = salary;
    return self;
}

- (void)printToNSLog {
    NSLog(@"\nEmployee\nfirstName:%@\nlastName:%@\nfullName:%@\nsalary:%d", firstName, lastName, _fullname, _salary);
}

@end
