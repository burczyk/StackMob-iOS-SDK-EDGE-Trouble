//
//  ViewController.m
//  StackMobEDGETest
//
//  Created by Kamil Burczyk on 29.08.2013.
//  Copyright (c) 2013 Sigmapoint. All rights reserved.
//

#import "ViewController.h"
#import "Profile.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonSavePhotoPushed:(UIButton *)sender {
    NSLog(@"saving profile start with context: %@", SMCONTEXT);
    [self createProfile];
    [self saveContextForCurrentThread];
}

- (IBAction)buttonSavePhotoGCDPushed:(UIButton *)sender {
    NSLog(@"buttonSavePhotoGCDPushed with context outside: %@", SMCONTEXT);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSLog(@"saving profile GCD start with context: %@", SMCONTEXT);
        [self createProfile];
        [self saveContextForCurrentThread];
    });
    
}

- (void) createProfile {
    Profile *profile = [Profile MR_createInContext:SMCONTEXT];
    [profile assignObjectId];
    profile.photo = [SMBinaryDataConversion stringForBinaryData:UIImageJPEGRepresentation([UIImage imageNamed:@"color_square.png"], 1) name:@"color_square.png" contentType:@"image/png"];
}

- (void) saveContextForCurrentThread {
    NETWORK_ON;
    [_activityIndicator startAnimating];
    
    [SMCONTEXT saveOnSuccess:^{
        NSLog(@"context save success");
        NETWORK_OFF;
        [_activityIndicator stopAnimating];
    } onFailure:^(NSError *error) {
        NSLog(@"context save error");
        NETWORK_OFF;
        [_activityIndicator stopAnimating];
    }];
}

@end
