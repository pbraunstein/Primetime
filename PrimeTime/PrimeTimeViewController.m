//
//  PrimeTimeViewController.m
//  PrimeTime
//
//  Created by Phippe on 3/20/14.
//  Copyright (c) 2014 Phippe. All rights reserved.
//

#import "PrimeTimeViewController.h"

// Private methods
@interface PrimeTimeViewController()

// Function that gets the date and sees if prime
- (void) checkTime;

// Calculates whether input number is prime
- (BOOL) isPrime:(int)num;

// Wrapper around the timer that calls checkTime method
- (void) startWatch;
@end

@implementation PrimeTimeViewController


// Still not clear to me why I need to do this
@synthesize timeInt = _timeInt;
@synthesize numImg = _numImg;

- (void) viewDidLoad

{
    [self checkTime];  // Checktime first manually
    [self startWatch];

}

- (void) startWatch
{
    NSTimer *myTimer = [NSTimer scheduledTimerWithTimeInterval: 10.0 target:self selector: @selector(checkTime) userInfo:nil repeats:YES];
    
    // This is just to shut the compiler up about unused variable warning
    (void) myTimer;
}

- (void) checkTime
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
    
    // Handle special cases
    if (num <= 0)
        return NO;
    else if (num == 1)
        return YES;
    else  // Meat of the loop -- normal circumstancs
    {
        for (i = 2; i < num; i++)
        {
                if (num % i == 0)
                    return NO;
        }
    
        return YES;
    }
}




@end
