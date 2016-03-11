//
//  ShareViewController.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/7.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "ShareViewController.h"
#import "SingletonManager.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
#import <ShareSDKExtension/SSEShareHelper.h>
#import <ShareSDKUI/SSUIShareActionSheetCustomItem.h>
#import <ShareSDK/ShareSDK+Base.h>

#import <ShareSDKExtension/ShareSDK+Extension.h>
// 自定义分享菜单栏需要导入的头文件
#import <ShareSDKUI/SSUIShareActionSheetStyle.h>

@interface ShareViewController ()

@end

@implementation ShareViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    self.title = _titleLB;
    
    self.view.backgroundColor = [UIColor whiteColor];
    //返回按钮
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 44, 44);
    
    [backButton setImage:[UIImage imageNamed:@"total_back_btn"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItem  = leftItem;
    //分享按钮
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 44);
    
    [button setImage:[UIImage imageNamed:@"shangpin_share"] forState:UIControlStateNormal];

    [button addTarget:self action:@selector(shareButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = rightItem;

    [[SingletonManager shareManager]showHUDWithMsg:@"正在加载" view:self.view];
    
}
//当界面消失的时候，将HUD隐藏
-(void)dealloc
{
    [[SingletonManager shareManager] hideHUD];
}
//返回按钮方法
- (void) backButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
//分享
- (void) shareButtonClick:(UIButton *)btn
{
    //1、创建分享参数
    NSArray* imageArray = @[[UIImage imageNamed:@"fenxiang01"],[UIImage imageNamed:@"fenxiang02"],[UIImage imageNamed:@"fenxiang03"]];
    //（注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
    if (imageArray) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        
        [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                         images:imageArray
                                            url:[NSURL URLWithString:@"http://mob.com"]
                                          title:@"分享标题"
                                           type:SSDKContentTypeAuto];
        // 设置分享菜单栏样式（非必要）
        // 设置分享菜单的背景颜色
//        [SSUIShareActionSheetStyle setActionSheetBackgroundColor:[UIColor colorWithRed:249/255.0 green:0/255.0 blue:12/255.0 alpha:0.5]];
//        // 设置分享菜单颜色
//        [SSUIShareActionSheetStyle setActionSheetColor:[UIColor colorWithRed:21.0/255.0 green:21.0/255.0 blue:21.0/255.0 alpha:1.0]];
//        // 设置分享菜单－取消按钮背景颜色
//        [SSUIShareActionSheetStyle setCancelButtonBackgroundColor:[UIColor colorWithRed:21.0/255.0 green:21.0/255.0 blue:21.0/255.0 alpha:1.0]];
//        // 设置分享菜单－取消按钮的文本颜色
//        [SSUIShareActionSheetStyle setCancelButtonLabelColor:[UIColor blackColor]];
//        // 设置分享菜单－社交平台文本颜色
//        [SSUIShareActionSheetStyle setItemNameColor:[UIColor whiteColor]];
//        // 设置分享菜单－社交平台文本字体
//        [SSUIShareActionSheetStyle setItemNameFont:[UIFont systemFontOfSize:10]];
        
        //1.2、自定义分享平台（非必要）
        NSMutableArray *activePlatforms = [NSMutableArray arrayWithArray:[ShareSDK activePlatforms]];
        //添加一个自定义的平台（非必要）
        SSUIShareActionSheetCustomItem *item = [SSUIShareActionSheetCustomItem itemWithIcon:[UIImage imageNamed:@"fenxiang01.png"]
                                                                                      label:@"朋友圈"
                                                                                    onClick:^{
                                                                                        
                                                                                        //自定义item被点击的处理逻辑
                                                                                        NSLog(@"=== 自定义item被点击 ===");
                                                                                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"自定义item被点击"
                                                                                                                                            message:nil
                                                                                                                                           delegate:nil
                                                                                                                                  cancelButtonTitle:@"确定"
                                                                                                                                  otherButtonTitles:nil];
                                                                                        [alertView show];
                                                                                    }];
        //添加一个自定义的平台（非必要）
        SSUIShareActionSheetCustomItem *item1 = [SSUIShareActionSheetCustomItem itemWithIcon:[UIImage imageNamed:@"fenxiang02.png"]
                                                                                      label:@"微信"
                                                                                    onClick:^{
                                                                                        
                                                                                        //自定义item被点击的处理逻辑
                                                                                        NSLog(@"=== 自定义item被点击 ===");
                                                                                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"自定义item被点击"
                                                                                                                                            message:nil
                                                                                                                                           delegate:nil
                                                                                                                                  cancelButtonTitle:@"确定"
                                                                                                                                  otherButtonTitles:nil];
                                                                                        [alertView show];
                                                                                    }];
        //添加一个自定义的平台（非必要）
        SSUIShareActionSheetCustomItem *item2 = [SSUIShareActionSheetCustomItem itemWithIcon:[UIImage imageNamed:@"fenxiang03.png"]
                                                                                      label:@"短信"
                                                                                    onClick:^{
                                                                                        
                                                                                        //自定义item被点击的处理逻辑
                                                                                        NSLog(@"=== 自定义item被点击 ===");
                                                                                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"自定义item被点击"
                                                                                                                                            message:nil
                                                                                                                                           delegate:nil
                                                                                                                                  cancelButtonTitle:@"确定"
                                                                                                                                  otherButtonTitles:nil];
                                                                                        [alertView show];
                                                                                    }];
        [activePlatforms addObject:item];
        [activePlatforms addObject:item1];
        [activePlatforms addObject:item2];
        //2、分享（可以弹出我们的分享菜单和编辑界面）
        [ShareSDK showShareActionSheet:nil
         //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                                 items:activePlatforms
                           shareParams:shareParams
                   onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                       
                       switch (state) {
                           case SSDKResponseStateSuccess:
                           {
                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                                   message:nil
                                                                                  delegate:nil
                                                                         cancelButtonTitle:@"确定"
                                                                         otherButtonTitles:nil];
                               [alertView show];
                               break;
                           }
                           case SSDKResponseStateFail:
                           {
                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                               message:[NSString stringWithFormat:@"%@",error]
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"OK"
                                                                     otherButtonTitles:nil, nil];
                               [alert show];
                               break;
                           }
                           default:
                               break;
                       }
                   }
         ];}
}
//- (void)showShareActionSheet:(UIView *)view
//{
//    /**
//     * 在简单分享中，只要设置共有分享参数即可分享到任意的社交平台
//     **/
//    __weak ShareViewController *theController = self;
//    
//    //1、创建分享参数（必要）
//    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
//    [shareParams SSDKEnableUseClientShare];
//    NSArray* imageArray = @[[UIImage imageNamed:@"shareImg.png"]];
//    [shareParams SSDKSetupShareParamsByText:@"分享内容"
//                                     images:imageArray
//                                        url:[NSURL URLWithString:@"http://www.mob.com"]
//                                      title:@"分享标题"
//                                       type:SSDKContentTypeAuto];
//    
//    //1.2、自定义分享平台（非必要）
////    NSMutableArray *activePlatforms = [NSMutableArray arrayWithArray:[ShareSDK activePlatforms]];
//    //添加一个自定义的平台（非必要）
//    SSUIShareActionSheetCustomItem *item = [SSUIShareActionSheetCustomItem itemWithIcon:[UIImage imageNamed:@"Icon.png"]
//                                                                                  label:@"自定义"
//                                                                                onClick:^{
//                                                                                    
//                                                                                    //自定义item被点击的处理逻辑
//                                                                                    NSLog(@"=== 自定义item被点击 ===");
//                                                                                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"自定义item被点击"
//                                                                                                                                        message:nil
//                                                                                                                                       delegate:nil
//                                                                                                                              cancelButtonTitle:@"确定"
//                                                                                                                              otherButtonTitles:nil];
//                                                                                    [alertView show];
//                                                                                }];
//    [activePlatforms addObject:item];
//    
//    //设置分享菜单栏样式（非必要）
//    //        [SSUIShareActionSheetStyle setActionSheetBackgroundColor:[UIColor colorWithRed:249/255.0 green:0/255.0 blue:12/255.0 alpha:0.5]];
//    //        [SSUIShareActionSheetStyle setActionSheetColor:[UIColor colorWithRed:21.0/255.0 green:21.0/255.0 blue:21.0/255.0 alpha:1.0]];
//    //        [SSUIShareActionSheetStyle setCancelButtonBackgroundColor:[UIColor colorWithRed:21.0/255.0 green:21.0/255.0 blue:21.0/255.0 alpha:1.0]];
//    //        [SSUIShareActionSheetStyle setCancelButtonLabelColor:[UIColor whiteColor]];
//    //        [SSUIShareActionSheetStyle setItemNameColor:[UIColor whiteColor]];
//    //        [SSUIShareActionSheetStyle setItemNameFont:[UIFont systemFontOfSize:10]];
//    //        [SSUIShareActionSheetStyle setCurrentPageIndicatorTintColor:[UIColor colorWithRed:156/255.0 green:156/255.0 blue:156/255.0 alpha:1.0]];
//    //        [SSUIShareActionSheetStyle setPageIndicatorTintColor:[UIColor colorWithRed:62/255.0 green:62/255.0 blue:62/255.0 alpha:1.0]];
//    
//    //2、分享
//    [ShareSDK showShareActionSheet:view
//                             items:nil
//                       shareParams:shareParams
//               onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
//                   
//                   switch (state) {
//                           
////                       case SSDKResponseStateBegin:
////                       {
////                           [theController showLoadingView:YES];
////                           break;
////                       }
//                       case SSDKResponseStateSuccess:
//                       {
//                           //Facebook Messenger、WhatsApp等平台捕获不到分享成功或失败的状态，最合适的方式就是对这些平台区别对待
//                           if (platformType == SSDKPlatformTypeFacebookMessenger)
//                           {
//                               break;
//                           }
//                           
//                           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
//                                                                               message:nil
//                                                                              delegate:nil
//                                                                     cancelButtonTitle:@"确定"
//                                                                     otherButtonTitles:nil];
//                           [alertView show];
//                           break;
//                       }
//                       case SSDKResponseStateFail:
//                       {
//                           if (platformType == SSDKPlatformTypeSMS && [error code] == 201)
//                           {
//                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
//                                                                               message:@"失败原因可能是：1、短信应用没有设置帐号；2、设备不支持短信应用；3、短信应用在iOS 7以上才能发送带附件的短信。"
//                                                                              delegate:nil
//                                                                     cancelButtonTitle:@"OK"
//                                                                     otherButtonTitles:nil, nil];
//                               [alert show];
//                               break;
//                           }
//                           else if(platformType == SSDKPlatformTypeMail && [error code] == 201)
//                           {
//                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
//                                                                               message:@"失败原因可能是：1、邮件应用没有设置帐号；2、设备不支持邮件应用；"
//                                                                              delegate:nil
//                                                                     cancelButtonTitle:@"OK"
//                                                                     otherButtonTitles:nil, nil];
//                               [alert show];
//                               break;
//                           }
//                           else
//                           {
//                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
//                                                                               message:[NSString stringWithFormat:@"%@",error]
//                                                                              delegate:nil
//                                                                     cancelButtonTitle:@"OK"
//                                                                     otherButtonTitles:nil, nil];
//                               [alert show];
//                               break;
//                           }
//                           break;
//                       }
//                       case SSDKResponseStateCancel:
//                       {
//                           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享已取消"
//                                                                               message:nil
//                                                                              delegate:nil
//                                                                     cancelButtonTitle:@"确定"
//                                                                     otherButtonTitles:nil];
//                           [alertView show];
//                           break;
//                       }
//                       default:
//                           break;
//                   }
//                   
////                   if (state != SSDKResponseStateBegin)
////                   {
////                       [theController showLoadingView:NO];
////                       [theController.tableView reloadData];
////                   }
////                   
//               }];
//    
//    //另附：设置跳过分享编辑页面，直接分享的平台。
//    //        SSUIShareActionSheetController *sheet = [ShareSDK showShareActionSheet:view
//    //                                                                         items:nil
//    //                                                                   shareParams:shareParams
//    //                                                           onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
//    //                                                           }];
//    //
//    //        //删除和添加平台示例
//    //        [sheet.directSharePlatforms removeObject:@(SSDKPlatformTypeWechat)];
//    //        [sheet.directSharePlatforms addObject:@(SSDKPlatformTypeSinaWeibo)];
//    
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
