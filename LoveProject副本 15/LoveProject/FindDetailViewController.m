//
//  FindDetailViewController.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/6.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "FindDetailViewController.h"

#import "ImageInfo.h"
#import "WaterView.h"
#import "ImageDetailViewController.h"
#import "NetWorkingManager.h"
@interface FindDetailViewController ()
@property (nonatomic,strong) ImageInfo * info;
@end

@implementation FindDetailViewController

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
    
    NSMutableArray * dataArr = [[NSMutableArray alloc]init];
    
    NSString * url = [NSString stringWithFormat:@"http://app.api.repaiapp.com/sx/yangshijie/jiekou/zuimei_fenlei/zuimeidapei_fenlei_json.php?cun=%@",_cunStr];
    
    [NetWorkingManager netWorkingWaterfall:url completion:^(NSMutableArray *mArr) {
        
        for (int i=0; i<[mArr count]; i++)
        {
            self.info =  [[ImageInfo alloc]initWithDictionary:[mArr objectAtIndex:i]];
            
            [dataArr addObject:self.info];
        }
        
        WaterView * waterVC = [[WaterView alloc]initWithDataArray:dataArr withFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-64)];
        
        self.automaticallyAdjustsScrollViewInsets = NO;
        
        //跳转界面
        __weak typeof(self) weakeSelf = self;
        
        [waterVC setBlock:^(ImageInfo *info)
         {
             // NSLog(@"block");
             ImageDetailViewController * imageVC = [[ImageDetailViewController alloc]init];
             
             imageVC.imageUrl = info.thumbURL;
             
             imageVC.scale = (info.height/info.width);
             
             
             imageVC.cotentID = [NSString stringWithFormat:@"http://app.api.repaiapp.com/sx/yangshijie/jiekou/zuimei_fenlei/zuimeidapei_fenlei_json.php?cun=%@",info.contentId];
             
             [weakeSelf.navigationController pushViewController:imageVC animated:YES];
             
         }];

        [self.view addSubview:waterVC];

    }];
    // Do any additional setup after loading the view.
}
- (void) backButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
    
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
