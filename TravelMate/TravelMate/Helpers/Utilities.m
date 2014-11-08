//
//  Utilities.m
//  RxManager
//
//  Created by synerzip on 10/03/14.
//  Copyright (c) 2014 RxNetwork. All rights reserved.
//

#import "Utilities.h"
#import <CommonCrypto/CommonDigest.h>

// 1 min re-sync intervel
float const kReSyncIntervel = 60.0f;
float const kSnoozeTimeIntervel = (10 * 60.0f);

static const int kPhoneNumberLenght = 10;
static const int kNumberOfDaysToRefillLimit = 5;

NSString *const kEventObjectID = @"eventObjectID";
NSString *const kLastSyncTime = @"LastSyncTime";

NSString *const kMedicineReminderMessage = @"Medicine time!!";
NSString *const kRefillReminderMessage = @"You have pending refills!!";

NSString *const kCreatedStatusForRequest = @"CREATED";
NSString *const kRejectedStatusForRequest = @"REJECT";
NSString *const kCompletedStatusForRequest = @"SCHEDULE";
NSString *const kAcceptStatusForRequest = @"ACCEPT";

NSString *const kRecalledMedicationStatus = @"RECALLED";

@implementation Utilities

@end

#pragma mark - Cocoa Helpers

NSArray* arrayFromDictionaryForKey(NSDictionary *parent, NSString *key)
{
    if (isValidDictionary(parent))
    {
        id obj = [parent objectForKey:key];
        if ([obj isEqual:[NSNull null]] || nil == obj)
        {
            return [NSArray array];;
        }
        else if ([obj isKindOfClass:NSArray.class])
        {
            return obj;
        }
        
        return @[obj];
    }
    return [NSArray array];
}

NSString* stringForObject(id object)
{
    if (object == nil || [object isEqual:[NSNull null]]) return @"";
    return [NSString stringWithFormat:@"%@", object];
}

NSNumber* numberForObject(id object)
{
    if (object == nil || [object isEqual:[NSNull null]]) return nil;
    
    if ([object isKindOfClass:[NSNumber class]])
    {
        return object;
    }
    return nil;
}


NSNumber* numberFromString(NSString *string)
{
    if (isValidString(string))
    {
        return nil;
    }
    NSNumberFormatter * numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    return  [numberFormatter numberFromString: string];
}

inline BOOL isValidDictionary(NSDictionary *d)
{
    if (d == nil || [d isEqual:[NSNull null]]) return NO;
    return [d isKindOfClass:NSDictionary.class] && (d.allKeys.count > 0);
}

inline BOOL isValidArray(NSArray *arr)
{
    if (arr == nil || [arr isEqual:[NSNull null]]) return NO;
    return [arr isKindOfClass:NSArray.class] && (arr.count > 0);
}

inline BOOL isValidString(NSString *str)
{
    if (str == nil || [str isEqual:[NSNull null]]) return NO;
    return (str.length > 0);
}

inline BOOL isValidStringChomped(NSString *str)
{
    return (chomp(str).length > 0);
}

inline NSString* chomp(NSString* string)
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

inline NSString* chompn(NSString* string)
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


#pragma mark - Dates

NSString* dateStringWithAMPM(NSDate* date)
{
    static NSDateFormatter *AMPMDateFormattor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AMPMDateFormattor = [[NSDateFormatter alloc] init];
        AMPMDateFormattor.dateFormat = @"hh:mm a";
        AMPMDateFormattor.timeZone = [NSTimeZone defaultTimeZone];
    });
    return [AMPMDateFormattor stringFromDate:date];
}

