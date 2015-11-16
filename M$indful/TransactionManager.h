//
//  TransactionManager.h
//  M$indful
//
//  Created by james bouker on 11/15/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TransactionList.h"

@interface TransactionManager : NSObject

+ (TransactionList*)loadTransactions;
+ (void)saveTransactions:(TransactionList*)transactions;

@end
