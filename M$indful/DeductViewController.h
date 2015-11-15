//
//  DeductViewController.h
//  M$indful
//
//  Created by james bouker on 11/14/15.
//  Copyright © 2015 Jimmy Bouker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeductViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray* buttons;
@property (weak, nonatomic) IBOutlet UILabel* moneyLabel;

- (IBAction)cancelButtonHit:(id)sender;
- (IBAction)deductButtonHit:(id)sender;

- (IBAction)numberButtonHit:(id)sender;
- (IBAction)decimalNumberHit:(id)sender;
- (IBAction)backspaceButtonHit:(id)sender;

@end
