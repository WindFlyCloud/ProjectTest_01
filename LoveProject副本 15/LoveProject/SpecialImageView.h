//
//  SpecialImageView.h
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/6.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SpecialImageInfo.h"

@protocol SpecialImageDelegate <NSObject>

- (void) specialImageClick;

@end
@interface SpecialImageView : UIView

@property (nonatomic,assign) id <SpecialImageDelegate> delegate;
- (id)initWithImageInfo:(SpecialImageInfo *)info y:(float)y;

@property (nonatomic,strong)SpecialImageInfo *imageInfo;
@end
