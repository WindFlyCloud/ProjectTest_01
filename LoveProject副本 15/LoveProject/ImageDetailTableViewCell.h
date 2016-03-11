//
//  ImageDetailTableViewCell.h
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/5.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;

@end
