//
//  AppDelegate.m
//  StudyIosDemo
//
//  Created by 秦跃 on 2025/2/12.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <UIKit/UIKit.h>
@interface AppDelegate ()

@end

@implementation AppDelegate

//应用程序首次加载 - 加载最基本的资源(比如第一个界面、首次要显示的数据)
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"应用程序首次加载");
    // Override point for customization after application launch.
    // 初始化窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
    // 创建 UINavigationController，并设置根控制器为 FirstViewController
    // 2. 从 Storyboard 加载初始控制器
    ViewController *firstVC = [[ViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:firstVC];
    // 设置窗口根控制器Main Interface
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;
}

//引用程序即将进入后台挂起状态
- (void)applicationWillResignActive:(UIApplication *)application{
    NSLog(@"引用程序即将进入后台挂起状态");
}

//应用程序进入后台挂起状态
- (void) applicationDidEnterBackground:(UIApplication *)application{
    NSLog(@"应用程序进入后台挂起状态");
}

//应用程序即将恢复活跃状态
- (void) applicationWileEnterBackground:(UIApplication *)application{
    NSLog(@"应用程序即将恢复活跃状态");
}

//应用程序已经重新恢复活跃状态
- (void) applicationDidBecomeActive:(UIApplication *)application{
    NSLog(@"应用程序已经重新恢复活跃状态");
}

//应用程序被意外打断
- (void) applicationWillTerminate:(UIApplication *)application{
    NSLog(@"应用程序被意外打断");
}



#pragma mark - UISceneSession lifecycle



@end
