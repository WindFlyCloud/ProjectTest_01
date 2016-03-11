//
//  ImageDetailViewController.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/5.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "ImageDetailViewController.h"
#import "NetWorkingManager.h"
#import "TradeDetailModel.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
#import "ImageDetailTableViewCell.h"
#import "SingletonManager.h"
#import "ShareViewController.h"
@interface ImageDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _myTable;
    NSMutableArray * _dataArr;
}
@property(nonatomic,copy) NSString * imageURL;
@end

@implementation ImageDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    self.title = @"搭配信息";

   
    
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 44, 44);
    
    [backButton setImage:[UIImage imageNamed:@"total_back_btn"] forState:UIControlStateNormal];
      [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItem  = leftItem;
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 44);
    
    [button setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"like_s"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = rightItem;
   
    _dataArr = [[NSMutableArray alloc]init];
    
   // NSString * url = [NSString stringWithFormat:@"http://app.api.repaiapp.com/sx/yangshijie/jiekou/zuimei_jingxuan/zuimei_jingxuan_json.php?&content_id=%@",_cotentID];
    //请求数据
    [NetWorkingManager requestDetailTarget:_cotentID completion:^(NSDictionary *dictionary)
     {
         TradeDetailModel * trade = [[TradeDetailModel alloc]initWithDictionary:dictionary];
         _imageUrl = trade.itenPic;
         NSArray * array = trade.data;
         
         [array enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
             
             TradeInfo * info = [[TradeInfo alloc]init];
             
             info.title = [obj objectForKey:@"title"];
             info.picURL = [obj objectForKey:@"pic_url"];
             info.price = [obj objectForKey:@"price"];
             
             [_dataArr addObject:info];
             //刷新表
             [_myTable reloadData];
         }];
    }];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-64) style:UITableViewStylePlain];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _myTable.delegate = self;
    _myTable.dataSource = self;
    
    [self.view addSubview:_myTable];
    //x坐标不起作用，宽也不起作用（表头）
    _myTable.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, _myTable.frame.origin.y, 0, (CGRectGetWidth(self.view.frame)-20)*_scale)];
    
    UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, CGRectGetWidth(_myTable.tableHeaderView.frame)-20, CGRectGetHeight(_myTable.tableHeaderView.frame)-10)];
    
    [imageV sd_setImageWithURL:[NSURL URLWithString:_imageUrl]];
    [_myTable.tableHeaderView addSubview:imageV];
    
   //返回区头高度
    _myTable.sectionHeaderHeight = 30;
    
     [_myTable registerNib:[UINib nibWithNibName:@"ImageDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    _myTable.rowHeight = 60;
}
//返回按钮的点击方法
-(void)backButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
//收藏按钮的点击方法
-(void)buttonClick:(UIButton *)btn
{
    
    btn.selected = !btn.selected;
    
    if (btn.selected)
    {
        [[SingletonManager shareManager]showTestHUDWithMsg:@"收藏成功" view:self.view];
    }else
    {
        [[SingletonManager shareManager]showTestHUDWithMsg:@"取消收藏" view:self.view];
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * bgView = [[UIView alloc]init];
    
    UILabel * label = [[UILabel alloc]init];
    
    label.text = @"搭配商品链接";
    label.font = [UIFont systemFontOfSize:15];
    [bgView addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.right.equalTo(bgView.mas_right).with.offset(-10.0f);
         
         make.top.equalTo(bgView.mas_top).with.offset(5.0f);
         
         make.left.equalTo(bgView.mas_left).with.offset(15.0f);
         make.bottom.equalTo(bgView.mas_bottom).with.offset(-5.0f);
     }];
    return bgView;
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ImageDetailTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
   
    TradeInfo * info = [_dataArr objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = info.title;
    
    cell.priceLabel.textColor = [UIColor colorWithRed:251.0/255 green:23.0/255 blue:97.0/255 alpha:1.0];
    
    cell.priceLabel.text = [NSString stringWithFormat:@"￥%@",info.price];
    
    [cell.headerImage sd_setImageWithURL:[NSURL URLWithString:info.picURL] placeholderImage:[UIImage imageNamed:@"shangpin_loading"]];
    
        return cell;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShareViewController * shareVC = [[ShareViewController alloc]init];
    
    [self.navigationController pushViewController:shareVC animated:YES];
}
- (void)didReceiveMemoryWarning
{
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
