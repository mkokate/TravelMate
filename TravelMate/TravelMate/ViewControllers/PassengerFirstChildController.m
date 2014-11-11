//
//  PassengerFirstChildController.m
//  TravelMate
//
//  Created by Mahesh on 11/8/14.
//  Copyright (c) 2014 Hrishikesh  Pol. All rights reserved.
//

#import "PassengerFirstChildController.h"

@interface PassengerFirstChildController ()
@property (weak, nonatomic) IBOutlet UITextField *txtPickUpAddress;
@property (weak, nonatomic) IBOutlet UITextField *txtDropAddress;


@end

@implementation PassengerFirstChildController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.inputAccessoryView = [XCDFormInputAccessoryView new];
}

@end
