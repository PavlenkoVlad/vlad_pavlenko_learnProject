//
//  MainViewController.h
//  Objective-C Basics
//
//  Created by Hackintosh on 11/28/19.
//  Copyright © 2019 Hackintosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Organization.h"
#import "EmployeesDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UITableViewController<EmployeesDataSource>

@property Organization *organization;
@property NSManagedObjectContext *context;
@property OrganizationMO *organizationMO;
@property NSMutableArray<EmployeeMO *> *employeesArray;
@property (nullable) NSString *order;

@end

NS_ASSUME_NONNULL_END
