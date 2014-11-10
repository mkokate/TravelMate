//
//  StartViewController.m
//  TravelMate
//
//  Created by Hrishikesh  Pol on 05/11/14.
//  Copyright (c) 2014 Hrishikesh  Pol. All rights reserved.
//

#import "StartViewController.h"
#import "RevealViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = YES;
    
    NSString *userType = [[NSUserDefaults standardUserDefaults] stringForKey:@"UserType"];
    if (isValidString(userType) == YES)
    {
        [self performSegueWithIdentifier:@"ShowRevealVC" sender:self];
    }
    else
    {
        [self performSegueWithIdentifier:@"SelectUser" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowRevealVC"] == YES)
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
