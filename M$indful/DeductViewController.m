//
//  DeductViewController.m
//  M$indful
//
//  Created by james bouker on 11/14/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import "DeductViewController.h"

@implementation DeductViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    for (UIButton* button in self.buttons) {
        button.layer.borderColor = button.titleLabel.textColor.CGColor;
        button.layer.cornerRadius = button.frame.size.height/2.0;
        button.layer.borderWidth = 1.0;
    }
}

- (IBAction)cancelButtonHit:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)deductButtonHit:(id)sender {
    // perform segue to Category view
}

- (IBAction)numberButtonHit:(id)sender {
    // grab number from tag
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
