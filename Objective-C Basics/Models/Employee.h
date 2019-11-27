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
    
    @public
    NSString * fullname;
    int salary;
}

@property (strong, nonatomic) NSString * firstName;
@property (strong, nonatomic) NSString * lastName;
@property (strong, nonatomic, readonly) NSString * fullname;
@property (nonatomic) int salary;

-(id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName salary:(int)salary;
-(void)printToNSLog;
@end
