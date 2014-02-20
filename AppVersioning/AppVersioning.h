//
//  AppVersioning.h
//  AppVersioning
//
//  Created by azu on 2014/02/20.
//  Copyright (c) 2014 azu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AppVersioningComparisonResult) {
    AppVersionNil = -1L, // nil
    AppVersionEqual,   // match
    AppVersionNotEqual// mismatch
};

@interface AppVersioning : NSObject
+ (NSString *)currentVersion;

+ (void)saveCurrentVersion;

+ (NSString *)previouslySavedVersion;

+ (AppVersioningComparisonResult)compareCurrentWithSavedVersion;
@end
