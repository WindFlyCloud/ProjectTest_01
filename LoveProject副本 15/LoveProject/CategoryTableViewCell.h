//
//  CategoryTableViewCell.h
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/7.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FindButton.h"

@interface CategoryTableViewCell : UITableViewCell

@property (nonatomic,strong) FindButton * chooseBtnA;

@property (nonatomic,strong) FindButton * chooseBtnB;

@property (nonatomic,strong) FindButton * chooseBtnC;

@property (nonatomic,strong) FindButton * chooseBtnD;

@property (nonatomic,retain) UIImageView * bigImage;

@end
