//
//  TradeDetailModel.h
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/5.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TradeInfo:NSObject

@property (nonatomic,copy) NSString * title;

@property (nonatomic,copy) NSString * picURL;

@property (nonatomic,copy) NSString * price;

@end


@interface TradeDetailModel : NSObject

//重写初始化方法
-(id)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic,copy) NSString     * itenPic;

@property (nonatomic,retain) NSArray    * data;

@end
