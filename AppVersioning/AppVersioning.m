//
//  AppVersioning.m
//  AppVersioning
//
//  Created by azu on 2014/02/20.
//  Copyright (c) 2014 azu. All rights reserved.
//

#import "AppVersioning.h"

// save key - compatible https://github.com/azu/notify-changeLog
NSString *const kChangeLogCurrentVersion = @"kChangeLogCurrentVersion";

@implementation AppVersioning
// current application's version
+ (NSString *)currentVersion {
    NSString *version = [[[NSBundle bundleForClass:self] infoDictionary]
        objectForKey:@"CFBundleShortVersionString"];

    return version;
}

+ (void)saveCurrentVersion {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[self currentVersion] forKey:kChangeLogCurrentVersion];
    [defaults synchronize];
}

+ (NSString *)previouslySavedVersion {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *savedVersion = [defaults objectForKey:kChangeLogCurrentVersion];
    return savedVersion;
}

+ (AppVersioningComparisonResult)compareCurrentWithSavedVersion {
    NSString *savedVersion = [self previouslySavedVersion];
    if (savedVersion == nil) {
        return AppVersioningNil;
    }

    switch ([savedVersion compare:[self currentVersion] options:NSNumericSearch]) {
        case NSOrderedAscending:
            return AppVersioningNotEqual;
        case NSOrderedSame:
            return AppVersioningEqual;
        case NSOrderedDescending:
            return AppVersioningNotEqual;
    }
    return AppVersioningNil;
}
@end
