//
//  Transaction.m
//  M$indful
//
//  Created by james bouker on 11/15/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import "Transaction.h"
#import "UtilityBelt.h"

@implementation Transaction

- (instancetype)initWithIncome:(double)amount andCategory:(NSString*)category {
    self = [super init];
    if (self) {
        self.isIncome = YES;
        self.amount = amount;
        self.category = category;
        self.date = [NSDate date];
    }
    return self;
}

- (instancetype)initWithCost:(double)amount andCategory:(NSString*)category {
    if (self) {
        self.isIncome = NO;
        self.amount = amount;
        self.category = category;
        self.date = [NSDate date];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        DECODE_OBJECT(self.date);
        DECODE_BOOL(self.isIncome);
        DECODE_DOUBLE(self.amount);
        DECODE_OBJECT(self.category);
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    ENCODE_PRIMITIVE(self.isIncome);
    ENCODE_PRIMITIVE(self.amount);
    ENCODE_OBJECT(self.category);
    ENCODE_OBJECT(self.date);
}

@end
