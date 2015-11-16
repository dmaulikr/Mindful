//
//  Transaction.h
//  M$indful
//
//  Created by james bouker on 11/15/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Transaction : NSObject <NSCoding>
@property BOOL isIncome;
@property double amount;
@property (nonatomic, strong) NSDate* date;
@property (nonatomic, strong) NSString* category;
@end
