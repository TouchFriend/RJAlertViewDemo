//
//  AppDelegate.m
//  RJiPhoneXAdaptDemo
//
//  Created by TouchWorld on 2020/11/24.
//

#import "AppDelegate.h"
#import "RJMainViewController.h"
#import "RJAlertDemoViewController.h"
#import "RJStackViewDemoViewController.h"
#import "RJAlertViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    RJAlertViewController *vc = [[RJAlertViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end