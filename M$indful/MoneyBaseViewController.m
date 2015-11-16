//
//  MoneyBaseViewController.m
//  M$indful
//
//  Created by james bouker on 11/15/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import "MoneyBaseViewController.h"

@implementation MoneyBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.number = @"";

    for (UIButton* button in self.buttons) {
        button.layer.borderColor = button.titleLabel.textColor.CGColor;
        button.layer.cornerRadius = button.frame.size.height/2.0;
        button.layer.borderWidth = 1.0;
    }
}

- (IBAction)cancelButtonHit:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)nextButtonHit:(id)sender {
    double balance = [[NSUserDefaults standardUserDefaults] doubleForKey:@"balance"];
    if (self.addition)  balance = balance + self.number.doubleValue;
    else                balance = balance - self.number.doubleValue;

    [[NSUserDefaults standardUserDefaults] setDouble:balance forKey:@"balance"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    [self performSegueWithIdentifier:@"next" sender:self];
}

- (IBAction)numberButtonHit:(id)sender {
    int numPressed = (int)[sender tag];
    if ([self.number containsString:@"."] && [self.number rangeOfString:@"."].location == self.number.length-3) {
        return;
    }
    self.number = [self.number stringByAppendingFormat:@"%d", numPressed];
    [self updateNumberText];
}

- (IBAction)decimalNumberHit:(id)sender {
    if ([self.number containsString:@"."] == NO) {
        self.number = [self.number stringByAppendingString:@"."];
        [self updateNumberText];
    }
}

- (IBAction)backspaceButtonHit:(id)sender {
    if (self.number.length > 0) {
        self.number = [self.number substringToIndex:self.number.length-1];
        [self updateNumberText];
    }
}


- (void)updateNumberText {
    double num = self.number.doubleValue;

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString* labelText = [formatter stringFromNumber:@(num)];

    if ([self.number containsString:@"."] == NO) {
        labelText = [labelText stringByReplacingOccurrencesOfString:@".00" withString:@""];
    }
    else if ([self.number containsString:@"."]) {
        if ([self.number characterAtIndex:self.number.length-1] == '.') {
            //. is last char, remove 00 from end of string
            labelText = [labelText substringToIndex:labelText.length-2];
        }
        else if (self.number.length >= 2 && [self.number characterAtIndex:self.number.length-2] == '.') {
            //.# is last char, remove 0 from end of string
            labelText = [labelText substringToIndex:labelText.length-1];
        }
    }

    if (self.addition)  self.moneyLabel.text = [@"+ " stringByAppendingString:labelText];
    else                self.moneyLabel.text = [@"- " stringByAppendingString:labelText];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
