//
//  NetworkTool.m
//  xiangmu01
//
//  Created by Steve on 2016/10/11.
//  Copyright © 2016年 Steve. All rights reserved.
//

#import "NetworkTool.h"

@implementation NetworkTool

+(instancetype)sharedNetworkTool {
    
    static NetworkTool *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 设置AFN的BaseURL
        
        instance = [[self alloc] initWithBaseURL:nil];
        
        instance.responseSerializer = [AFXMLParserResponseSerializer serializer];
        
        // 增加AFN支持的文件类型
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
    });
    
    return instance;
    
}

/// 提示 : 正真发送网络请求的是AFN (AFHTTPSessionManager)
- (void)GETWithURLString:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failed:(void (^)(NSError *))failed
{
    // AFHTTPSessionManager发送GET请求
    [self GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 如果AFHTTPSessionManager,请求成功之后,把responseObject交给NetworkTool的success回调出去
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failed) {
            failed(error);
        }
    }];
}

/// 提示 : 正真发送网络请求的是AFN (AFHTTPSessionManager)
- (void)POSTWithURLString:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failed:(void (^)(NSError *))failed
{
    // AFHTTPSessionManager发送GET请求
    [self POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",task.response.URL.absoluteString);
        
        // 如果AFHTTPSessionManager,请求成功之后,把responseObject交给NetworkTool的success回调出去
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failed) {
            failed(error);
        }
    }];
}

@end


