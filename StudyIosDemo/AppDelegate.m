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


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
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


#pragma mark - UISceneSession lifecycle



@end
