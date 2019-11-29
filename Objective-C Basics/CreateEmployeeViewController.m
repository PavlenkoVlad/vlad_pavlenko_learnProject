//
//  CreateEmployeeViewController.m
//  Objective-C Basics
//
//  Created by Hackintosh on 11/28/19.
//  Copyright © 2019 Hackintosh. All rights reserved.
//

#import "CreateEmployeeViewController.h"
#import "Employee.h"

@interface CreateEmployeeViewController ()

@end

@implementation CreateEmployeeViewController

@synthesize firstNameTextField;
@synthesize lastNameTextField;
@synthesize salaryTextField;
@synthesize delegate;
@synthesize employee;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier compare:@"saveEmployeeDone"] == NSOrderedSame) {
        if (firstNameTextField.text && firstNameTextField.text.length > 0 && lastNameTextField.text && lastNameTextField.text.length > 0 && salaryTextField.text && salaryTextField.text.length > 0) {
            [delegate addEmployee:[employee insertWithFirstName:firstNameTextField.text lastName:lastNameTextField.text salary:salaryTextField.text.intValue]];
        }
    }
}

@end
