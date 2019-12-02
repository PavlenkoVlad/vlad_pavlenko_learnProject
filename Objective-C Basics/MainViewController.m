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
#import <Objective_C_Basics-Swift.h>

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize organization;
@synthesize context;
@synthesize organizationMO;
@synthesize employeesArray;
@synthesize order;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    context = ((AppDelegate *)UIApplication.sharedApplication.delegate).persistentContainer.viewContext;
    
    [self initOrganization];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(sortEmployeesSetWithNotification:) name:OrganizationInfoViewController.employeesOrderHasChanged object:nil];
}

- (void)initOrganization {
    organization = [[Organization alloc] initWithContext:context];
    NSError *error = nil;
    NSArray *organizationMOArray = [context executeFetchRequest:[OrganizationMO fetchRequest] error: &error];
    if (!organizationMOArray || organizationMOArray.count == 0) {
        [self firstLaunchDataInit];
    } else {
        organizationMO = organizationMOArray[0];
    }
    employeesArray = [[NSMutableArray alloc] initWithArray:organizationMO.employees.allObjects];
}

- (void)firstLaunchDataInit {
    organizationMO = [organization insertWithName:@"organization name"];
    [organization addEmployeeWithName:@"firstName1 lastName1" organization:organizationMO];
    [organization addEmployeeWithName:@"firstName2 lastName2" organization:organizationMO];
    [organization addEmployeeWithName:@"firstName3 lastName3" organization:organizationMO];
}
 
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return employeesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"employeeCell" forIndexPath:indexPath];
    EmployeeMO *employeeMO = employeesArray[indexPath.row];
    
    cell.textLabel.text = employeeMO.fullName;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        EmployeeMO *employee = employeesArray[indexPath.row];
        [organization removeEmployee:employee organization:organizationMO];
        [employeesArray removeObject:employee];
        [self sortEmployeesSetWithOrder];
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
    }
}

- (void)addEmployee:(EmployeeMO *)employeeMO {
    [organization addEmployee:employeeMO organization:organizationMO];
    [employeesArray addObject:employeeMO];
    [self sortEmployeesSetWithOrder];
    [self.tableView reloadData];
}

- (void)sortEmployeesSetWithNotification:(NSNotification *)notification {
    NSString *order = (NSString *)notification.object;
    self.order = order;
    [self sortEmployeesSetWithOrder];
    [self.tableView reloadData];
}

- (void)sortEmployeesSetWithOrder {
    if (order) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:order ascending:YES];
        NSArray *sortDescriptorsArray = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        NSArray *sortedEmployees = [employeesArray sortedArrayUsingDescriptors:sortDescriptorsArray];
        employeesArray = [[NSMutableArray alloc] initWithArray:sortedEmployees];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier compare:@"detailEmployee"] == NSOrderedSame) {
        EmployeeMO *employeeMO = employeesArray[self.tableView.indexPathForSelectedRow.row];
        DetailViewController *detailViewController = (DetailViewController *) segue.destinationViewController;
        
        detailViewController.employeeMO = employeeMO;
    } else if ([segue.identifier compare:@"saveEmployee"] == NSOrderedSame) {
        CreateEmployeeViewController *createEmployeeViewController = (CreateEmployeeViewController *) segue.destinationViewController;
        createEmployeeViewController.delegate = self;
        createEmployeeViewController.employee = organization.employee;
    } else if ([segue.identifier compare:@"organizationInfo"] == NSOrderedSame) {
        OrganizationInfoViewController *organizationInfoViewController = (OrganizationInfoViewController *) segue.destinationViewController;
        organizationInfoViewController.organization = organizationMO;
    }
}

- (IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    
}

@end
