//
//  SpecialTableViewCell.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/4.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "SpecialTableViewCell.h"

@implementation SpecialTableViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {// //3.为 view 添加约束。
//        [view mas_makeConstraints:^(MASConstraintMaker *make)
//         {
//             //配置具体的约束信息。
//             //Masonry 中的属性和 NSLayoutAttrubute 的对应关系请参考图 ‘Masonry属性和NSLayoutAttrubute对照表.jpg’。
//             make.left.equalTo(self.view.mas_left).with.offset(10.0f);
//             make.right.equalTo(self.view.mas_right).with.offset(-10.0f);
//             make.top.equalTo(self.view.mas_top).with.offset(20.0f);
//             make.height.equalTo(@44);
//         }];
        
    }
    return self;
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
