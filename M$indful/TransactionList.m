//
//  TransactionList.m
//  M$indful
//
//  Created by james bouker on 11/15/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import "UtilityBelt.h"
#import "Transaction.h"
#import "TransactionList.h"
#import "TransactionManager.h"

@implementation TransactionList

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        DECODE_DOUBLE(self.amount);
        DECODE_OBJECT(self.transactions);
        if (self.transactions == nil)
            self.transactions = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    ENCODE_OBJECT(self.transactions);
    ENCODE_PRIMITIVE(self.amount);
}

- (void)deduct:(double)amount forItem:(NSString*)category {
    Transaction* transaction = [[Transaction alloc] initWithCost:amount andCategory:category];
    [self.transactions addObject:transaction];
    self.amount -= amount;
    [self save];
}

- (void)increase:(double)amount because:(NSString*)category {
    Transaction* transaction = [[Transaction alloc] initWithIncome:amount andCategory:category];
    [self.transactions addObject:transaction];
    self.amount += amount;
    [self save];
}

- (NSArray *)purchases {
    return [self.transactions filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"isIncome == NO"]];
}

- (NSArray *)incomes {
    return [self.transactions filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"isIncome == YES"]];
}

- (void)save {
    [TransactionManager saveTransactions:self];
}

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    if (sharedInstance == nil) {
        dispatch_once(&onceToken, ^{
            sharedInstance = [TransactionManager loadTransactions];
        });
    }
    return sharedInstance;
}

@end
