//
//  Passanger.h
//  TravelMate
//
//  Created by Hrishikesh  Pol on 11/11/14.
//  Copyright (c) 2014 Hrishikesh  Pol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Passanger : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * dob;
@property (nonatomic, retain) NSString * sex;
@property (nonatomic, retain) NSString * emailID;
@property (nonatomic, retain) NSString * mobileNo;
@property (nonatomic, retain) NSString * photoUrl;

@end
