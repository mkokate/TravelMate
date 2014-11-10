//
//  PassengerThirdChildController.m
//  TravelMate
//
//  Created by Mahesh on 11/9/14.
//  Copyright (c) 2014 Hrishikesh  Pol. All rights reserved.
//

#import "PassengerThirdChildController.h"
#import "RevealViewController.h"

@implementation PassengerThirdChildController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showRevealVC"] == YES)
    {
        UIViewController *frontVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FrontVC"];
        UIViewController *rearVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RearVC"];
        
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:frontVC];
        
        RevealViewController *revealVC = segue.destinationViewController;
        revealVC.frontViewController = nav;
        revealVC.rearViewController = rearVC;
    }
}
@end
