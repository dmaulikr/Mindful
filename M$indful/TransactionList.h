//
//  TransactionList.h
//  M$indful
//
//  Created by james bouker on 11/15/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransactionList : NSObject <NSCoding>
@property (nonatomic, strong) NSArray* transactions;

- (void)save;
+ (instancetype)sharedInstance;

@end
