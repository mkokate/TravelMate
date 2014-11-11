//
//  Route.h
//  TravelMate
//
//  Created by Hrishikesh  Pol on 11/11/14.
//  Copyright (c) 2014 Hrishikesh  Pol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Route : NSManagedObject

@property (nonatomic, retain) NSString * routeID;
@property (nonatomic, retain) NSString * fromLocation;
@property (nonatomic, retain) NSString * toLocation;
@property (nonatomic, retain) NSString * intermediate;

@end
