//
//  NetWorkingManager.h
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/4.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

//custom NSLog
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__,  ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

//定义一个请求成功的block
typedef void(^CompletionBlock)(NSMutableArray *mArr);
typedef void (^Block)(NSDictionary *dictionary);
@interface NetWorkingManager : NSObject
//加载瀑布流
+(void)netWorkingWaterfall:(NSString *)url completion:(CompletionBlock)cBlock;
//专题数据
+(void)netWorkingRequest:(NSString *)url completion:(CompletionBlock)cBlock;
//请求详情数据
+(void)requestDetailTarget:(NSString *)url completion:(Block)block;
@end
