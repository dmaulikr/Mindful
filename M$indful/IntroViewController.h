//
//  IntroViewController.h
//  M$indful
//
//  Created by james bouker on 11/12/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView* background;
@property (nonatomic, weak) IBOutlet UIView *overlayView;
@property (nonatomic, weak) IBOutlet UIButton *beginButton;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIView* screenshotContainer;
@property (nonatomic, weak) IBOutlet UIButton* nextButton;

@property (nonatomic, weak) IBOutlet UILabel* infoTitle;
@property (nonatomic, weak) IBOutlet UILabel* infoText;

- (IBAction)beginButtonHit:(id)sender;
- (IBAction)nextButtonHit:(id)sender;

@end
