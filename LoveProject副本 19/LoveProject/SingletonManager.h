//
//  SingletonManager.h
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/6.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface SingletonManager : NSObject
{
    MBProgressHUD * HUD;
}
//公共数据的单例
+(SingletonManager *)shareManager;

-(void)showHUDWithMsg:(NSString *)msg view:(UIView *)view;
-(void)showTestHUDWithMsg:(NSString *)msg view:(UIView *)view;
-(void)hideHUD;
@end
