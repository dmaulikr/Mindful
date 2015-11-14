//
//  UtilityBelt.m
//  M$indful
//
//  Created by james bouker on 11/12/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import "UtilityBelt.h"

@implementation UtilityBelt

+ (void)addMotionToView:(UIView *)view {
    // Set vertical effect
    UIInterpolatingMotionEffect *verticalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalMotionEffect.minimumRelativeValue = @(-20);
    verticalMotionEffect.maximumRelativeValue = @(20);

    // Set horizontal effect
    UIInterpolatingMotionEffect *horizontalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalMotionEffect.minimumRelativeValue = @(-20);
    horizontalMotionEffect.maximumRelativeValue = @(20);

    // Create group to combine both
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];

    // Add both effects to your view
    [view addMotionEffect:group];
}

@end
