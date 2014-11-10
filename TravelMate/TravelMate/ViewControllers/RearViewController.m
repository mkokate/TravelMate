//
//  RearViewController.m
//  TravelMate
//
//  Created by Hrishikesh  Pol on 10/11/14.
//  Copyright (c) 2014 Hrishikesh  Pol. All rights reserved.
//

#import "RearViewController.h"
#import "MenuTableViewCell.h"
#import "ProfileViewController.h"
#import "MyBookingsViewController.h"
#import "ShareViewController.h"
#import "RateViewController.h"
#import "ReportAbuseViewController.h"
#import "RevealViewController.h"
#import "FrontViewController.h"

@interface RearViewController ()

@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property (nonatomic, retain) NSArray *dataArray;

@end

@implementation RearViewController

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
    
    self.dataArray = [[NSArray alloc] initWithObjects:@"Home", @"Profile", @"My Bookings", @"Share", @"Rate", @"Report Abuse", nil];
    [self.listTableView registerNib:[UINib nibWithNibName:@"MenuTableViewCell" bundle:nil] forCellReuseIdentifier:@"MenuTableViewCell"];
}

#pragma mark UITableViewCell DataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self basicCellAtIndexPath:indexPath];
}

- (MenuTableViewCell *)basicCellAtIndexPath:(NSIndexPath *)indexPath {
    MenuTableViewCell *cell = [self.listTableView dequeueReusableCellWithIdentifier:@"MenuTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [self configureBasicCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureBasicCell:(MenuTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    cell.lblTitle.text = self.dataArray[indexPath.row];
}

#pragma mark UITableViewCell Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Grab a handle to the reveal controller, as if you'd do with a navigtion controller via self.navigationController.
	RevealViewController *revealController = [self.parentViewController isKindOfClass:[RevealViewController class]] ? (RevealViewController *)self.parentViewController : nil;
    if (indexPath.row == 0)
	{
		// Now let's see if we're not attempting to swap the current frontViewController for a new instance of ITSELF, which'd be highly redundant.
		if ([revealController.frontViewController isKindOfClass:[UINavigationController class]] && ![((UINavigationController *)revealController.frontViewController).topViewController isKindOfClass:[FrontViewController class]])
		{
			FrontViewController *frontViewController = [[FrontViewController alloc] init];
			UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
			[revealController setFrontViewController:navigationController animated:NO];
			
		}
		// Seems the user attempts to 'switch' to exactly the same controller he came from!
		else
		{
			[revealController revealToggle:self];
		}
	}
    else if (indexPath.row == 1)
	{
		if ([revealController.frontViewController isKindOfClass:[UINavigationController class]] && ![((UINavigationController *)revealController.frontViewController).topViewController isKindOfClass:[ProfileViewController class]])
		{
			ProfileViewController *profileViewController = [[ProfileViewController alloc] init];
			UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:profileViewController];
			[revealController setFrontViewController:navigationController animated:NO];
		}
		// Seems the user attempts to 'switch' to exactly the same controller he came from!
		else
		{
			[revealController revealToggle:self];
		}
	}
	else if (indexPath.row == 2)
	{
        if ([revealController.frontViewController isKindOfClass:[UINavigationController class]] && ![((UINavigationController *)revealController.frontViewController).topViewController isKindOfClass:[MyBookingsViewController class]])
		{
			MyBookingsViewController *viewController = [[MyBookingsViewController alloc] init];
			UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
			[revealController setFrontViewController:navigationController animated:NO];
		}
		// Seems the user attempts to 'switch' to exactly the same controller he came from!
		else
		{
			[revealController revealToggle:self];
		}
	}
	else if (indexPath.row == 3)
	{
        if ([revealController.frontViewController isKindOfClass:[UINavigationController class]] && ![((UINavigationController *)revealController.frontViewController).topViewController isKindOfClass:[ShareViewController class]])
		{
			ShareViewController *viewController = [[ShareViewController alloc] init];
			UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
			[revealController setFrontViewController:navigationController animated:NO];
		}
		// Seems the user attempts to 'switch' to exactly the same controller he came from!
		else
		{
			[revealController revealToggle:self];
		}
	}
    else if (indexPath.row == 4)
	{
        if ([revealController.frontViewController isKindOfClass:[UINavigationController class]] && ![((UINavigationController *)revealController.frontViewController).topViewController isKindOfClass:[RateViewController class]])
		{
			RateViewController *viewController = [[RateViewController alloc] init];
			UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
			[revealController setFrontViewController:navigationController animated:NO];
		}
		// Seems the user attempts to 'switch' to exactly the same controller he came from!
		else
		{
			[revealController revealToggle:self];
		}
	}
	else if (indexPath.row == 5)
	{
        if ([revealController.frontViewController isKindOfClass:[UINavigationController class]] && ![((UINavigationController *)revealController.frontViewController).topViewController isKindOfClass:[ReportAbuseViewController class]])
		{
			ReportAbuseViewController *viewController = [[ReportAbuseViewController alloc] init];
			UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
			[revealController setFrontViewController:navigationController animated:NO];
		}
		// Seems the user attempts to 'switch' to exactly the same controller he came from!
		else
		{
			[revealController revealToggle:self];
		}
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
