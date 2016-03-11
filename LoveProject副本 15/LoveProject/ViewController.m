//
//  ViewController.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/2.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "ViewController.h"
#import "CustomTabBarController.h"
#import "MainViewController.h"
#import "ValueBuyViewController.h"
#import "SettingTableViewController.h"
#import "FindTableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //布局主界面
    [self layoutViews];

}
-(void)layoutViews
{
    CustomTabBarController * tabBarCon = [[CustomTabBarController alloc]init];
    //首页
    MainViewController * mainVC = [[MainViewController alloc]init];
    
    
    UITabBarItem * mainItem = [[UITabBarItem alloc]init];
    
    mainItem.image = [[UIImage imageNamed:@"tab_01"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    mainItem.selectedImage = [[UIImage imageNamed:@"tab_01_c"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    mainVC.tabBarItem = mainItem;
    //值得买
    ValueBuyViewController * valueBayVC = [[ValueBuyViewController alloc]init];
    

    UITabBarItem * valueItem = [[UITabBarItem alloc]initWithTitle:nil image:[[UIImage imageNamed:@"tab_02"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_02_c"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    valueBayVC.tabBarItem = valueItem;
    //发现
    FindTableViewController * findVC = [[FindTableViewController alloc]init];
    
    
    UITabBarItem * findItem = [[UITabBarItem alloc]initWithTitle:nil image:[[UIImage imageNamed:@"tab_03"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_03_c"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    findVC.tabBarItem = findItem;
    //个人中心
    SettingTableViewController * settingVC = [[SettingTableViewController alloc]init];
    
   
    
    UITabBarItem * settingItem = [[UITabBarItem alloc]initWithTitle:nil image:[[UIImage imageNamed:@"tab_04"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_04_c"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    settingVC.tabBarItem = settingItem;
    
    tabBarCon.viewControllers =  @[mainVC,valueBayVC,findVC,settingVC];
    
     UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:tabBarCon];
    
  UIWindow * window = [[UIApplication sharedApplication]delegate].window;
    
        window.rootViewController = nav;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
