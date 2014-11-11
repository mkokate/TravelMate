//
//  Advertisement.h
//  TravelMate
//
//  Created by Hrishikesh  Pol on 11/11/14.
//  Copyright (c) 2014 Hrishikesh  Pol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Advertisement : NSManagedObject

@property (nonatomic, retain) NSString * serialNo;
@property (nonatomic, retain) NSString * mobileNo;
@property (nonatomic, retain) NSString * fromLocation;
@property (nonatomic, retain) NSString * toLocation;
@property (nonatomic, retain) NSString * intermediate;
@property (nonatomic, retain) NSString * carID;
@property (nonatomic, retain) NSString * price;
@property (nonatomic, retain) NSString * startTime;
@property (nonatomic, retain) NSString * endTime;

@end
