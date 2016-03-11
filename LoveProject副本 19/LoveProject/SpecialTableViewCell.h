//
//  SpecialTableViewCell.h
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/4.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
@interface SpecialTableViewCell : UITableViewCell
@property(nonatomic,retain)IBOutlet UILabel * title;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageArray;

@end
