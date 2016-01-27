//
//  AppDelegate.m
//  pushNotifications
//
//  Created by LoveQiuYi on 16/1/27.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 如果弹不出notification，添加下面的代码！！！
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]){
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
    }
    else {
        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge];
    }
    
    UILocalNotification * note = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
    if (note) {
        ViewController * vc = [self.window.rootViewController.childViewControllers firstObject];
        [vc performSegueWithIdentifier:@"homeToNews" sender:note];
        NSLog(@"点击本地通知进入到程序的");
    }else{
        NSLog(@"直接点击app图标启动的程序");
    }
    
    
    
    return YES;
}
/**
 *  用户点击本地通知进入app的时候调用的(注意这个app并没有关闭而是在后台运行)
 */
-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    //如果应用通知在前台就不推送消息
    if (application.applicationState == UIApplicationStateActive) return;
    NSLog(@"我是点击横幅的通知到app程序中去的(这个时候app并没有关闭)");

    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
