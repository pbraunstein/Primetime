//
//  PrimeTimeViewController.h
//  PrimeTime
//
//  Created by Phippe on 3/20/14.
//  Copyright (c) 2014 Phippe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrimeTimeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *timeInt;
@property (strong, nonatomic) IBOutlet UIImageView *numImg;

// Sets up view by grabbing time
- (void) viewDidLoad;

@end
