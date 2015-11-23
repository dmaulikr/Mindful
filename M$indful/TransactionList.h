//
//  TransactionList.h
//  M$indful
//
//  Created by james bouker on 11/15/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransactionList : NSObject <NSCoding>

@property (nonatomic, strong) NSMutableArray* transactions;
@property (readonly) NSArray* purchases;
@property (readonly) NSArray* incomes;
@property double amount;

- (void)deduct:(double)amount forItem:(NSString*)category;
- (void)increase:(double)amount because:(NSString*)category;

- (void)save;
+ (instancetype)sharedInstance;

@end
