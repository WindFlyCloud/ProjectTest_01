//
//  SpecialWaterView.h
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/6.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpecialImageInfo.h"
#import "SpecialImageView.h"
#define SPACE 10
#define WIDTH [UIScreen mainScreen].bounds.size.width/2
@interface SpecialWaterView : UIScrollView<SpecialImageDelegate>

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
@property (nonatomic,copy) void(^block)(void);

- (id)initWithDataArray:(NSArray *)arr withFrame:(CGRect)rect;

@property (nonatomic,strong) NSArray *imageArr;

@end
