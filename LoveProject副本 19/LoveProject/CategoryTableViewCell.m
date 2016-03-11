//
//  CategoryTableViewCell.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/7.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "CategoryTableViewCell.h"

@implementation CategoryTableViewCell

-(FindButton *)chooseBtnA
{
    if (!_chooseBtnA)
    {
        _chooseBtnA = [FindButton buttonWithType:UIButtonTypeCustom];
        
        _chooseBtnA.tag  = 0;
        
       // _chooseBtnA.autoresizingMask = UIViewAutoresizingFlexibleWidth
        //| UIViewAutoresizingFlexibleHeight;
        
       // _chooseBtnA.contentMode = UIViewContentModeScaleAspectFit;
        
//         _chooseBtnA.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame)/2, 85);
        
      //  _chooseBtnA.backgroundColor = [UIColor yellowColor];
        
        [self.contentView addSubview:_chooseBtnA];
    }
    return _chooseBtnA;
}

-(FindButton *)chooseBtnB
{
    if (!_chooseBtnB)
    {
        _chooseBtnB = [FindButton buttonWithType:UIButtonTypeCustom];
        
        _chooseBtnB.tag = 1;
        
//        _chooseBtnB.autoresizingMask = UIViewAutoresizingFlexibleWidth
//        | UIViewAutoresizingFlexibleHeight;
//        
       // _chooseBtnB.contentMode = UIViewContentModeScaleAspectFit;
        
       // _chooseBtnB.backgroundColor = [UIColor redColor];
        
        [self.contentView addSubview:_chooseBtnB];
    }
    return _chooseBtnB;
}

-(FindButton *)chooseBtnC
{
    if (!_chooseBtnC)
    {
        _chooseBtnC = [FindButton buttonWithType:UIButtonTypeCustom];
        
        _chooseBtnC.tag = 2;
        
//        _chooseBtnC.autoresizingMask = UIViewAutoresizingFlexibleWidth
//        | UIViewAutoresizingFlexibleHeight;
        
       // _chooseBtnC.contentMode = UIViewContentModeScaleAspectFit;
        
        //_chooseBtnC.backgroundColor = [UIColor orangeColor];
        
        [self.contentView addSubview:_chooseBtnC];
    }
    return _chooseBtnC;
}
-(FindButton *)chooseBtnD
{
    if (!_chooseBtnD)
    {
        _chooseBtnD = [FindButton buttonWithType:UIButtonTypeCustom];
        
        _chooseBtnD.tag = 3;
        
//        _chooseBtnD.autoresizingMask = UIViewAutoresizingFlexibleWidth
//        | UIViewAutoresizingFlexibleHeight;
        
       // _chooseBtnD.contentMode = UIViewContentModeScaleAspectFit;
        
        _chooseBtnD.backgroundColor = [UIColor blueColor];
        
        [self.contentView addSubview:_chooseBtnD];
    }
    return _chooseBtnD;
}
//重写getter方法
- (UIImageView *) bigImage
{
    if (!_bigImage)
    {
        _bigImage = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
        
        _bigImage.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        _bigImage.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.contentView addSubview:_bigImage];
    }
    return _bigImage;
}



@end
