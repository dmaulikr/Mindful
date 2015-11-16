//
//  TransactionList.m
//  M$indful
//
//  Created by james bouker on 11/15/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import "UtilityBelt.h"
#import "TransactionList.h"
#import "TransactionManager.h"

@implementation TransactionList

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        DECODE_OBJECT(self.transactions);
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    ENCODE_OBJECT(self.transactions);
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
