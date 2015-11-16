//
//  MoneyBaseViewController.h
//  M$indful
//
//  Created by james bouker on 11/15/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UtilityBelt.h"

@interface MoneyBaseViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray* buttons;
@property (nonatomic, weak) IBOutlet UIImageView* backgroundView;
@property (nonatomic, weak) IBOutlet UILabel* moneyLabel;
@property (nonatomic, strong) NSString* number;
@property BOOL addition;

- (IBAction)cancelButtonHit:(id)sender;
- (IBAction)nextButtonHit:(id)sender;

- (IBAction)numberButtonHit:(id)sender;
- (IBAction)decimalNumberHit:(id)sender;
- (IBAction)backspaceButtonHit:(id)sender;

@end
