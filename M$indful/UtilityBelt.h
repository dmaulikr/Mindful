//
//  UtilityBelt.h
//  M$indful
//
//  Created by james bouker on 11/12/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define TO_STRING(x)                @#x
#define ENCODE_OBJECT(x)            [encoder encodeObject:x forKey:TO_STRING(x)]
#define ENCODE_SIZE(x)              [encoder encodeObject:[NSValue valueWithCGSize:x] forKey:TO_STRING(x)]
#define ENCODE_PRIMITIVE(x)         [encoder encodeObject:@(x) forKey:TO_STRING(x)]

#define DECODE_OBJECT(x)            x = [decoder decodeObjectForKey:TO_STRING(x)]
#define DECODE_BOOL(x)              x = [[decoder decodeObjectForKey:TO_STRING(x)] boolValue]
#define DECODE_INT(x)               x = [[decoder decodeObjectForKey:TO_STRING(x)] intValue]
#define DECODE_DOUBLE(x)            x = [[decoder decodeObjectForKey:TO_STRING(x)] doubleValue]
#define DECODE_SIZE(x)              x = [[decoder decodeObjectForKey:TO_STRING(x)] CGSizeValue]

@interface UtilityBelt : NSObject

+ (void)addMotionToView:(UIView *)view size:(CGSize)size;
+ (void)addMotionToView:(UIView*)view;

+ (NSArray*)uniqueAndSortedArray:(NSArray*)array forKey:(NSString*)key;

@end
