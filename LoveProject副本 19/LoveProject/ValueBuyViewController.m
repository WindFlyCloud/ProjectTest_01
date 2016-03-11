//
//  ValueBuyViewController.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/2.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "ValueBuyViewController.h"
#import "ShareViewController.h"

@interface ValueBuyViewController ()
@property(nonatomic,retain)UIButton     *seleButton;
@end

@implementation ValueBuyViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    self.tabBarController.title = @"值得买";

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //view的背景颜色
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 80, CGRectGetWidth(self.view.frame), 140)];
    
    bgView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:bgView];
    //两个大按钮
    for (int i = 0; i<2; i++)
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(i*160+(CGRectGetWidth(self.view.frame)-320)/2, 0, 160, 134);
        
        button.tag = i +1000;
        
        [button setImage:i ? [UIImage imageNamed:@"renqi"]:[UIImage imageNamed:@"20yuan"] forState:UIControlStateNormal];
        
        button.adjustsImageWhenHighlighted = NO;
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [bgView addSubview:button];
    }
    //11个小按钮
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 240, CGRectGetWidth(self.view.frame), 88)];
    
    scrollView.backgroundColor = [UIColor whiteColor];
    
    scrollView.contentSize = CGSizeMake(65*11, 88);
    
    scrollView.showsHorizontalScrollIndicator = NO;
    
    for (int i = 0; i< 11; i++)
    {
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i == 0)
        {
            button.selected = YES;
            
            _seleButton = button;
        }
        button.frame = CGRectMake(i*65+5, 0, 55, 88);
        
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"category_%d",i+1]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"category_%d_c",i+1]] forState:UIControlStateSelected];
        //取消点击状态
        button.adjustsImageWhenHighlighted = NO;
        
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [scrollView addSubview:button];
        
    }
    [self.view addSubview:scrollView];
}
//上面大按钮的点击方法
- (void)buttonClick:(UIButton *)btn
{
   // NSLog(@"%ld",(long)btn.tag);
    
    ShareViewController  * shareVC = [[ShareViewController alloc]init];
    
    if (btn.tag-1000 == 0)
    {
       // NSLog(@"20yuan");
        shareVC.titleLB = @"20yuan";
    }else
    {
       // NSLog(@"renqi");
        shareVC.titleLB = @"人气";
    }
    
    [self.navigationController pushViewController:shareVC animated:YES];
    
}
//小按钮的点击状态
-(void)btnClick:(UIButton *)btn
{
    if (btn == _seleButton)
    {
        
        return;
    }else
    {
        _seleButton.selected = !_seleButton.selected;
        
         btn.selected = !btn.selected;
    }
        _seleButton = btn;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
