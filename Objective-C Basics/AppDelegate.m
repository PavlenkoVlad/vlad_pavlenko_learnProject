//
//  AppDelegate.m
//  Objective-C Basics
//
//  Created by Hackintosh on 11/27/19.
//  Copyright © 2019 Hackintosh. All rights reserved.
//

#import "AppDelegate.h"
#import "Employee.h"
#import "Organization.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSString * firstName = @"firstName1";
    NSString * lastName = @"lastName1";
    int salary = 700;
    Employee * employee = [[Employee alloc] initWithFirstName:firstName lastName:lastName salary:salary];
    [employee printToNSLog];
    
    Organization *organization = [[Organization alloc] initWithName: @"organizationName"];
    [organization printToNSLog];
    
    [organization addEmployeeWithName:@"firstName2 lastName2"];
    [organization addEmployeeWithName:@"firstName3 lastName3"];
    [organization printToNSLog];
    
    [organization addEmployee:employee];
    [organization printToNSLog];
    
    double avarageSalary = [organization calculateAverageSalary];
    NSLog(@"avarageSalary:%f", avarageSalary);
    
    Employee * emoloyeeLS = [organization employeeWithLowestSalary];
    [emoloyeeLS printToNSLog];
    
    NSArray * employeesWithSalaryTolerance = [organization employeesWithSalary:700 tolerance:500];
    NSLog(@"employeesWithSalaryTolerance:%@", employeesWithSalaryTolerance);
    
    [organization removeEmployee:employee];
    [organization printToNSLog];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
