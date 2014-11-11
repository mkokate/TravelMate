//
//  PassengerThirdChildController.m
//  TravelMate
//
//  Created by Mahesh on 11/9/14.
//  Copyright (c) 2014 Hrishikesh  Pol. All rights reserved.
//

#import "PassengerThirdChildController.h"
#import "RevealViewController.h"

@interface PassengerThirdChildController ()

@property (weak, nonatomic) IBOutlet UITextField *txtEmailID;
@property (weak, nonatomic) IBOutlet UITextField *txtPhoneNo;
@property (weak, nonatomic) IBOutlet UISwitch *switchAC;
@property (weak, nonatomic) IBOutlet UISwitch *switchSmoker;
@property (weak, nonatomic) IBOutlet UISwitch *switchGender;
@property (weak, nonatomic) IBOutlet UISwitch *switchMusic;

-(IBAction)switchValueChanged:(UISwitch *)sender;

@end

@implementation PassengerThirdChildController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.inputAccessoryView = [XCDFormInputAccessoryView new];
}

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

-(IBAction)switchValueChanged:(UISwitch *)sender
{
    NSInteger tag = sender.tag;
    switch (tag)
    {
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        default:
            break;
    }
}
@end
