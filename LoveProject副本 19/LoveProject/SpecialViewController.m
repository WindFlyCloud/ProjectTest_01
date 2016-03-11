//
//  SpecialViewController.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/6.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "SpecialViewController.h"
#import "NetWorkingManager.h"
#import "SpecialImageInfo.h"
#import "SpecialWaterView.h"
#import "ShareViewController.h"
@interface SpecialViewController ()
{
    SpecialWaterView * _waterView;
}

@property (nonatomic,retain) SpecialImageInfo * info;

@property (nonatomic,retain) NSMutableArray * waterArr;
@end

@implementation SpecialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];;
    
    self.title = _titleLabel;
    
    self.view.backgroundColor = [UIColor whiteColor];
    //返回按钮
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 44, 44);
    
    [backButton setImage:[UIImage imageNamed:@"total_back_btn"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItem  = leftItem;

    
    _waterArr  = [[NSMutableArray alloc]init];
    
   NSString * url = [NSString stringWithFormat:@"http://app.api.repaiapp.com/sx/yangshijie/jiekou/taonvlang/taonvlang_json.php?&col_album_id=%@",_albumID];
    
    [NetWorkingManager requestDetailTarget:url completion:^(NSDictionary *dictionary) {
        //添加瀑布流
        NSMutableArray * mArr = [dictionary objectForKey:@"data"];
        
        for (int i=0; i<[mArr count]; i++)
        {
            self.info =  [[SpecialImageInfo alloc]initWithDictionary:[mArr objectAtIndex:i]];
            
            [_waterArr addObject:self.info];
        }
               _waterView = [[SpecialWaterView alloc]initWithDataArray:_waterArr withFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-64)];
        
        //用block跳转界面
        __weak typeof(self) weakSelf = self;
        [_waterView setBlock:^{
            
            ShareViewController * shareVC = [[ShareViewController alloc]init];
            
            [weakSelf.navigationController pushViewController:shareVC animated:YES];
            
        }];

        
        [self.view addSubview:_waterView];
        
    }];
}
//返回按钮的点击方法
-(void)backButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
