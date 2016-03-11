//
//  NetWorkingManager.m
//  LoveProject
//
//  Created by WindFlyCloud on 16/3/4.
//  Copyright © 2016年 caoxu. All rights reserved.
//

#import "NetWorkingManager.h"

@implementation NetWorkingManager
//数组
+(void)netWorkingWaterfall:(NSString *)url completion:(CompletionBlock)cBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 设置回复内容信息
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         // NSLog(@"%@",responseObject);
         if (cBlock)
         {
             cBlock(responseObject);
         }
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         NSLog(@"%@",error);
     }];
}
//专题数据
+(void)netWorkingRequest:(NSString *)url completion:(CompletionBlock)cBlock
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 设置回复内容信息
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
       // NSLog(@"%@",responseObject);
        if (cBlock)
        {
            cBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        NSLog(@"%@",error);
    }];
}
//字典
+(void)requestDetailTarget:(NSString *)url completion:(Block)block
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 设置回复内容信息
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         // NSLog(@"%@",responseObject);
         if (block)
         {
             block(responseObject);
         }
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         NSLog(@"%@",error);
     }];

}
@end
//616728711石长建
