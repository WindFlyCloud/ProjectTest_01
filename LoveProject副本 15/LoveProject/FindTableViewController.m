//
//  FindTableViewController.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/2.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "FindTableViewController.h"
#import "FindDetailViewController.h"
#import "EMMallSectionView.h"
#import "FindTableViewCell.h"

#import "NetWorkingManager.h"

#define WIDTHBTN CGRectGetWidth(self.view.frame)/4
#define HEIGHTBTN 30
@interface FindTableViewController ()
{
    NSMutableArray * _hotArr;
    NSDictionary   *_dic;
    NSArray        *_keyArr;
}
@end

@implementation FindTableViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    self.tabBarController.title = @"发现";

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
       //初始化数组
    _hotArr = [[NSMutableArray alloc]initWithObjects:
  @{ @"秋冬外套":@"41000000035"},
  @{@"气质风衣":@"10050008901"},
  @{@"时髦牛仔裤":@"41000000036"},
  @{@"遮小肚腩":@"369"},
  @{@"遮粗手臂":@"363"},
  @{@"显瘦身":@"368"},
  @{ @"雪纺":@"4538"},
  @{ @"舒适棉麻":@"4541"},
  @{ @"最潮截短款":@"4521"},nil];
    //初始化字典的key数组
    _keyArr = [NSArray arrayWithObjects:@"Ladies_coat",@"Under_ms",@"Color", nil];
    /*热门:35 60 100
     http://app.api.repaiapp.com/sx/yangshijie/jiekou/zuimei_fenlei/zuimeidapei_fenlei_json.php?cun=4521*/
    
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0,64 , CGRectGetWidth(self.view.frame), 145)];
    
    UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.frame), 35)];
    imageV.image = [UIImage imageNamed:@"hot_category"];
    
    [self.tableView.tableHeaderView addSubview:imageV];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    for (int i = 0; i < 9; i ++)
    {
        NSInteger row  = i /4;
        NSInteger column = i % 4;
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(column * WIDTHBTN, row * HEIGHTBTN+65, WIDTHBTN, HEIGHTBTN);
        
        [button setTitle:[[[_hotArr objectAtIndex:i] allKeys] firstObject] forState:UIControlStateNormal];
        button.tag = i;
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tableView.tableHeaderView addSubview:button];
    }
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.rowHeight = 100.f;
    
    
    [self.tableView registerClass:[FindTableViewCell class] forCellReuseIdentifier:@"cell"];
    //获得数据
    [NetWorkingManager requestDetailTarget:@"http://app.api.repaiapp.com/sx/yangshijie/jiekou/zuimei_faxian/zuimeidapei_faxian_json.php" completion:^(NSDictionary *dictionary) {
        
        _dic  = dictionary;
        //刷新表
        [self.tableView reloadData];
    }];
}
//按钮点击方法
- (void)buttonClick:(UIButton *)btn
{
   // NSLog(@"%@",btn.titleLabel.text);
    FindDetailViewController * findVC = [[FindDetailViewController alloc]init];
    
    findVC.cunStr = [[_hotArr objectAtIndex:btn.tag] objectForKey:btn.titleLabel.text];
    
    findVC.titleLB = btn.titleLabel.text;
    
    [self.navigationController pushViewController:findVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    EMMallSectionView *sectionView =  [EMMallSectionView showWithName:[NSString stringWithFormat:@"section_title_%ld",(long)section]];
    
    UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, (CGRectGetHeight(sectionView.frame)-18)/2, CGRectGetWidth(sectionView.frame), 18)];
    
    NSArray * imageArr = [NSArray arrayWithObjects:@"women_coat",@"women_trousers",@"women_colours", nil];
    
    imageV.image = [UIImage imageNamed:[imageArr objectAtIndex:section]];
    
    [sectionView addSubview:imageV];
    
    sectionView.tableView = self.tableView;
    
    sectionView.section = section;
    
    return sectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [EMMallSectionView getSectionHeight];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

   NSString * keyStr = [_keyArr objectAtIndex:section];
    
    NSArray * arr = [_dic objectForKey:keyStr];
    
    if (arr.count%4 == 0)
    {
        return arr.count/4;
    }
    return arr.count/4+1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FindTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray * nameArr = [NSArray arrayWithObjects:@"up_",@"down_",@"colour_", nil];
    
    NSString * name = [nameArr objectAtIndex:indexPath.section];
    
    NSString * keyStr = [_keyArr objectAtIndex:indexPath.section];
    
    NSArray * arr = [_dic objectForKey:keyStr];
    
    [cell.btnArr enumerateObjectsUsingBlock:^(FindButton * obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        obj.bgImage.image = nil;
        obj.titleLB.text = nil;
        //关闭用户交互性
        obj.userInteractionEnabled = NO;
        
        if (4*indexPath.row+idx < arr.count)
        {
            //打开用户交互性
            obj.userInteractionEnabled = YES;
            
            [obj addTarget:self action:@selector(chooseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            obj.bgImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%ld%ld",name,indexPath.row+1,obj.tag]];
            
            obj.indexP = indexPath;

            NSDictionary * dic = [arr objectAtIndex:4*indexPath.row+idx];
            
            obj.titleLB.text = [dic objectForKey:@"name"];
            
        }
        
    }];
    
    
    
    return cell;
}
//按钮的点击方法
- (void)chooseButtonClick:(FindButton *)btn
{
    NSString * keyStr = [_keyArr objectAtIndex:btn.indexP.section];
    
    NSArray * arr = [_dic objectForKey:keyStr];
    
    NSDictionary * dic  = [arr objectAtIndex:4*btn.indexP.row+btn.tag-1];
    
    FindDetailViewController * findVC = [[FindDetailViewController alloc]init];
    
    findVC.cunStr = [dic objectForKey:@"cun"];
    
    findVC.titleLB = [dic objectForKey:@"name"];
    
    [self.navigationController pushViewController:findVC animated:YES];
    
}
@end
