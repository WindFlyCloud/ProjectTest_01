//
//  SettingTableViewController.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/2.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "SettingTableViewController.h"
#import "Masonry.h"
@interface SettingTableViewController ()
{
    NSMutableArray * _dataArr;
}
@end

@implementation SettingTableViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    self.tabBarController.title = @"个人中心";
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 70)];
    
    self.tableView.tableHeaderView.backgroundColor = [UIColor grayColor];
    //按钮
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.backgroundColor = [UIColor whiteColor];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tableView.tableHeaderView addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tableView.tableHeaderView.mas_left).with.offset(0.0f);
        make.top.equalTo(self.tableView.tableHeaderView.mas_top).with.offset(14.0f);
        make.bottom.equalTo(self.tableView.tableHeaderView.mas_bottom).with.offset(0.0f);
        make.right.equalTo(self.tableView.tableHeaderView.mas_right).with.offset(0.0f);
        
    }];
    //头像
    UIImageView * imageV = [[UIImageView alloc]init];
    
    imageV.layer.cornerRadius = 28;
    imageV.layer.masksToBounds = YES;
    imageV.image = [UIImage imageNamed:@"geren_00"];
    [self.tableView.tableHeaderView addSubview:imageV];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button.mas_left).with.offset(5.0f);
        make.top.equalTo(button.mas_top).with.offset(0.0f);
        make.width.equalTo(@56);
        make.height.equalTo(@56);
    }];
    //登陆标签
    UILabel * titleLB = [[UILabel alloc]init];
    titleLB.text = @"登陆淘宝";
    titleLB.font = [UIFont systemFontOfSize:20];
    
    [self.tableView.tableHeaderView addSubview:titleLB];
    [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageV.mas_right).with.offset(5.0f);
        make.top.equalTo(button.mas_top).with.offset(0.0f);
        make.width.equalTo(@100);
        make.height.equalTo(@56);
    }];
    //箭头
    UIImageView * labelImage = [[UIImageView alloc]init];
    labelImage.image = [UIImage imageNamed:@"geren_jiantou"];
    [self.tableView.tableHeaderView addSubview:labelImage];
    [labelImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(button.mas_right).with.offset(0.0f);
        make.top.equalTo(button.mas_top).with.offset(0.0f);
        make.width.equalTo(@44);
        make.height.equalTo(@44);
    }];
    _dataArr = [[NSMutableArray alloc]initWithObjects:@"我的订单",@"购物车",@"我的物流",@"我的收藏",@"最近浏览",@"联系我们",@"常见问题",@"设置", nil];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}
- (void)buttonClick:(UIButton *)btn
{
    NSLog(@"正在登陆");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if(section < 2)
    {
        return 3;
    }
        return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"geren_0%ld",3*indexPath.section+indexPath.row+1]];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text = [_dataArr objectAtIndex:(3*indexPath.section+indexPath.row)];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
