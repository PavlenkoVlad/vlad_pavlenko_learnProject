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
    @property (strong, nonatomic, readwrite) NSString * fullname;
@end

@implementation Employee

@synthesize firstName;
@synthesize lastName;
@synthesize fullname;
@synthesize salary;

-(id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName salary:(int)salary {
    self = [super init];
    self.firstName = firstName;
    self.lastName = lastName;
    self.fullname = [[NSString alloc] initWithFormat:@"%@ %@", firstName, lastName];
    self.salary = salary;
    return self;
}

-(void)printToNSLog {
    NSLog(@"\nEmployee\nfirstName:%@\nlastName:%@\nfullName:%@\nsalary:%d", firstName, lastName, fullname, salary);
}

@end
