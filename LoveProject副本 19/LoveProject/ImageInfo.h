//
//  ImageInfo.h
//  WaterFlow1
//
//  Created by Apple on 15/11/2.
//  Copyright © 2015年 mcas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageInfo : NSObject

- (id)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic,copy) NSString *contentId;

@property (nonatomic,copy) NSString *loveNmuber;

@property (nonatomic,copy) NSString *countNum;

@property (nonatomic,copy) NSString *thumbURL;

@property (nonatomic,assign) float height;

@property (nonatomic,assign) float width;

@end
