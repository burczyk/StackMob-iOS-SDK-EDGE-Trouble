//
//  ViewController.h
//  StackMobEDGETest
//
//  Created by Kamil Burczyk on 29.08.2013.
//  Copyright (c) 2013 Sigmapoint. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)buttonSavePhotoPushed:(UIButton *)sender;

@end
