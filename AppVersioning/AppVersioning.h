//
//  AppVersioning.h
//  AppVersioning
//
//  Created by azu on 2014/02/20.
//  Copyright (c) 2014 azu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppVersioning : NSObject
+ (NSString *)currentVersion;

+ (void)saveCurrentVersion;

+ (NSString *)previouslySavedVersion;

+ (BOOL)compareCurrentWithSavedVersion;
@end
