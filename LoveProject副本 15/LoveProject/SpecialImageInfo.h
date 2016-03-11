//
//  SpecialImageInfo.h
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/6.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpecialImageInfo : NSObject
- (id)initWithDictionary:(NSDictionary *)dictionary;
@property (nonatomic,copy) NSString *favoryCount;

@property (nonatomic,copy) NSString *badCount;

@property (nonatomic,copy) NSString *itemTitle;

@property (nonatomic,copy) NSString *picURL;

@property (nonatomic,assign) float height;

@property (nonatomic,assign) float width;

@end
