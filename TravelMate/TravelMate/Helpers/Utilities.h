//
//  Utilities.h
//  RxManager
//
//  Created by synerzip on 10/03/14.
//  Copyright (c) 2014 RxNetwork. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT float const kReSyncIntervel;
FOUNDATION_EXPORT float const kSnoozeTimeIntervel;
FOUNDATION_EXPORT NSString *const kEventObjectID;
FOUNDATION_EXPORT NSString *const kLastSyncTime;

FOUNDATION_EXPORT NSString *const kMedicineReminderMessage;
FOUNDATION_EXPORT NSString *const kRefillReminderMessage;

FOUNDATION_EXPORT NSString *const kCreatedStatusForRequest;
FOUNDATION_EXPORT NSString *const kAcceptStatusForRequest;
FOUNDATION_EXPORT NSString *const kRejectedStatusForRequest;
FOUNDATION_EXPORT NSString *const kCompletedStatusForRequest;

@class AFHTTPClient;

@interface Utilities : NSObject

@end

#pragma mark - Cocoa Helpers

NSArray* arrayFromDictionaryForKey(NSDictionary *parent, NSString *key);
NSString* stringForObject(id object);
NSNumber* numberForObject(id object);
NSNumber* numberFromString(NSString *string);

BOOL isValidDictionary(NSDictionary *d);
BOOL isValidArray(NSArray *arr);
BOOL isValidString(NSString *str);
BOOL isValidStringChomped(NSString *str);

//
#pragma mark - webservices

NSDictionary* POSTOperationID(AFHTTPClient* httpClient, NSString* path);
NSDictionary* GETOperationID(AFHTTPClient* httpClient, NSString* path);
NSDictionary* PUTOperationID(AFHTTPClient* httpClient, NSString* path);
NSDictionary* DELETEOperationID(AFHTTPClient* httpClient, NSString* path);
void cancelHTTPOperation(NSDictionary* operationID);


#pragma mark - misc.

NSString* MD5Hash(NSString *plainText);
NSArray* splitFullName(NSString* fullName);
NSString* chomp(NSString* string);
NSString* chompn(NSString* string);

#pragma mark - Dates

NSString* dateStringWithAMPM(NSDate* date);
NSString* dateStringWithAP(NSDate* date);
NSString* dateStringForUpcomingMedications(NSDate* date);

NSString *dateStringWithCurrentTimeZone(NSDate* date);
NSDate* medCabinateDateFromString(NSString* dateString);
NSDate* dateAfterDaysFromDate(int days, NSDate* date);
NSDate* ISO8601DateWithTimeFromString(NSString* dateString);
NSString* MDYStringFromDate(NSDate* date);
NSString* MDYStringWithTimeFromDate(NSDate* date);
NSDateFormatter* RefillDateStringFormattor();

NSDate* refillDateFromRefillString(NSString* refillDateString);
NSString* stringFromRefillDate(NSDate* refillDate);
int daysOverDueFromRefillDate(NSDate *refillDate);
BOOL shouldDisplayRefillButtonForDayView(NSDate *refillDate);

NSDate* currentTimezoneDate(NSDate* date);
NSDate* GMTDate(NSDate* date);

NSInteger daysBetweenDate(NSDate* fromDateTime, NSDate* toDateTime);
NSDate* dateAfterDays(int days);
NSDate* beginningOfDay(NSDate* date);
NSDate* now();
NSDate* today();
NSDate* tomorrow();
NSDate* yesterday();

BOOL isTodaysDate(NSDate* date);
BOOL isTomorrowsDate(NSDate* date);

NSDate* nextDay(NSDate* date);
NSDate* previousDay(NSDate* date);
NSTimeInterval oneDayTimeInterval();

NSDate* GMTAdjustedDateFromJSONDate(id JSONDate);
NSDate* GMTAdjustedDateFromJSONDateString(NSString* JSONDateString);
NSDate* dateForJSONTimeIntervalObject(id object);
NSDate* dateForAMPMTime(NSString* AMPMTimeString);

NSString* formattedPhoneNumber(NSString* phoneNumber);
NSString* trimmedPhoneNumber(NSString* phoneNumber);
BOOL isValidPhoneNumber(NSString* trimmedPhoneNumber);
BOOL isValidEmail(NSString* email);

NSString* const authSecrete();
BOOL isIPhone5();

BOOL isNetworkError(NSError* error);
NSString* firstNameStringForMember(id name);
NSString* lastNameStringForMember(id name);

BOOL shouldHideAddMedicineOnDashboard (void);
NSString* timezoneString();

BOOL addSkipBackupAttributeToItemAtURL(NSURL * URL);
NSString* formattedPhoneNumberForPharmacy(NSString* tenDigitString);

