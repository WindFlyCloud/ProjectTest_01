//
//  SpecialWaterView.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/6.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "SpecialWaterView.h"

#import "UIImageView+WebCache.h"


@implementation SpecialWaterView

- (id)initWithDataArray:(NSArray *)arr withFrame:(CGRect)rect
{
    self = [super initWithFrame:rect];
    if (self)
    {
        self.imageArr = arr;
        
        [self initParameter];
    }
    
    return self;
}

- (void)initParameter
{
    //每一列的视图初始化，每一列视图的宽度占总宽度的二分之一
    firstView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 0)];
    secondView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, 0)];
    
   // firstView.backgroundColor = [UIColor redColor];
    
   // secondView.backgroundColor = [UIColor redColor];
    
    higher = row = highValue = lower = 1;
    countImage = 0;
    
    for (int i=0; i<[self.imageArr count]; i++)
    {
        if (i/2>0&&i%2==0)
        {
            row++;
        }
        SpecialImageInfo *data = (SpecialImageInfo *)[self.imageArr objectAtIndex:i];
       // NSLog(@"wode ---%@",data);
        //        重新设置最低,必须先填充图片，然后再进行比较，否则崩溃
        [self addMyView:data];
        [self setHigherAndLower];
        
    }
   // NSLog(@"获取的最高高度是：%f",highValue);
    //这里设置的滚动长度要比高稍微高一点，否则无法实现滚动效果
    [self setContentSize:CGSizeMake(WIDTH, highValue+10)];
    
    //NSLog(@"%@",NSStringFromCGSize(CGSizeMake(WIDTH, highValue+10)));
    
    [self addSubview:firstView];
    [self addSubview:secondView];
}
//把信息传过来，然后填充图片
- (void)addMyView:(SpecialImageInfo *)info
{
    
    SpecialImageView * selfImage = nil;
    
    float imageHeight = 0;
    
    switch (lower)
    {
        case 1:
            
            //把真实的视图高度传过去,获取压缩比例的图片并且赋予图片位置然后传回来
            selfImage = [[SpecialImageView alloc]initWithImageInfo:info y:firstView.frame.size.height];
            imageHeight = selfImage.frame.size.height;
            //重新设置视图的frame,高度是以前的高度加上现在的高度,firstView是一个长条形的视图
            firstView.frame = CGRectMake(firstView.frame.origin.x, firstView.frame.origin.y, WIDTH,firstView.frame.size.height+imageHeight);
            //这是一个不断变长的视图，制作出图片不断放到多出来的那部分视图
            [firstView addSubview:selfImage];
            
            break;
        case 2:
            //把真实的视图高度传过去,获取压缩比例的图片并且赋予图片位置然后传回来
            selfImage = [[SpecialImageView alloc]initWithImageInfo:info y:secondView.frame.size.height];
            imageHeight = selfImage.frame.size.height;
            //重新设置视图的frame,高度是以前的高度加上现在的高度,firstView是一个长条形的视图
            secondView.frame = CGRectMake(secondView.frame.origin.x, secondView.frame.origin.y, WIDTH,secondView.frame.size.height+imageHeight);
            //这是一个不断变长的视图，制作出图片不断放到多出来的那部分视图
            [secondView addSubview:selfImage];
            break;
        default:
            break;
    }
    selfImage.delegate = self;
   
}
//代理方法
- (void) specialImageClick
{
    if (_block)
    {
        _block();
    }
}
- (void)setHigherAndLower
{
    
    float firstHeight = firstView.frame.size.height;
    float secondHeight = secondView.frame.size.height;
    //比较哪一列是最高的那列，并记录最高的值highValue和最高的列higher,把最高的列传找出来赋给scroll的可滚动范围
    if (firstHeight > highValue)
    {
        highValue = firstHeight;
        higher = 1;
    }else if (secondHeight > highValue)
    {
        highValue = secondHeight;
        higher = 2;
    }
    //找了最低列
    if (firstHeight < secondHeight)
    {
        lower = 1;
    }else
    {
        lower = 2;
    }
}
@end
