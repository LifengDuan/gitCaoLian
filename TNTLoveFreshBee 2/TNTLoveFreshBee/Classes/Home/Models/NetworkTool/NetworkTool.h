//
//  NetworkTool.h
//  xiangmu01
//
//  Created by Steve on 2016/10/11.
//  Copyright © 2016年 Steve. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NetworkTool : AFHTTPSessionManager


/**
 *  单例的全局访问点
 *
 *  @return AFHTTPSessionManager
 */
+(instancetype) sharedNetworkTool;

/**
 封装的网络请求工具类的GET方法
 
 @param URLString  请求的地址
 @param parameters 请求的参数
 @param success    成功的回调
 @param failed     失败的回调
 */
- (void)GETWithURLString:(NSString *)URLString parameters:(id)parameters success:(void(^)(id responseObject))success failed:(void(^)(NSError *error))failed;

/**
 封装的网络请求工具类的POST方法
 
 @param URLString  请求的地址
 @param parameters 请求的参数
 @param success    成功的回调
 @param failed     失败的回调
 */
- (void)POSTWithURLString:(NSString *)URLString parameters:(id)parameters success:(void(^)(id responseObject))success failed:(void(^)(NSError *error))failed;

@end


