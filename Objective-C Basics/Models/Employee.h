//
//  Employee.h
//  Objective-C Basics
//
//  Created by Hackintosh on 11/27/19.
//  Copyright © 2019 Hackintosh. All rights reserved.
//

#ifndef Employee_h
#define Employee_h


#endif /* Employee_h */

#import "EmployeeMO+CoreDataClass.h"
#import "OrganizationMO+CoreDataClass.h"

@interface Employee : NSObject

@property (readonly) NSManagedObjectContext *context;

-(id)initWithContext:(NSManagedObjectContext *)context;
- (EmployeeMO *)insertWithFirstName:(NSString *)firstName lastName:(NSString *)lastName salary:(int)salary dateOfBirth:(NSDate *)dateOfBirth;

-(void)saveContext;

@end
