//
//  SelectUserViewController.m
//  TravelMate
//
//  Created by Hrishikesh  Pol on 05/11/14.
//  Copyright (c) 2014 Hrishikesh  Pol. All rights reserved.
//

#import "SelectUserViewController.h"

@interface SelectUserViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *kButtonSeperatorConstant;

- (IBAction)passangerButtonPressed:(id)sender;
- (IBAction)driverButtonPressed:(id)sender;

@end

@implementation SelectUserViewController

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
    
    if (isIPhone5() == NO)
    {
        self.kButtonSeperatorConstant.constant +=20;
    }
    self.view.userInteractionEnabled = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)passangerButtonPressed:(id)sender
{
//    [[NSUserDefaults standardUserDefaults] setObject:@"Passanger" forKey:@"UserType"];
    [self performSegueWithIdentifier:@"MainMenu" sender:self];
}

- (IBAction)driverButtonPressed:(id)sender
{
//    [[NSUserDefaults standardUserDefaults] setObject:@"Driver" forKey:@"UserType"];
    [self performSegueWithIdentifier:@"MainMenu" sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
