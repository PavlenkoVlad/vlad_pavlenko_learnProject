//
//  ViewController.m
//  Objective-C Basics
//
//  Created by Hackintosh on 11/27/19.
//  Copyright © 2019 Hackintosh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textField;
@synthesize label;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)sendButtonPressed:(UIButton *)sender {
    if (textField.text && textField.text.length > 0) {
        [label setText:textField.text];
    }
}

@end
