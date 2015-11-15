//
//  DeductViewController.m
//  M$indful
//
//  Created by james bouker on 11/14/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import "DeductViewController.h"

@interface DeductViewController ()
@property (nonatomic, strong) NSString* number;
@end

@implementation DeductViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.number = @"";
    self.moneyLabel.text = @"- $0.00";

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
    float num = self.number.floatValue;

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

    self.moneyLabel.text = [@"- " stringByAppendingString:labelText];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
