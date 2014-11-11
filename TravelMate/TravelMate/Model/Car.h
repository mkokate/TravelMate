//
//  Car.h
//  TravelMate
//
//  Created by Hrishikesh  Pol on 11/11/14.
//  Copyright (c) 2014 Hrishikesh  Pol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Car : NSManagedObject

@property (nonatomic, retain) NSString * carID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * model;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSNumber * isAC;
@property (nonatomic, retain) NSString * mobileNo;
@property (nonatomic, retain) NSString * photo1ID;
@property (nonatomic, retain) NSString * photo2ID;

@end
