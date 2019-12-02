//
//  DetailViewController.m
//  Objective-C Basics
//
//  Created by Hackintosh on 11/28/19.
//  Copyright © 2019 Hackintosh. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize detailLabel;
@synthesize employeeMO;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = employeeMO.fullName;
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    NSString *dateOfBirth = [dateFormatter stringFromDate:employeeMO.dateOfBirth];
    [detailLabel setText:[NSString stringWithFormat:@"%@'s salaty is %d\nDate Of Birth: %@", employeeMO.firstName, employeeMO.salary, dateOfBirth]];
}

@end
