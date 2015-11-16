//
//  TransactionManager.m
//  M$indful
//
//  Created by james bouker on 11/15/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import "TransactionManager.h"

@implementation TransactionManager

+ (NSString*)transactionPath {
    NSString* documentsDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    return [documentsDir stringByAppendingPathComponent:@"transaction.data"];
}

+ (TransactionList*)loadTransactions {
    NSString* transactionPath = [TransactionManager transactionPath];
    NSData *codedData = [[NSData alloc] initWithContentsOfFile:transactionPath];
    if (codedData == nil) {
        return [[TransactionList alloc] init];
    }

    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:codedData];
    TransactionList* transactions = [unarchiver decodeObjectForKey:@"transactions"];
    [unarchiver finishDecoding];

    return transactions;
}

+ (void)saveTransactions:(TransactionList*)transactions {
    if (transactions == nil)
        return;

    NSString* transactionPath = [TransactionManager transactionPath];

    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];

    [archiver encodeObject:transactions forKey:@"transactions"];
    [archiver finishEncoding];
    [data writeToFile:transactionPath atomically:YES];
}

@end
