//
//  FindButton.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/8.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "FindButton.h"
#import "Masonry.h"
@implementation FindButton
//懒加载重写getter方法
-(UIImageView *)bgImage
{
    /* [loveLabe mas_makeConstraints:^(MASConstraintMaker *make)
     {
     make.left.equalTo(loveView.mas_right).with.offset(8.0f);
     
     make.bottom.equalTo(bgView.mas_bottom).with.offset(0.0f);
     
     make.height.equalTo(@26);
     make.width.equalTo(@30);
     }];
*/
    if (!_bgImage)
    {
        _bgImage = [[UIImageView alloc]init];
        
         [self addSubview:_bgImage];
        
        [_bgImage mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.left.equalTo(self.mas_left).with.offset(3.0f);
            make.right.equalTo(self.mas_right).with.offset(-3.0f);
            make.top.equalTo(self.mas_top).with.offset(3.0f);
            make.bottom.equalTo(self.mas_bottom).with.offset(-26.0f);
        }];
       
    }
    return _bgImage;
}

-(UILabel *)titleLB
{
    if (!_titleLB)
    {
        _titleLB = [[UILabel alloc]init];
        
        _titleLB.font = [UIFont systemFontOfSize:14];
        
        _titleLB.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_titleLB];
        
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(0.0f);
            make.right.equalTo(self.mas_right).with.offset(0.0f);
            make.height.equalTo(@20);
            
            make.bottom.equalTo(self.mas_bottom).with.offset(-2.0f);
        }];
        
    }
    return _titleLB;
}
@end
