//
//  ImageInfo.m
//  WaterFlow1
//
//  Created by Apple on 15/11/2.
//  Copyright © 2015年 mcas. All rights reserved.
//

#import "ImageInfo.h"

@implementation ImageInfo
//重写初始化方法
- (id)initWithDictionary:(NSDictionary *)dictionary
{

    self = [super init];
    if (self)
    {
        self.thumbURL = [dictionary objectForKey:@"item_pic"];
        
        self.contentId = [dictionary objectForKey:@"content_id"];
        
        self.loveNmuber = [dictionary objectForKey:@"love"];
        
        self.countNum = [dictionary objectForKey:@"count_num"];
        self.width = [[dictionary objectForKey:@"weight"] floatValue];
        self.height = [[dictionary objectForKey:@"height"] floatValue];
        
    }
    return self;

}


- (NSString *)description{
    
    return [NSString stringWithFormat:@"thumbURL:%@  width:%f  height:%f",self.thumbURL,self.width,self.height];
}

@end
