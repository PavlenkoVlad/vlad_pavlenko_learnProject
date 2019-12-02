//
//  CreateEmployeeViewController.m
//  Objective-C Basics
//
//  Created by Hackintosh on 11/28/19.
//  Copyright © 2019 Hackintosh. All rights reserved.
//

#import "CreateEmployeeViewController.h"
#import "Employee.h"
#import <HSDatePickerViewController.h>

@interface CreateEmployeeViewController ()

@end

@implementation CreateEmployeeViewController

@synthesize firstNameTextField;
@synthesize lastNameTextField;
@synthesize salaryTextField;
@synthesize dateLabel;
@synthesize hsDatePickerViewController;
@synthesize delegate;
@synthesize employee;
@synthesize dateOfBirth;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    hsDatePickerViewController = [HSDatePickerViewController new];
    hsDatePickerViewController.delegate = self;
    hsDatePickerViewController.dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    hsDatePickerViewController.dateFormatter.timeStyle = NSDateFormatterNoStyle;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier compare:@"saveEmployeeDone"] == NSOrderedSame) {
        if (firstNameTextField.text && firstNameTextField.text.length > 0 && lastNameTextField.text && lastNameTextField.text.length > 0 && salaryTextField.text && salaryTextField.text.length > 0) {
            [delegate addEmployee:[employee insertWithFirstName:firstNameTextField.text lastName:lastNameTextField.text salary:salaryTextField.text.intValue dateOfBirth:hsDatePickerViewController.date]];
        }
    }
}

- (void)hsDatePickerPickedDate:(NSDate *)date {
    dateOfBirth = date;
    NSDateFormatter *dateFormatter = hsDatePickerViewController.dateFormatter;
    [dateLabel setText:[dateFormatter stringFromDate:date]];
}

- (IBAction)setDateButtonPressed:(UIButton *)sender {
    [self presentViewController:hsDatePickerViewController animated:YES completion:nil];
}

@end
