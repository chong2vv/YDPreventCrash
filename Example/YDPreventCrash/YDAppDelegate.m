//
//  YDAppDelegate.m
//  YDPreventCrash
//
//  Created by chong2vv on 05/27/2023.
//  Copyright (c) 2023 chong2vv. All rights reserved.
//

#import "YDAppDelegate.h"
#import <YDPreventCrash/YDAvoidCrash.h>
#import <YDLogger/YDLogger.h>

@implementation YDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // 可以配合YDLogger日志库进行日志收集，方便排查问题。当然，这里如果已有日志库的话可以使用自己的日志库
    [[YDLogService shared] startLogNeedHook:NO];
    
    // 设置开启的防护的文件前缀，建议可以由服务端配置
    [YDAvoidCrash setAvoidCrashEnableMethodPrefixList:@[@"YD", @"NS", @"UI"]];
    
    // 开启防护
    [YDAvoidCrash becomeAllEffective];
    
    // 接收日志信息回调
    [YDAvoidCrash setupBlock:^(NSException *exception, NSString *defaultToDo, NSDictionary *info) {
        YDLogError(@"%@", info);
    }];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
