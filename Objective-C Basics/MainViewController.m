//
//  MainViewController.m
//  Objective-C Basics
//
//  Created by Hackintosh on 11/28/19.
//  Copyright © 2019 Hackintosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "DetailViewController.h"
#import "CreateEmployeeViewController.h"
#import "OrganizationMO+CoreDataClass.h"
#import "EmployeeMO+CoreDataClass.h"
#import "Organization.h"
#import "AppDelegate.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize organization;
@synthesize context;
@synthesize organizationMO;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    context = ((AppDelegate *)UIApplication.sharedApplication.delegate).persistentContainer.viewContext;
    
    [self initOrganization];
}

-(void)initOrganization {
    organization = [[Organization alloc] initWithContext:context];
    NSError *error = nil;
    organizationMO = [context executeFetchRequest:[OrganizationMO fetchRequest] error: &error][0];
    if(!organizationMO) {
        NSLog(@"Error fetching Employee objects: %@\n%@", [error description], [error userInfo]);
        abort();
    }
}
 
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return organizationMO.employees.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"employeeCell" forIndexPath:indexPath];
    EmployeeMO *employeeMO = [organizationMO.employees allObjects][indexPath.row];
    
    cell.textLabel.text = employeeMO.fullName;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [organization removeEmployee:organizationMO.employees.allObjects[indexPath.row] organization:organizationMO];
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
    }
}

- (void)addEmployee:(EmployeeMO *)employeeMO {
    [organization addEmployee:employeeMO organization:organizationMO];
    [self.tableView reloadData];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier compare:@"detailEmployee"] == NSOrderedSame) {
        EmployeeMO *employeeMO = organizationMO.employees.allObjects[self.tableView.indexPathForSelectedRow.row];
        DetailViewController *detailViewController = (DetailViewController *) segue.destinationViewController;
        
        detailViewController.employeeMO = employeeMO;
    } else if ([segue.identifier compare:@"saveEmployee"] == NSOrderedSame) {
        CreateEmployeeViewController *createEmployeeViewController = (CreateEmployeeViewController *) segue.destinationViewController;
        createEmployeeViewController.delegate = self;
        createEmployeeViewController.employee = organization.employee;
    }
}

- (IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    
}

@end
