//
//  SpecialImageInfo.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/6.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "SpecialImageInfo.h"

@implementation SpecialImageInfo
//重写初始化方法
- (id)initWithDictionary:(NSDictionary *)dictionary
{
    
    self = [super init];
    if (self)
    {
        self.favoryCount = [dictionary objectForKey:@"favoryCount"];
        
        self.badCount = [dictionary objectForKey:@"badCount"];
        
        self.height = [[dictionary objectForKey:@"picHeight"] floatValue];
        
        self.width = [[dictionary objectForKey:@"picWidth"] floatValue];
        
        self.picURL = [dictionary objectForKey:@"picUrl"];
        
        self.itemTitle = [dictionary objectForKey:@"item_title"];
    }
    return self;
    
}
@end
