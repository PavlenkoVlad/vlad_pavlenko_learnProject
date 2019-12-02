//
//  CreateEmployeeViewController.h
//  Objective-C Basics
//
//  Created by Hackintosh on 11/28/19.
//  Copyright © 2019 Hackintosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeesDataSource.h"
#import <HSDatePickerViewController.h>

NS_ASSUME_NONNULL_BEGIN

@interface CreateEmployeeViewController : UIViewController<HSDatePickerViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *salaryTextField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property HSDatePickerViewController *hsDatePickerViewController;
@property (weak, nonatomic) id<EmployeesDataSource> delegate;
@property Employee *employee;
@property (readonly) NSDate* dateOfBirth;

- (IBAction)setDateButtonPressed:(UIButton *)sender;
@end

NS_ASSUME_NONNULL_END
