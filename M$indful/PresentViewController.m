//
//  FirstViewController.m
//  M$indful
//
//  Created by james bouker on 11/12/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import "PresentViewController.h"
#import "UtilityBelt.h"

@interface PresentViewController ()

@end

@implementation PresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UtilityBelt addMotionToView:self.backgroundView];

    self.payButton.backgroundColor = [UIColor clearColor];
    self.earnButton.backgroundColor = [UIColor clearColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    double num = [[NSUserDefaults standardUserDefaults] doubleForKey:@"balance"];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    self.balanceLabel.text = [formatter stringFromNumber:@(num)];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"hasSetup"] == NO) {

        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"IntroView"];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
