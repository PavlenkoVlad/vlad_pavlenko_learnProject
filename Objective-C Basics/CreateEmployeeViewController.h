//
//  CreateEmployeeViewController.h
//  Objective-C Basics
//
//  Created by Hackintosh on 11/28/19.
//  Copyright © 2019 Hackintosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeesDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface CreateEmployeeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *salaryTextField;
@property (weak, nonatomic) id<EmployeesDataSource> delegate;
@property Employee *employee;

@end

NS_ASSUME_NONNULL_END
