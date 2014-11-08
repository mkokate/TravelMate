//
//  MainMenuViewController.m
//  TravelMate
//
//  Created by Hrishikesh  Pol on 05/11/14.
//  Copyright (c) 2014 Hrishikesh  Pol. All rights reserved.
//

#import "MainMenuViewController.h"
#import "PassengerFirstChildController.h"
#import "PassengerSecondChildController.h"
#import "PassengerThirdChildController.h"


@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

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
    
    //Initialisation
    arrayForChildControllers = [[NSMutableArray alloc] init];
    
    self.navigationController.navigationBarHidden = YES;
    
    [self setPageViewController];
    
}


//Method to add UIPageViewController and for setting its properties
-(void)setPageViewController
{
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    //self.pageController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+40);
    
    [self setViewControllers];
    
    NSArray *array = [NSArray arrayWithObject:arrayForChildControllers[0]];
    
    [self.pageController setViewControllers:array direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
}



#pragma mark - PageViewController Methods

- (void)setViewControllers
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    PassengerFirstChildController *firstChild = [storyBoard instantiateViewControllerWithIdentifier:@"PassengerFirstChildController"];
    firstChild.view.tag = 0;
    PassengerSecondChildController *secondChild = [storyBoard instantiateViewControllerWithIdentifier:@"PassengerSecondChildController"];
    secondChild.view.tag = 1;
    PassengerThirdChildController *thirdChild = [storyBoard instantiateViewControllerWithIdentifier:@"PassengerThirdChildController"];
    thirdChild.view.tag = 2;
    
    [arrayForChildControllers addObject:firstChild];
    [arrayForChildControllers addObject:secondChild];
    [arrayForChildControllers addObject:thirdChild];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = viewController.view.tag;
    
    if (index == 0) {
        return nil;
    }
    
    // Decrease the index by 1 to return
    index--;
    
    return [arrayForChildControllers objectAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = viewController.view.tag;
    
    index++;
    
    if (index == 3) {
        return nil;
    }
    
    return [arrayForChildControllers objectAtIndex:index];
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 3;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}


#pragma mark - Memory Methods

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
