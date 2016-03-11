
//
//  SelfImageView.h
//  WindFlyCloud
//
//  Created by Apple on 16/03/05.
//  Copyright © 2015年 caoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageInfo.h"

@protocol ImageDelegate <NSObject>

- (void)imageClick:(ImageInfo *)data;

@end


@interface SelfImageView : UIView
//下面为图片添加代理事件

@property (nonatomic,weak) id<ImageDelegate> delegate;
- (id)initWithImageInfo:(ImageInfo *)info y:(float)y;
@property (nonatomic,strong)ImageInfo *data;

@end
