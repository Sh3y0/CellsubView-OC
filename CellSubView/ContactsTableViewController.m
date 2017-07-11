//
//  ContactsTableViewController.m
//  CellSubView
//
//  Created by Eliseo_Martinez on 4/13/15.
//  Copyright (c) 2015 Arc1Lab. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "CustomCell.h"

@interface ContactsTableViewController ()

@property (nonatomic, strong)NSArray *contactsArray;
@property (nonatomic, strong)NSDictionary *contact;

@end

@implementation ContactsTableViewController

@synthesize contactsArray, contact;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"contacts" ofType:@"plist"];
    
    contactsArray = [NSArray arrayWithContentsOfFile:path];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [contactsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CustomCell *customCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    contact  =  contactsArray[indexPath.row];
    
    NSString *firstName = contact[@"firstName"];
    NSString *lastName = contact[@"lastName"];
    NSString *imageName = contact[@"imageName"];
    
    UIImage *image = [UIImage imageNamed:imageName];
    customCell.customFisrtNameLabel.text = firstName;
    customCell.customLastNameLabel.text = lastName;
    customCell.customImageView.image = image;
    
    return customCell;
}
@end
