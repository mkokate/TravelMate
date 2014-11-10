//
//  CreateProfileController.m
//  TravelMate
//
//  Created by Mahesh on 11/10/14.
//  Copyright (c) 2014 Hrishikesh  Pol. All rights reserved.
//

#import "CreateProfileController.h"

@implementation CreateProfileController
{
    
}


#pragma mark - Button Methods

- (IBAction)btnBackClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Textfield Delegate Methods

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    scrollview.frame = CGRectMake(0, scrollview.frame.origin.y, scrollview.frame.size.width, scrollview.frame.size.height - 180);
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
   scrollview.frame = CGRectMake(0, scrollview.frame.origin.y, scrollview.frame.size.width, scrollview.frame.size.height + 180);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


@end
