//
//  PassengerSecondChildController.m
//  TravelMate
//
//  Created by Mahesh on 11/9/14.
//  Copyright (c) 2014 Hrishikesh  Pol. All rights reserved.
//

#import "PassengerSecondChildController.h"

@interface PassengerSecondChildController ()

@property (weak, nonatomic) IBOutlet UITextField *txtJorneyDate;
@property (weak, nonatomic) IBOutlet UITextField *txtJorneyTime;

-(IBAction)openDateAndTimePicker:(UIButton *)sender;

@end

@implementation PassengerSecondChildController

-(IBAction)openDateAndTimePicker:(UIButton *)sender
{
    NSInteger tag = sender.tag;
    switch (tag) {
        case 1:
            // Open date picker.
            break;
        case 2:
            //Open time picker.
            break;
        default:
            break;
    }
}
@end
