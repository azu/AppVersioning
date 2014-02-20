//
// Created by azu on 2014/02/20.
//


#import "Kiwi.h"
#import "AppVersioning.h"

SPEC_BEGIN(AppVersioningSpec)
    afterEach(^{// doesn't enough work...
        NSString *domainName = [[NSBundle bundleForClass:[self class]] bundleIdentifier];
        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:domainName];
        [[NSUserDefaults standardUserDefaults] synchronize];
    });
    describe(@"+compareCurrentWithSavedVersion", ^{
        context(@"when first time", ^{
            beforeEach(^{
                [AppVersioning stub:@selector(previouslySavedVersion) andReturn:nil];
            });
            it(@"should return AppVersionNil", ^{
                [[@([AppVersioning compareCurrentWithSavedVersion]) should] equal:@(AppVersionNil)];
            });
        });
        context(@"when saved 1.1 and current is 1.1", ^{
            beforeEach(^{
                [AppVersioning stub:@selector(currentVersion) andReturn:@"1.1"];
                [AppVersioning saveCurrentVersion];
            });
            it(@"should return AppVersionEqual", ^{
                [[@([AppVersioning compareCurrentWithSavedVersion]) should] equal:@(AppVersionEqual)];
            });
        });
        context(@"when saved 1.1 and current is 1.2", ^{
            beforeEach(^{
                [AppVersioning stub:@selector(previouslySavedVersion) andReturn:@"1.1"];
                [AppVersioning stub:@selector(currentVersion) andReturn:@"1.2"];// <=current
            });
            it(@"should return AppVersionEqual", ^{
                [[@([AppVersioning compareCurrentWithSavedVersion]) should] equal:@(AppVersionNotEqual)];
            });
        });
        context(@"when saved 9.9.1 and current is 1.0", ^{
            beforeEach(^{
                [AppVersioning stub:@selector(previouslySavedVersion) andReturn:@"9.9.1"];
                [AppVersioning stub:@selector(currentVersion) andReturn:@"1.0"];// <=current
            });
            it(@"should return AppVersionEqual", ^{
                [[@([AppVersioning compareCurrentWithSavedVersion]) should] equal:@(AppVersionNotEqual)];
            });
        });
    });
    SPEC_END