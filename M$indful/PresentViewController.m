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

//    self.payButton.layer.cornerRadius = self.payButton.frame.size.height / 2.0;
//    self.payButton.layer.borderColor = self.payButton.titleLabel.textColor.CGColor;
    self.payButton.backgroundColor = [UIColor clearColor];
//    self.payButton.layer.borderWidth = 2.0;


//    self.earnButton.layer.cornerRadius = self.earnButton.frame.size.height / 2.0;
//    self.earnButton.layer.borderColor = self.earnButton.titleLabel.textColor.CGColor;
    self.earnButton.backgroundColor = [UIColor clearColor];
//    self.earnButton.layer.borderWidth = 2.0;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"hasSetup"] == NO) {

        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"IntroView"];
        [self presentViewController:vc animated:YES completion:nil];
    }
}


@end