NSString* dateStringWithAP(NSDate* date)
{
    NSString* stringWithAMPM = [dateStringWithAMPM(date) uppercaseString];
    NSString* outString = [stringWithAMPM stringByReplacingOccurrencesOfString:@"AM" withString:@"A"];
    outString = [outString stringByReplacingOccurrencesOfString:@"PM" withString:@"P"];
    outString = [outString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return outString;
}

NSString* dateStringForUpcomingMedications(NSDate* date)
{
    static NSDateFormatter *AMPMMonthDateFormattor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AMPMMonthDateFormattor = [[NSDateFormatter alloc] init];
        AMPMMonthDateFormattor.dateFormat = @"dd MMM";
        AMPMMonthDateFormattor.timeZone = [NSTimeZone defaultTimeZone];
    });
    return [AMPMMonthDateFormattor stringFromDate:date];
}

inline NSDate* currentTimezoneDate(NSDate* GMTDate)
{
    NSInteger secondsFromGMT = [[NSTimeZone defaultTimeZone] secondsFromGMT];
    NSDate* date = [GMTDate dateByAddingTimeInterval:-(secondsFromGMT)];
    return date;
}

inline NSDate* GMTDate(NSDate* currentTimezoneDate)
{
    NSInteger secondsFromGMT = [[NSTimeZone defaultTimeZone] secondsFromGMT];
    NSDate* date = [currentTimezoneDate dateByAddingTimeInterval:(secondsFromGMT)];
    return date;
}


NSDate* dateForAMPMTime(NSString* AMPMTimeString)
{
    static NSDateFormatter* AMPMTimeStringFormattor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AMPMTimeStringFormattor = [[NSDateFormatter alloc] init];
        [AMPMTimeStringFormattor setDateFormat:@"h:mm a"];
    });
    NSDate* date = [AMPMTimeStringFormattor dateFromString:AMPMTimeString];
    return date;
}

NSString* MDYStringFromDate(NSDate* date)
{
    if (date == nil) { return nil; }
    static NSDateFormatter *messagesDateFormat;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        messagesDateFormat = [[NSDateFormatter alloc] init];
        [messagesDateFormat setDateFormat:@"MM/dd/yy"];
    });
    
    return [messagesDateFormat stringFromDate:date];
}

NSString* MDYStringWithTimeFromDate(NSDate* date)
{
    if (date == nil) { return nil; }
    static NSDateFormatter *messagesDateFormat;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        messagesDateFormat = [[NSDateFormatter alloc] init];
        [messagesDateFormat setDateFormat:@"MM/dd/yy hh:mm:ss a"];
    });
    
    return [messagesDateFormat stringFromDate:date];
}

//http://stackoverflow.com/questions/4739483/number-of-days-between-two-nsdates
NSInteger daysBetweenDate(NSDate* fromDateTime, NSDate* toDateTime)
{
    NSDate *fromDate = nil;
    NSDate *toDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSDayCalendarUnit
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}

inline NSTimeInterval oneDayTimeInterval()
{
    return 24 * 60 *60;
}

inline NSDate* now()
{
    return [NSDate date];
}

inline BOOL isTodaysDate(NSDate* date)
{
    return [today() isEqualToDate:beginningOfDay(date)];
}

inline BOOL isTomorrowsDate(NSDate* date)
{
    return [tomorrow() isEqualToDate:beginningOfDay(date)];
}

inline NSDate* today()
{
    return beginningOfDay(now());
}

NSDate* beginningOfDay(NSDate* date)
{
    // Use the user's current calendar and time zone
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    [calendar setTimeZone:timeZone];
    
    // Selectively convert the date components (year, month, day) of the input date
    NSDateComponents *dateComps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:date];
    
    // Set the time components manually
    [dateComps setHour:0];
    [dateComps setMinute:0];
    [dateComps setSecond:0];
    
    // Convert back
    NSDate *beginningOfDay = [calendar dateFromComponents:dateComps];
    return beginningOfDay;
}

inline NSDate* tomorrow()
{
    return [today() dateByAddingTimeInterval:oneDayTimeInterval()];
}

inline NSDate* yesterday()
{
    return [today() dateByAddingTimeInterval:-(oneDayTimeInterval())];
}

inline NSDate* nextDay(NSDate* date)
{
    return [date dateByAddingTimeInterval:oneDayTimeInterval()];
}

