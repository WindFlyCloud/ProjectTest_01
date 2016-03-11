//
//  MainViewController.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/2.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "MainViewController.h"
#import "NetWorkingManager.h"
#import "SpecialTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "WaterView.h"
#import "ImageInfo.h"
#import "ImageDetailViewController.h"
#import "SpecialViewController.h"
#import "MJRefresh.h"
#import "CategoryTableViewCell.h"
#import "EMMallSectionView.h"
#import "FindDetailViewController.h"
#import"CateFourTableViewCell.h"
#define ROWHEIGHT 170
@interface MainViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UIImageView         *_selectedView;
    UIScrollView        *_scrollView;
    UISegmentedControl  *_segment;
    WaterView           *_waterView;
    NSArray             *_categoryStyleArr;
    NSArray             *_categoryBodyArr;
}
@property(nonatomic,retain)ImageInfo      * info;
@property(nonatomic,retain)NSMutableArray * tableArr;
@property(nonatomic,retain)NSMutableArray * dataArr;
@property(nonatomic,retain)NSMutableArray * waterArr;

@property(nonatomic,assign)NSInteger  specialPage;

@property(nonatomic,assign)NSInteger  page;

@end

@implementation MainViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //navigationController 设置为无色
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    self.tabBarController.title = @"首页";
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
 
    _specialPage = 3;
    
    _page  = 1;
    //初始化数组
    _tableArr = [[NSMutableArray alloc]init];
    
    _dataArr = [[NSMutableArray alloc]init];
    
    _waterArr = [[NSMutableArray alloc]init];
    //分类数组的初始化
    _categoryStyleArr = [NSArray arrayWithObjects:
  @{@"小清新":@"111000000033"},
  @{@"淑女":@"119"},
  @{@"韩版":@"113"},
  @{@"甜美":@"1111"},
  @{@"日系":@"1112"},
  @{@"欧美":@"11141"},
  @{@"简约":@"117"},
  @{@"优雅":@"11140"},
  @{@"运动休闲":@"116"},
  @{@"文艺":@"1119"},
  @{@"朋克":@"1124"},
  @{@"街头":@"1122"},
  @{@"英伦":@"1118"},
  @{@"名媛":@"114"},
  @{@"田园":@"1120"},
  @{@"森系":@"1113"},
  @{@"复古":@"1126"},
  @{@"学院":@"1115"},
  @{@"嘻哈":@"1125"},
  @{@"中性":@"1127"},
  @{@"民族":@"115"},
  @{@"通勤":@"111"},nil];
    _categoryBodyArr = [NSArray arrayWithObjects:
  @{@"遮肚腩":@"369"},
  @{@"显腰":@"368"},
  @{@"遮粗臂":@"363"},
  @{@"遮PP":@"367"},
  @{@"显胸":@"356"},
  @{@"显腿长":@"358"},
  @{@"遮粗腿":@"359"},
  @{@"小个子":@"371"},
  @{@"大码":@"370"}, nil];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self layoutScrollView];
    
    [self addViewToScrollView];
    
    //注册专题单元格
    UITableView * specialTable = [_tableArr objectAtIndex:1];
    [specialTable registerNib:[UINib nibWithNibName:@"SpecialTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [_tableArr enumerateObjectsUsingBlock:^(UITableView * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx > 0)
        {
            // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
            MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData:)];
            NSArray * imaegArr = [NSArray arrayWithObjects:[UIImage imageNamed:@"grayArrow"],[UIImage imageNamed:@"blackArrow"],nil];
            // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
            [header setImages:imaegArr forState:MJRefreshStateIdle];
            // 设置header
            obj.header = header;
            // 隐藏时间
            header.lastUpdatedTimeLabel.hidden = YES;
            // 设置文字
            [header setTitle:@"Pull down to refresh..." forState:MJRefreshStatePulling];
            // 设置字体
            header.stateLabel.font = [UIFont systemFontOfSize:15];
            // 设置颜色
            header.stateLabel.textColor = [UIColor grayColor];
        }
        
    }];
   
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    specialTable.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadFooterMoreData)];
    
    UITableView * categoryTable = [_tableArr objectAtIndex:0];
    
    [categoryTable registerClass:[CategoryTableViewCell class]  forCellReuseIdentifier:@"category"];
   
}
-(void)loadWaterMoreData:(MJRefreshAutoNormalFooter *)footer
{
    
    if (_specialPage > 3)
    {
        [footer endRefreshing];
        
        return;
    }
    
    NSString * url = [NSString stringWithFormat:@"http://app.api.repaiapp.com/sx/yangshijie/jiekou/zuimei_jingxuan/zuimei_jingxuan_json.php?app_id=141273368&app_oid=e085ee3567a9df5dd27d2fd4e35f54c71de494da&app_dtoken=(null)&app_version=3.1.6&app_channel=appstore&sche=aidapei&page=%ld",(long)_specialPage];
    
    _specialPage = _specialPage + 1;

    [NetWorkingManager netWorkingWaterfall:url completion:^(NSMutableArray *mArr) {
        
        NSMutableArray * arr = [[NSMutableArray alloc]init];
    for (int i=0; i<[mArr count]; i++)
    {
        self.info =  [[ImageInfo alloc]initWithDictionary:[mArr objectAtIndex:i]];
        
        [arr addObject:self.info];
    }
        [_waterView loadNextPage:arr];
       
    }];

    
}
//专题界面加载更多
-(void)loadFooterMoreData
{
    _page = _page + 2;
    NSLog(@"%ld",(long)_page);
    if (_page > 3)
    {
         UITableView * specialTable = [_tableArr objectAtIndex:1];
        
        [specialTable.footer endRefreshing];
        
        return;
    }
    
    NSString * url = [NSString stringWithFormat:@"http://app.api.repaiapp.com/sx/yangshijie/jiekou/taonvlang/taonvlang_json.php?app_id=141273368&app_oid=e085ee3567a9df5dd27d2fd4e35f54c71de494da&app_dtoken=(null)&app_version=3.1.6&app_channel=appstore&sche=aidapei&page=%ld",(long)_page];
    
    [NetWorkingManager netWorkingRequest:url completion:^(NSMutableArray *mArr)
     {
         [_dataArr addObjectsFromArray:mArr];
         
          UITableView * table = [_tableArr objectAtIndex:1];
         
         [table reloadData];
     }];
}
-(void)loadNewData:(MJRefreshGifHeader *)header
{
    [header endRefreshing];
}
-(void)changeViewWith:(NSInteger)isSelected
{
    switch (isSelected)
    {
        case 0:
        {

        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            [NetWorkingManager netWorkingRequest:@"http://app.api.repaiapp.com/sx/yangshijie/jiekou/taonvlang/taonvlang_json.php?app_id=141273368&app_oid=e085ee3567a9df5dd27d2fd4e35f54c71de494da&app_dtoken=(null)&app_version=3.1.6&app_channel=appstore&sche=aidapei&page=1" completion:^(NSMutableArray *mArr)
             {
                 [_dataArr setArray:mArr];
                 
                 UITableView * table = [_tableArr objectAtIndex:isSelected-1];
                 
                 [table reloadData];
             }];

        }
            break;
        case 3:
        {
            
        }
            break;
        default:
            break;
    }
}

