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

@interface Employee : NSObject {
    @private
    NSString * firstName;
    NSString * lastName;
}

@property (readonly) NSString * fullname;
@property int salary;

- (id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName salary:(int)salary;
- (void)printToNSLog;
@end