inline NSDate* previousDay(NSDate* date)
{
    return [date dateByAddingTimeInterval:-(oneDayTimeInterval())];
}

#pragma mark - Validations

NSString* formattedPhoneNumber(NSString* phoneNumber)
{
    NSMutableString *newPhoneNumberString = [NSMutableString stringWithString:phoneNumber];
    [newPhoneNumberString insertString:@"(" atIndex:0];
    [newPhoneNumberString insertString:@")" atIndex:4];
    [newPhoneNumberString insertString:@"-" atIndex:8];
    phoneNumber = newPhoneNumberString;
    return phoneNumber;
}

NSString* trimmedPhoneNumber(NSString* phoneNumber)
{
    phoneNumber = [chomp(phoneNumber) stringByReplacingOccurrencesOfString:@"(" withString:@""];
    phoneNumber = [chomp(phoneNumber) stringByReplacingOccurrencesOfString:@")" withString:@""];
    phoneNumber = [chomp(phoneNumber) stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return phoneNumber;
}

BOOL isValidPhoneNumber(NSString* trimmedPNumber)
{
    trimmedPNumber = trimmedPhoneNumber(trimmedPNumber);
    if (trimmedPNumber.length != kPhoneNumberLenght)
    {
        return NO;
    }
    
    NSCharacterSet *numSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    BOOL result = [trimmedPNumber rangeOfCharacterFromSet:[numSet invertedSet]].location == NSNotFound;
    
    return result;
}

BOOL isValidEmail(NSString* email)
{
    email = chomp(email);
    if (email.length < 1) { return NO; }
    
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

NSString *dateStringWithCurrentTimeZone(NSDate* date)
{
    if (date != nil)
    {
        static NSDateFormatter *dateStringFormatter;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            dateStringFormatter = [[NSDateFormatter alloc] init];
            [dateStringFormatter setDateStyle:NSDateFormatterMediumStyle];
            [dateStringFormatter setTimeZone:[NSTimeZone systemTimeZone]];
        });
        return [dateStringFormatter stringFromDate:date];
    }
    return nil;
}

inline BOOL isIPhone5()
{
    return ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON );
}

BOOL isNetworkError(NSError* error)
{
    if ([error.domain isEqualToString:NSURLErrorDomain])
    {
        NSInteger code = error.code;
        if (code == NSURLErrorCannotConnectToHost
            || code == NSURLErrorNetworkConnectionLost
            || code == NSURLErrorNotConnectedToInternet
            || code == NSURLErrorDataNotAllowed
            )
        {
            return YES;
        }
    }
    return NO;
}

NSString* timezoneString()
{
    static NSDateFormatter *GMTStringFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        GMTStringFormatter = [[NSDateFormatter alloc] init];
        NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        [GMTStringFormatter setLocale:locale];
        [GMTStringFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss Z"];
    });
    NSString* nowString = [GMTStringFormatter stringFromDate:now()];
    NSString* GMTString = [@"GMT" stringByAppendingString:[nowString substringWithRange:NSMakeRange(nowString.length-5, 5)]];
    return GMTString;
}


BOOL addSkipBackupAttributeToItemAtURL(NSURL * URL)
{
    assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);
    
    NSError *error = nil;
    BOOL success = [URL setResourceValue: [NSNumber numberWithBool: YES]
                                  forKey: NSURLIsExcludedFromBackupKey error: &error];
    if(!success){
        NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
    }
    return success;
}

NSString* formattedPhoneNumberForPharmacy(NSString* tenDigitString)
{
    if (isValidString(tenDigitString) && tenDigitString.length == 10)
    {
        NSMutableString* phoneNumber = [NSMutableString stringWithFormat:@"(%@)", [tenDigitString substringToIndex:3]];
        [phoneNumber appendFormat:@"-%@-", [tenDigitString substringWithRange:NSMakeRange(3, 3)]];
        [phoneNumber appendFormat:@"%@", [tenDigitString substringWithRange:NSMakeRange(6, 4)]];
        return phoneNumber;
    }
    return tenDigitString;
}

