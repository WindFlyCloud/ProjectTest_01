//
//  CustomTabBarController.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/2.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "CustomTabBarController.h"

@interface CustomTabBarController ()
@property(nonatomic,retain)UIButton        *seletButton;
@end

@implementation CustomTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //TabbarController 自己带的有一个Tabbar
    self.tabBar.hidden = YES;
//    背景View
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame)-50, CGRectGetWidth(self.view.frame), 50)];
    
    bgView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:bgView];
    //tabBar的背景图片
    UIImageView * imagV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, bgView.frame.size.width, bgView.frame.size.height)];
    imagV.image = [UIImage imageNamed:@"tab_bg"];
    
    [bgView addSubview:imagV];
    //for循环创建按钮
    for (int i = 0; i< 4; i++)
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        if (i == 0)
        {
            button.selected = YES;
            _seletButton = button;
        }
        button.frame = CGRectMake(i*CGRectGetWidth(self.view.frame)/4.0, 0, CGRectGetWidth(self.view.frame)/4.0, 50);
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tab_0%d",i+1]] forState:UIControlStateNormal];
        button.tag = 100 + i;
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tab_0%d_c",i+1]] forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [bgView addSubview:button];
    }
}
//按钮的点击方法
-(void)buttonClick:(UIButton *)btn
{
    if (btn == _seletButton)
    {
        return;
        
    }else
    {
        btn.selected = !btn.selected;
        
        _seletButton.selected = !_seletButton.selected;
    }
    
    _seletButton = btn;
    //切换上面界面
    self.selectedIndex = btn.tag - 100;
    
    
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
