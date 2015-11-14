//
//  IntroViewController.m
//  M$indful
//
//  Created by james bouker on 11/12/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import "IntroViewController.h"
#import "UtilityBelt.h"

@interface IntroViewController ()
@property (nonatomic, strong) NSArray* titles;
@property (nonatomic, strong) NSArray* texts;
@property int pageNum;
@end

@implementation IntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titles = @[@"Discover", @"Goals", @"Mindful", @"Secure"];
    self.texts = @[@"Learn where you spend most of your hard earned cash", @"Forecast your financial future in 1 simple swipe", @"Never out of sight, never out of mind", @"Data encrypted to the last drop."];

    [UtilityBelt addMotionToView:self.background];

    self.beginButton.layer.cornerRadius = self.beginButton.frame.size.height/2.0;
    self.screenshotContainer.layer.cornerRadius = 5;
    
    self.overlayView.alpha = 0;
    self.beginButton.alpha = 0;
    self.titleLabel.alpha = 0;
    self.screenshotContainer.alpha = 0;
    self.nextButton.alpha = 0;
    self.infoTitle.alpha = 0;
    self.infoText.alpha = 0;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.5 animations:^{
            self.overlayView.alpha = 1;
            self.beginButton.alpha = 1;
            self.titleLabel.alpha = 1;
        }];
    });
}

- (IBAction)beginButtonHit:(id)sender {
    UIView* v = [[UIView alloc] initWithFrame:self.beginButton.frame];
    v.backgroundColor = self.beginButton.backgroundColor;
    CGRect frame = v.frame;
    frame.origin.x += 100;
    frame.size.width -= 200;
    v.frame = frame;
    v.layer.cornerRadius = v.frame.size.height/2.0;


    frame.origin.x = -50;
    frame.size.width = [UIScreen mainScreen].bounds.size.width+110;
    frame.size.height += 20;
    
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;

    [self.overlayView insertSubview:v belowSubview:self.beginButton];
    self.beginButton.backgroundColor = [UIColor clearColor];


    [UIView animateWithDuration:0.1 animations:^{
        self.beginButton.alpha = 0;
    }];
    [UIView animateWithDuration:0.25 animations:^{
        self.beginButton.alpha = 0;
        self.titleLabel.alpha = 0;
        v.frame = frame;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            self.screenshotContainer.alpha = 1;
            self.nextButton.alpha = 1;
            self.infoTitle.alpha = 1;
            self.infoText.alpha = 1;
        }];
    }];
}

- (IBAction)nextButtonHit:(id)sender {
    self.pageNum++;
    if (self.pageNum >= self.titles.count) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasSetup"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    else {
        self.infoTitle.text = self.titles[self.pageNum];
        self.infoText.text = self.texts[self.pageNum];
    }

    if (self.pageNum == self.titles.count-1) {
        [self.nextButton setTitle:@"Get Started" forState:UIControlStateNormal];
        self.nextButton.titleLabel.font = [self.nextButton.titleLabel.font fontWithSize:32];
    }
}

@end
