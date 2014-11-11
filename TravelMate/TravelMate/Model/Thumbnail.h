//
//  Thumbnail.h
//  TravelMate
//
//  Created by Hrishikesh  Pol on 11/11/14.
//  Copyright (c) 2014 Hrishikesh  Pol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Thumbnail : NSManagedObject

@property (nonatomic, retain) NSString * photoID;
@property (nonatomic, retain) NSString * photoUrl;

@end
