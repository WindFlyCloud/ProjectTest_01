//
//  WaterView.h
//  WaterFlow1
//
//  Created by Apple on 15/11/2.
//  Copyright © 2015年 mcas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageInfo.h"
#import "SelfImageView.h"
#define SPACE 10
#define WIDTH [UIScreen mainScreen].bounds.size.width/2

@interface WaterView : UIScrollView<ImageDelegate>
{
    //第一列,第二列
    UIView *firstView,*secondView;
    //最高列，最低列,行数
    int higher,lower,row;
    //最高列高度
    float highValue;
    //记录多少图片
    int countImage;
 
}

- (id)initWithDataArray:(NSArray *)arr withFrame:(CGRect)rect;

-(void)loadNextPage:(NSArray*)array;

-(void)refreshView:(NSArray*)array;
@property(nonatomic,copy)void(^block)(ImageInfo *info);
@property (nonatomic,strong) NSArray *imageArr;
//@property (nonatomic,strong) SelfImageView * selfImage;

@end
