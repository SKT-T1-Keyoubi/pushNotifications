//
//  ViewController.m
//  pushNotifications
//
//  Created by LoveQiuYi on 16/1/27.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)pushMsg;
- (IBAction)unpushMsg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//调度本地通知
- (IBAction)pushMsg {
    //创建本地通知对象
    UILocalNotification * localNoti = [[UILocalNotification alloc]init];
    //设置通知属性
    localNoti.soundName = @"buyao.wav";
    //锁屏界面显示的小标题
    localNoti.alertAction = @"查看消息";
    //通知的具体内容
    localNoti.alertBody = @"重大新闻:某某人今日本调查了";
    //通知第一次发送的时间
    localNoti.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    //设置时区（跟随手机的时区）
    localNoti.timeZone = [NSTimeZone defaultTimeZone];
    //设置app图标数字
    localNoti.applicationIconBadgeNumber = 12;
    //调度通知
    [[UIApplication sharedApplication] scheduleLocalNotification:localNoti];
    NSLog(@"push notifications");
}
//取消本地通知
- (IBAction)unpushMsg {
    //取消所有通知
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    NSLog(@"cancle all notifications");
}
@end
