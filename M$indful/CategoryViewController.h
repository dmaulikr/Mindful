//
//  CategoryViewController.h
//  M$indful
//
//  Created by james bouker on 11/15/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property double amount;
@property (nonatomic, weak) IBOutlet UITableView* tableView;

@end
