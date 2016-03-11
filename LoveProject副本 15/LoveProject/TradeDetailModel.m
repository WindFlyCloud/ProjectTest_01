//
//  TradeDetailModel.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/5.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "TradeDetailModel.h"

@implementation TradeInfo



@end

@implementation TradeDetailModel
-(id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        self.itenPic = [dictionary objectForKey:@"item_pic"];
        
        self.data = [dictionary objectForKey:@"data"];

    }
    return self;
}
@end