//添加四个视图
-(void)addViewToScrollView
{
    [NetWorkingManager netWorkingWaterfall:@"http://app.api.repaiapp.com/sx/yangshijie/jiekou/zuimei_jingxuan/zuimei_jingxuan_json.php?app_id=141273368&app_oid=e085ee3567a9df5dd27d2fd4e35f54c71de494da&app_dtoken=(null)&app_version=3.1.6&app_channel=appstore&sche=aidapei&page=1" completion:^(NSMutableArray *mArr) {
        
        for (int i=0; i<[mArr count]; i++)
        {
            self.info =  [[ImageInfo alloc]initWithDictionary:[mArr objectAtIndex:i]];
            
            [_waterArr addObject:self.info];
        }
        
        _waterView = [[WaterView alloc]initWithDataArray:_waterArr withFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(_scrollView.frame))];
        //添加刷新
        _waterView.footer =[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadWaterMoreData:)];

        //跳转界面
        __weak typeof(self) weakeSelf = self;
        
        [_waterView setBlock:^(ImageInfo *info)
         {
            // NSLog(@"block");
             ImageDetailViewController * imageVC = [[ImageDetailViewController alloc]init];
             
             imageVC.imageUrl = info.thumbURL;
             
             imageVC.scale = (info.height/info.width);
         
             imageVC.cotentID =[NSString stringWithFormat:@"http://app.api.repaiapp.com/sx/yangshijie/jiekou/zuimei_jingxuan/zuimei_jingxuan_json.php?&content_id=%@",info.contentId] ;
             
             [weakeSelf.navigationController pushViewController:imageVC animated:YES];
             
         }];
        _waterView.tag = 0;
        
        [_scrollView addSubview:_waterView];
    }];
   //添加单元格
    for (int i = 1; i < 4; i++)
    {
        UITableView * table = [[UITableView alloc]initWithFrame:CGRectMake(i*CGRectGetWidth(self.view.frame), 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(_scrollView.frame)) style:UITableViewStylePlain];
        
        table.dataSource = self;
        table.delegate = self;
        
        table.separatorStyle = UITableViewCellSeparatorStyleNone;
        table.tag = i;
        [_tableArr addObject:table];
        
        [_scrollView addSubview:table];
        
    }
}
#pragma mark -UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 2)
    {
        //专题
        NSDictionary * dic = [_dataArr objectAtIndex:indexPath.row];
        
        SpecialViewController * specialVC = [[SpecialViewController alloc]init];
        specialVC.albumID = [dic objectForKey:@"col_album_id"];
        
        specialVC.titleLabel = [dic objectForKey:@"title"];
        
        [self.navigationController pushViewController:specialVC animated:YES];

    }
}
//返回区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag == 1)
    {
        return 2;
    }
    return 1;
}
//计算单元格的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1)
    {
        return 170;
    }else if (tableView.tag == 2)
    {
        return 240;
    }
    return 0;
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 1)
    {
       return 44;
    }
    return 0;
}
- (UIView * )tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 1)
    {
         EMMallSectionView *sectionView =  [EMMallSectionView showWithName:[NSString stringWithFormat:@"section_title_%ld",(long)section]];
        
        UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 44)];
        
        if (section == 0)
        {
            imageV.image = [UIImage imageNamed:@"fengge_tip"];
        }else
        {
            imageV.image = [UIImage imageNamed:@"shenxing_tip"];
        }
        
        [sectionView addSubview:imageV];
        
        sectionView.tableView = tableView;
        
        sectionView.section = section;
        
        return sectionView;
        
    }
    return nil;
}
#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 1)
    {
        if (section == 0)
        {
            return 7;
        }
        else
        {
            return 3;
        }
    }
 
        return _dataArr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = nil;
    
    if (tableView.tag == 1)
    {
       
        CategoryTableViewCell * categoryCell = [tableView dequeueReusableCellWithIdentifier:@"category"];
        
    
        if (indexPath.section == 0  && indexPath.row < 6)
        {
            categoryCell.bigImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"style_0%ld",indexPath.row+1]];
            

        }else
        {
            categoryCell.bigImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"figure_0%ld",indexPath.row+1]];
            
        }
      
        if ((indexPath.row+indexPath.section)%2 == 0 && indexPath.row < 6)
        {
            categoryCell.chooseBtnA.frame = CGRectMake(0, 0, CGRectGetWidth(categoryCell.frame)/2, ROWHEIGHT/2);
            
            categoryCell.chooseBtnB.frame = CGRectMake(0, 85, CGRectGetWidth(categoryCell.contentView.frame)/2, ROWHEIGHT/2);
            
            categoryCell.chooseBtnC.frame = CGRectMake(CGRectGetWidth(categoryCell.contentView.frame)/2, 0, CGRectGetWidth(categoryCell.contentView.frame)/2, ROWHEIGHT);
       
        }else if ((indexPath.row+indexPath.section)%2 == 1)
        {
            categoryCell.chooseBtnA.frame = CGRectMake(0, 0, CGRectGetWidth(categoryCell.contentView.frame)/2, ROWHEIGHT);
            
            categoryCell.chooseBtnB.frame = CGRectMake(CGRectGetWidth(categoryCell.contentView.frame)/2, 0, CGRectGetWidth(categoryCell.contentView.frame)/2, ROWHEIGHT/2);
            
            categoryCell.chooseBtnC.frame = CGRectMake(CGRectGetWidth(categoryCell.contentView.frame)/2, ROWHEIGHT/2, CGRectGetWidth(categoryCell.contentView.frame)/2, ROWHEIGHT/2);
        }else
        {
            CateFourTableViewCell * fourCell = [tableView dequeueReusableCellWithIdentifier:@"fourCell"];
            if (!fourCell)
            {
                NSArray * array = [[NSBundle mainBundle]loadNibNamed:@"CateFourTableViewCell" owner:nil options:nil];
                for (id obj in array)
                {
                    if ([obj isKindOfClass:[CateFourTableViewCell class]])
                    {
                        fourCell = obj;
                        break;
                    }
                }
                
            }
            
            fourCell.bgImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"style_0%ld",indexPath.row+1]];
            
            [fourCell.findBtn enumerateObjectsUsingBlock:^(FindButton * obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.tag = idx;
                
//                obj.frame = CGRectMake(idx * CGRectGetWidth(self.view.frame)/2, (idx / 2) * ROWHEIGHT/2, CGRectGetWidth(self.view.frame)/2, ROWHEIGHT/2);
                
                [obj addTarget:self action:@selector(choosebtnClick:) forControlEvents:UIControlEventTouchUpInside];
                
               // [obj setBackgroundColor:[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0]];
                
                obj.indexP = indexPath;
            }];
            
            return fourCell;
           
        }

        [categoryCell.chooseBtnA addTarget:self action:@selector(choosebtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        categoryCell.chooseBtnA.indexP = indexPath;
        
        [categoryCell.chooseBtnB addTarget:self action:@selector(choosebtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        categoryCell.chooseBtnB.indexP = indexPath;
        
        [categoryCell.chooseBtnC addTarget:self action:@selector(choosebtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        categoryCell.chooseBtnC.indexP = indexPath;
        
        cell = categoryCell;
        
    }else if(tableView.tag == 2)
    {
        SpecialTableViewCell * specialCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

        NSDictionary * dic = [_dataArr objectAtIndex:indexPath.row];
        NSArray * imageArr = [dic objectForKey:@"data"];
        [specialCell.imageArray enumerateObjectsUsingBlock:^(UIImageView *obj, NSUInteger idx, BOOL * _Nonnull stop)
         {
             //sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
            [obj sd_setImageWithURL:[NSURL URLWithString:[imageArr objectAtIndex:idx]] placeholderImage:[UIImage imageNamed:@"shangpin_loading"]];
        }];
        specialCell.title.text = [dic objectForKey:@"title"];
        cell = specialCell;

    }
//    else{
//        return nil;
//    }
    return cell;
}

//分类按钮点击
-(void)choosebtnClick:(FindButton *)findBtn
{
    NSString * title = nil;
    NSString * cunStr = nil;
    if (findBtn.indexP.section == 0)
    {
         NSDictionary * dic = [_categoryStyleArr objectAtIndex:3*findBtn.indexP.row+findBtn.tag];
        
        NSLog(@"%ld",3*findBtn.indexP.row+findBtn.tag);
        
        title = [[dic allKeys]objectAtIndex:0];
        
        cunStr = [[dic allValues]objectAtIndex:0];
    }else
   {
       NSDictionary * dic = [_categoryBodyArr objectAtIndex:3*findBtn.indexP.row+findBtn.tag];
       
       title = [[dic allKeys]objectAtIndex:0];
       cunStr = [[dic allValues]objectAtIndex:0];
   }
    FindDetailViewController * findVC = [[FindDetailViewController alloc]init];
    findVC.titleLB  = title;
    findVC.cunStr = cunStr;

    [self.navigationController pushViewController:findVC animated:YES];
    
}
//布局ScrollView
-(void)layoutScrollView
{
    //选中view
    _selectedView = [[UIImageView alloc]init];
    
    _selectedView.center = CGPointMake(CGRectGetWidth(self.view.frame)/8, 35/2.0);
    
    _selectedView.bounds = CGRectMake(0, 0, 80, 35);
    
    _selectedView.image = [UIImage imageNamed:@"label_selected"];
    //背景View
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), 35)];
    [self.view addSubview:bgView];
    //背景图片
    UIImageView * imageVie = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 35)];
    imageVie.image = [UIImage imageNamed:@"label_bg"];
    
    [bgView addSubview:imageVie];
    //分页控制器
    _segment  = [[UISegmentedControl alloc]initWithItems:@[@"精选",@"分类",@"专题",@"活动"]];
    
    _segment.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 35);
    //第一次默认选中索引0
    _segment.selectedSegmentIndex = 0;
    
    _segment.tintColor = [UIColor clearColor];//去掉颜色,现在整个segment都看不见
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:16],
                                             NSForegroundColorAttributeName: [UIColor colorWithRed:251.0/255 green:23.0/255 blue:97.0/255 alpha:1.0]};
    
    [_segment setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];//设置文字属性
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:16],
                                               NSForegroundColorAttributeName: [UIColor blackColor]};
    [_segment setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    
    
    [_segment addTarget:self action:@selector(segmentAcction:) forControlEvents:UIControlEventValueChanged];
    //添加_selectedView
    [bgView addSubview:_selectedView];
    // 添加segment
    [bgView addSubview:_segment];
 
    _scrollView  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, bgView.frame.origin.y+bgView.frame.size.height, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-(bgView.frame.origin.y+bgView.frame.size.height)-49)];
    
    //_scrollView.contentSize 的高要小于 _scrollView的frame的高或者设置为0，否则会出现晃动的现象，因为容纳量大于scrollView的高度
    _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame)*4, 0);
    
    //偏移量
    _scrollView.contentOffset = CGPointMake(0, 0);
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    //整页翻
    _scrollView.pagingEnabled = YES;
    
    _scrollView.delegate = self;
  //滑动条
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator  = NO;
    _scrollView.bounces = NO;
    
    [self.view addSubview:_scrollView];
}
#pragma mark  - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UITableView class]])
    {
        return;
    }
    NSInteger select =  scrollView.contentOffset.x/CGRectGetWidth(self.view.frame);
    
   // NSLog(@"select--%d",select);
    
     _selectedView.center = CGPointMake(CGRectGetWidth(self.view.frame)/8*((select*2)+1), _selectedView.center.y);
    
    _segment.selectedSegmentIndex = select;
    //跳转界面，加载内容
    [self changeViewWith:select];
    
}
//segment的点击方法
-(void)segmentAcction:(UISegmentedControl *)segment
{
    NSInteger selected = segment.selectedSegmentIndex;
    
    _selectedView.center = CGPointMake(CGRectGetWidth(self.view.frame)/8*((selected*2)+1), _selectedView.center.y);
    _scrollView.contentOffset = CGPointMake(CGRectGetWidth(self.view.frame)*selected, 0);
    //跳转界面，加载内容
    [self changeViewWith:selected];
 
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
