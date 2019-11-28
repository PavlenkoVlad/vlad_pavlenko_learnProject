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

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize organization;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self initOrganization];
}

-(void)initOrganization {
    organization = [[Organization alloc] initWithName: @"organizationName"];
    [organization addEmployeeWithName:@"firstName1 lastName1"];
    [organization addEmployeeWithName:@"firstName2 lastName2"];
    [organization addEmployeeWithName:@"firstName3 lastName3"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return organization.employees.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"employeeCell" forIndexPath:indexPath];
    Employee *employee = organization.employees[indexPath.row];
    
    cell.textLabel.text = employee.fullname;
    
    return cell;
}

- (void)addEmployee:(Employee *)employee {
    [organization addEmployee:employee];
    [self.tableView reloadData];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier compare:@"detailEmployee"] == NSOrderedSame) {
        Employee *employee = organization.employees[self.tableView.indexPathForSelectedRow.row];
        DetailViewController *detailViewController = (DetailViewController *) segue.destinationViewController;
        
        detailViewController.employee = employee;
    } else if ([segue.identifier compare:@"saveEmployee"] == NSOrderedSame) {
        CreateEmployeeViewController *createEmployeeViewController = (CreateEmployeeViewController *) segue.destinationViewController;
        createEmployeeViewController.delegate = self;
    }
}

- (IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    
}

@end
