//
//  AppDelegate.m
//  项目一
//
//  Created by Crystal on 16/7/13.
//  Copyright © 2016年 wuxianedu. All rights reserved.
//

#import "AppDelegate.h"
#import "Lunch_Page_VCtrl.h"
#import "Guid_page_Vctrl.h"

@interface AppDelegate ()
//{
////    NSInteger isFirst;//这种变量 不是永久的变量;
//}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    //创建一个window
    UIScreen *screen = [UIScreen mainScreen];
    UIWindow *window1 = [[UIWindow alloc]initWithFrame:screen.bounds];
    //创建这个根视图控制器
    
//    MainTabbarController *mainTabbar = [[MainTabbarController alloc]init];
//    window1.rootViewController  = mainTabbar;
    
    //弄一个新的视图控制器  (在那里面  盛放启动图片)
    
    self.window = window1;
    [self.window makeKeyAndVisible];
    //给他重新设置一个根视图控制器;

   /*
    if(是第一次登陆){
    
        //把窗口的根视图控制器设置为引导页
        
    }else{//不是第一次登陆
        
    window1.rootViewController = [[Lunch_Page_VCtrl alloc]init];
    }
    
    */
    
    /*
     在iOS  里面数据持久化  :  (1) 数据归档  InitWithCoder;
                            (2) Sqlite3(数据库-C语言里面提供的一个借口),
                            (3)CoreData(不是一个数据库  只是对Sqlite的一个封装)
                            (4)属性列表
     */
    //属性列表(可以存放  一些常用的数据(比较小的数据))
   NSUserDefaults *userDafault = [NSUserDefaults standardUserDefaults];
    //存放整型变量
    //userDafault  暂时理解为一个字典存放的{@"number":10}
//    [userDafault setInteger:10 forKey:@"number"]
    
    //存放bool类型的变量{@"isfirtst":YES}
//    [userDafault setBool:YES forKey:@"isfirst"];
  BOOL isfirst =  [userDafault boolForKey:@"IS_First"];
    if(!isfirst){
    
        //因为这里面是第一次登陆(进入引导页)
        //创建引导页对象
        Guid_page_Vctrl *guid =  [[Guid_page_Vctrl alloc]init];
        //进入引导页
        window1.rootViewController = guid;
        //修改告诉程序第一次已经登陆过了
        [userDafault setBool:YES forKey:@"IS_First"];
        
    }else{
        //进入咱们今天上午做的界面
        window1.rootViewController = [[Lunch_Page_VCtrl alloc]init];
        
    }
//    if (!NO) {
//        NSLog(@"sdfasd");
//    }
//
    return YES;
}
@end
