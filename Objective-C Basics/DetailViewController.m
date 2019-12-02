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
    [detailLabel setText:[NSString stringWithFormat:@"%@'s salaty is %d", employeeMO.firstName, employeeMO.salary]];
}

@end
