//
//  SingletonManager.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/6.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "SingletonManager.h"

@implementation SingletonManager
+(SingletonManager *)shareManager
{
    static SingletonManager *singletonManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singletonManager = [[SingletonManager alloc]init];
        
    });
    return singletonManager;
}
-(instancetype)init
{
    self = [super init];
    
    if (self)
    {
        
    }
    return self;
}
//loading视图的封装
-(void)showHUDWithMsg:(NSString*)msg view:(UIView *)view
{
    if (!HUD)
    {
        HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    HUD.labelText = msg;
    [HUD show:YES];
}
//纯文字的
-(void)showTestHUDWithMsg:(NSString*)msg view:(UIView *)view
{
    if (!HUD)
    {
        HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    
    HUD.mode = MBProgressHUDModeText;
    HUD.labelText = msg;
    [HUD show:YES];
    //定制消失时间
    [HUD hide:YES afterDelay:1];
    HUD = nil;
}

-(void)hideHUD
{
    [HUD hide:YES];
    HUD = nil;
}

@end
