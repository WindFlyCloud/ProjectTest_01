//
//  SpecialImageView.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/6.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "SpecialImageView.h"

#import "UIImageView+WebCache.h"
#import "Masonry.h"
#define SPACE 10
#define WIDTH [UIScreen mainScreen].bounds.size.width/2

#define BOTTOM 40.0f

@implementation SpecialImageView
- (id)initWithImageInfo:(SpecialImageInfo *)info y:(float)y
{
    
    float height = info.height;
    
    float width = info.width;
    
    float widther = WIDTH-SPACE;
    
    //  创建等比例的宽高
    float heighter = widther*height/width;
    
    //    开始填充图片，位置、URL,高度在不断地变换就是传过来的位置
    self = [super initWithFrame:CGRectMake(0, y, WIDTH, heighter+SPACE+BOTTOM)];
    
    if (self)
    {
        //获取选中的图片
        self.imageInfo = info;
        //添加View
        UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(SPACE/2, SPACE/2, widther, heighter+BOTTOM)];
        
        [self addSubview:bgView];
        
        //添加图片
        NSURL *url = [NSURL URLWithString:info.picURL];
        UIImageView *imageView = [[UIImageView alloc]init];
        [imageView sd_setImageWithURL:url];
        [bgView addSubview:imageView];
        
        //给imageView添加约束
        [imageView mas_makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(bgView.mas_left).with.offset(0.0f);
             make.right.equalTo(bgView.mas_right).with.offset(0.0f);
             make.top.equalTo(bgView.mas_top).with.offset(0.0f);
             make.bottom.equalTo(bgView.mas_bottom).with.offset(-BOTTOM);
         }];
        
        
        //  imageView.backgroundColor = [UIColor grayColor];
        
   

        //添加zan
        UIImageView * loveView = [[UIImageView alloc]init];
        
        loveView.image = [UIImage imageNamed:@"zan"];
        
        [bgView addSubview:loveView];
        
        [loveView mas_makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(bgView.mas_left).with.offset(20.0f);
             make.bottom.equalTo(bgView.mas_bottom).with.offset(5.0f);
             
             make.height.equalTo(@22);
             make.width.equalTo(@22);
         }];
        
        //添加标题Label
        UILabel * titleLB = [[UILabel alloc]init];
        titleLB.font = [UIFont systemFontOfSize:13];
        titleLB.numberOfLines = 0;
        
        titleLB.text = info.itemTitle;
        [bgView addSubview:titleLB];
        
        [titleLB mas_makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(bgView.mas_left).with.offset(0.0f);
             make.right.equalTo(bgView.mas_right).with.offset(0.0f);
             make.top.equalTo(imageView.mas_bottom).with.offset(0.0f);
             make.bottom.equalTo(loveView.mas_top).with.offset(0.0f);
         }];
        //添加Label
        
        UILabel *loveLabe = [[UILabel alloc]init];
        loveLabe.text = _imageInfo.favoryCount;
        loveLabe.font = [UIFont systemFontOfSize:15];
        
        [bgView addSubview:loveLabe];
        
        [loveLabe mas_makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(loveView.mas_left).with.offset(20.0f);
             
             make.bottom.equalTo(bgView.mas_bottom).with.offset(5.0f);
             
             make.height.equalTo(@22);
             make.width.equalTo(@30);
         }];
        
        
        //添加购买数量
        UILabel * numLabel = [[UILabel alloc]init];
        numLabel.text = _imageInfo.badCount;
        
        [bgView addSubview:numLabel];
        
        [numLabel mas_makeConstraints:^(MASConstraintMaker *make)
         {
             
             make.right.equalTo(bgView.mas_right).with.offset(-20.0f);
             make.bottom.equalTo(bgView.mas_bottom).with.offset(5.0f);
             
             make.height.equalTo(@22);
             make.width.equalTo(@30);
         }];
        
        //添加购买图片
        UIImageView * buyImage = [[UIImageView alloc]init];
        
        buyImage.image = [UIImage imageNamed:@"cai"];
        
        [bgView addSubview:buyImage];
        
        [buyImage mas_makeConstraints:^(MASConstraintMaker *make)
         {
             make.right.equalTo(numLabel.mas_right).with.offset(-30.0f);
             make.bottom.equalTo(bgView.mas_bottom).with.offset(5.0f);
             make.height.equalTo(@22);
             make.width.equalTo(@22);
         }];
        
        
    }
    
    
    return self;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([_delegate respondsToSelector:@selector(specialImageClick)])
        
    {
        [_delegate specialImageClick];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
