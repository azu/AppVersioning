//
//  AppVersioningTests.m
//  AppVersioningTests
//
//  Created by azu on 2014/02/20.
//  Copyright (c) 2014 azu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppVersioning.h"

@interface AppVersioningTests : XCTestCase

@end

@implementation AppVersioningTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
    NSString *domainName = [[NSBundle bundleForClass:[self class]] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:domainName];
}

- (void)test_compare_should_return_NO_When_first_time {
    XCTAssertFalse([AppVersioning compareCurrentWithSavedVersion]);
}

- (void)test_compare_should_return_YES_When_match_saved_version {
    [AppVersioning saveCurrentVersion];
    XCTAssertTrue([AppVersioning compareCurrentWithSavedVersion]);
}
@end
