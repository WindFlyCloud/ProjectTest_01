//
//  CateFourTableViewCell.h
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/9.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FindButton.h"
@interface CateFourTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutletCollection(FindButton) NSArray *findBtn;
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;

@end
