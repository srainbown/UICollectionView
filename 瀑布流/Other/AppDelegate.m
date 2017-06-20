//
//  AppDelegate.m
//  瀑布流
//
//  Created by 李自杨 on 2017/4/20.
//  Copyright © 2017年 View. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "DiscoverViewController.h"
#import "MeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    //首页
    MainViewController *mainVc = [[MainViewController alloc]init];
    UINavigationController *mainNavi = [[UINavigationController alloc]initWithRootViewController:mainVc];
    mainVc.tabBarItem.title = @"首页";
    mainVc.navigationItem.title = @"首页";
    mainVc.tabBarItem.image = [[UIImage imageNamed:@"nav_icon_home_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mainVc.tabBarItem.selectedImage = [[UIImage imageNamed:@"nav_icon_home_active"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //发现
    DiscoverViewController *disVc = [[DiscoverViewController alloc]init];
      UINavigationController *disNavi = [[UINavigationController alloc]initWithRootViewController:disVc];
    disVc.tabBarItem.title = @"发现";
    disVc.navigationItem.title = @"发现";
    disVc.tabBarItem.image = [[UIImage imageNamed:@"nav_icon_discover_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    disVc.tabBarItem.selectedImage = [[UIImage imageNamed:@"nav_icon_discover_active"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //我的
    MeViewController *meVc = [[MeViewController alloc]init];
    UINavigationController *meNavi = [[UINavigationController alloc]initWithRootViewController:meVc];
    meVc.tabBarItem.title = @"我的";
    meVc.navigationItem.title = @"H5";
    meVc.tabBarItem.image = [[UIImage imageNamed:@"tabBar_me_icon"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    meVc.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_me_click_icon"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBar
    UITabBarController *tabBar = [[UITabBarController alloc]init];
    tabBar.viewControllers = @[mainNavi,disNavi,meNavi];
    tabBar.tabBar.tintColor = [UIColor orangeColor];
    tabBar.tabBar.barTintColor = [UIColor whiteColor];
    tabBar.selectedIndex = 1;
    
    self.window.rootViewController = tabBar;
    
    return YES;
}


@end
