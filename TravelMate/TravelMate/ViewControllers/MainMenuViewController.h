//
//  MainMenuViewController.h
//  TravelMate
//
//  Created by Hrishikesh  Pol on 05/11/14.
//  Copyright (c) 2014 Hrishikesh  Pol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuViewController : UIViewController <UIPageViewControllerDelegate,UIPageViewControllerDataSource>
{
    NSMutableArray *arrayForChildControllers;
}

@property(nonatomic, strong)UIPageViewController *pageController;

@end
