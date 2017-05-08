//
//  LFBMineModel.h
//  TNTLoveFreshBee
//
//  Created by Book on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFBMineModel : NSObject

//标示文字
@property (nonatomic, copy) NSString *title;
//图片名
@property (nonatomic, strong) UIImage *icon;
//调用控制器
@property (nonatomic, strong) UIViewController *controller;
//标记
@property (nonatomic, assign) NSInteger tag;
//底部文字
@property (nonatomic, assign) NSString *labtext;
+ (instancetype)titleIconWith:(NSString *)title icon:(UIImage *)image controller:(UIViewController *)controlller tag:(NSInteger )tag;
+ (instancetype)titleIconWith:(NSString *)title text:(NSString *)lab controller:(UIViewController *)controlller tag:(NSInteger )tag;
@end
