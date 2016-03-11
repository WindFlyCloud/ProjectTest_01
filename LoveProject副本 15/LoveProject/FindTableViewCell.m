//
//  FindTableViewCell.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/8.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "FindTableViewCell.h"

@implementation FindTableViewCell


-(NSMutableArray *)btnArr
{
    if (!_btnArr)
    {
        _btnArr = [[NSMutableArray alloc]init];
        
        for (int i = 0; i < 4; i ++)
        {
            FindButton * button = [FindButton buttonWithType:UIButtonTypeCustom];
            
            button.frame = CGRectMake(i * CGRectGetWidth(self.contentView.frame)/4, 0, CGRectGetWidth(self.contentView.frame)/4, CGRectGetHeight(self.contentView.frame));
            
            button.tag = i + 1;
            
            [_btnArr addObject:button];
            
            [self.contentView addSubview:button];
            
        }
    }
    return _btnArr;
}
@end
