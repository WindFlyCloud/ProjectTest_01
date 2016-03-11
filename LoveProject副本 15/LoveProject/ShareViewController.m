//
//  ShareViewController.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/7.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "ShareViewController.h"
#import "SingletonManager.h"
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
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
