//
//  DeductViewController.m
//  M$indful
//
//  Created by james bouker on 11/14/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import "DeductViewController.h"

@interface DeductViewController ()
@property (nonatomic, weak) IBOutlet UIButton* backButton;
@property (nonatomic, weak) IBOutlet UIButton* nextButton;
@property (nonatomic, weak) IBOutlet UIView* topPanel;
@end

@implementation DeductViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.moneyLabel.text = @"- $0.00";
    self.addition = NO;

    for (UIButton* button in self.buttons) {
//        button.layer.borderWidth = 2;
        button.titleLabel.font = [button.titleLabel.font fontWithSize:22];
//        float red = (arc4random()%100) / 100.0;
//        float green = (arc4random()%100) / 100.0;
//        float blue = (arc4random()%100) / 100.0;
//        button.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:.3];
        button.backgroundColor = nil;
    }

    self.nextButton.backgroundColor = nil;
    self.backButton.backgroundColor = nil;
    self.topPanel.backgroundColor = nil;

    UIView* overlay = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    overlay.backgroundColor = [UIColor colorWithWhite:0 alpha:.3];
    [self.view insertSubview:overlay aboveSubview:self.backgroundView];

    [UtilityBelt addMotionToView:self.backgroundView size:CGSizeMake(20, 20)];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CategoryViewController* categoryViewController = (CategoryViewController*)segue.destinationViewController;
    categoryViewController.amount = self.number.doubleValue;
}

@end
