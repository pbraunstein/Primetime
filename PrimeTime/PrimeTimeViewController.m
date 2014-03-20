//
//  PrimeTimeViewController.m
//  PrimeTime
//
//  Created by Phippe on 3/20/14.
//  Copyright (c) 2014 Phippe. All rights reserved.
//

#import "PrimeTimeViewController.h"
@implementation PrimeTimeViewController


@synthesize timeInt = _timeInt;
@synthesize numImg = _numImg;

- (void) viewDidLoad

{
    [self setTimeShenanigans];

}

- (void) setTimeShenanigans
{
    /* Thanks to http://stackoverflow.com/questions/566265/retrieving-current-local-time-on-iphone */
    
    // Get current time, formatting magic, set it using setter
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *currentTime = [dateFormatter stringFromDate:today];
    [self.timeInt setText:currentTime];
    
    // Get string without colon to make number
    NSString *stringWithOutColon = [currentTime stringByReplacingOccurrencesOfString:@":" withString:@""];
    int value = [stringWithOutColon intValue];
    
    // Check if time is prime
    if ([self isPrime:value]) {
    UIImage *image = [UIImage imageNamed: @"successImg.png"];
    [self.numImg setImage:image];
    }
    else
    {
        UIImage *image = [UIImage imageNamed:@"failImg.png"];
        [self.numImg setImage:image];
    }
}

- (BOOL) isPrime:(int)num
{
    int i;
    for (i = 2; i < num; i++)
    {
            if (num % i == 0)
                return NO;
    }
    return YES;
}




@end
