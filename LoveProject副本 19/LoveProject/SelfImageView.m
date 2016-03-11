//
//  SelfImageView.m
//  WindFlyCloud
//
//  Created by Apple on 16/03/05.
//  Copyright © 2015年 caoxu. All rights reserved.
//

#import "SelfImageView.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
#define SPACE 10
#define WIDTH [UIScreen mainScreen].bounds.size.width/2

#define BOTTOM 26.0f
@implementation SelfImageView

- (id)initWithImageInfo:(ImageInfo *)info y:(float)y
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
        self.data = info;
        //添加View
        UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(SPACE/2, SPACE/2, widther, heighter+BOTTOM)];
        
        [self addSubview:bgView];
        
        //添加图片
        NSURL *url = [NSURL URLWithString:info.thumbURL];
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
        
        
        //添加love
        UIImageView * loveView = [[UIImageView alloc]init];
        
        loveView.image = [UIImage imageNamed:@"dapei_like"];
        
         [bgView addSubview:loveView];
        
        [loveView mas_makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(bgView.mas_left).with.offset(20.0f);
             make.bottom.equalTo(bgView.mas_bottom).with.offset(0.0f);
             
             make.height.equalTo(@26);
             make.width.equalTo(@26);
         }];
       
        //添加Label
        
        UILabel *loveLabe = [[UILabel alloc]init];
        loveLabe.text = _data.loveNmuber;
        loveLabe.font = [UIFont systemFontOfSize:15];
        
         [bgView addSubview:loveLabe];
        
        [loveLabe mas_makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(loveView.mas_right).with.offset(8.0f);
            
             make.bottom.equalTo(bgView.mas_bottom).with.offset(0.0f);
             
             make.height.equalTo(@26);
             make.width.equalTo(@30);
         }];

       
        //添加购买数量
        UILabel * numLabel = [[UILabel alloc]init];
        numLabel.text = _data.countNum;
        
        [bgView addSubview:numLabel];
        
        [numLabel mas_makeConstraints:^(MASConstraintMaker *make)
         {
             
             make.right.equalTo(bgView.mas_right).with.offset(-20.0f);
             make.bottom.equalTo(bgView.mas_bottom).with.offset(0.0f);
             
             make.height.equalTo(@26);
             make.width.equalTo(@30);
         }];

        //添加购买图片
        UIImageView * buyImage = [[UIImageView alloc]init];
        
        buyImage.image = [UIImage imageNamed:@"dapei_number"];
        
        [bgView addSubview:buyImage];
        
        [buyImage mas_makeConstraints:^(MASConstraintMaker *make)
         {
             make.right.equalTo(numLabel.mas_right).with.offset(-30.0f);
             make.bottom.equalTo(bgView.mas_bottom).with.offset(0.0f);
             make.height.equalTo(@26);
             make.width.equalTo(@22);
         }];
        
        
    }
    
    
    return self;
}
//代理委托
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([_delegate respondsToSelector:@selector(imageClick:)])
    {
        [self.delegate imageClick:self.data];
    }
    

}



@end
