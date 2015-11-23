//
//  CategoryViewController.m
//  M$indful
//
//  Created by james bouker on 11/15/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import "CategoryViewController.h"
#import "TransactionList.h"
#import "UtilityBelt.h"
#import "Transaction.h"

@interface CategoryViewController ()
@property (nonatomic, strong) TransactionList* list;
@property (nonatomic, strong) NSArray* purchases;
@end

@implementation CategoryViewController

#pragma mark - Setup

- (void)viewDidLoad {
    [super viewDidLoad];
    self.list = [TransactionList sharedInstance];
    self.purchases =  [UtilityBelt uniqueAndSortedArray:self.list.purchases forKey:@"category"];
    self.tableView.backgroundColor = nil;
    self.tableView.contentInset = UIEdgeInsetsMake(70, 0, 0, 0);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self chooseBestOption];
}

#pragma mark - Actions

- (IBAction)backButotnHit:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)nextButtonHit:(id)sender {
    [self.list deduct:self.amount forItem:@"Zebra"];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table View

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    for (UITableViewCell* cell in self.tableView.visibleCells) {
        NSIndexPath* indexPath = [self.tableView indexPathForCell:cell];
        CGRect rectInTableView = [self.tableView rectForRowAtIndexPath:indexPath];
        CGRect rectInSuperview = [self.tableView convertRect:rectInTableView toView:self.view];
        float y = rectInSuperview.origin.y;

        if (y <= 70) {
            cell.alpha = y/70.0;
        }
        else {
            cell.alpha = 1;
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.purchases.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"CatCell" forIndexPath:indexPath];
    if (cell) {
        cell.backgroundColor = nil;
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.text = self.purchases[indexPath.item];
    }
    return cell;
}

#pragma mark - Helpers

- (void)chooseBestOption {
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
