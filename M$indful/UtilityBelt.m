//
//  UtilityBelt.m
//  M$indful
//
//  Created by james bouker on 11/12/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import "UtilityBelt.h"

@implementation UtilityBelt

+ (void)addMotionToView:(UIView *)view size:(CGSize)size {
    // Set vertical effect
    UIInterpolatingMotionEffect *verticalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalMotionEffect.minimumRelativeValue = @(-size.height);
    verticalMotionEffect.maximumRelativeValue = @(size.height);

    // Set horizontal effect
    UIInterpolatingMotionEffect *horizontalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalMotionEffect.minimumRelativeValue = @(-size.width);
    horizontalMotionEffect.maximumRelativeValue = @(size.width);

    // Create group to combine both
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];

    // Add both effects to your view
    [view addMotionEffect:group];
}

+ (void)addMotionToView:(UIView *)view {
    [UtilityBelt addMotionToView:view size:CGSizeMake(20, 20)];
}

@end
