//
//  LFBMineModel.m
//  TNTLoveFreshBee
//
//  Created by Book on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "LFBMineModel.h"

@implementation LFBMineModel

+ (instancetype)titleIconWith:(NSString *)title icon:(UIImage *)image controller:(UIViewController *)controlller tag:(NSInteger )tag{
    LFBMineModel *titleIconAction = [[LFBMineModel alloc]init];
    titleIconAction.title = title;
    titleIconAction.icon = image;
    titleIconAction.controller = controlller;
    titleIconAction.tag = tag;
//    titleIconAction.labtext = 
    return titleIconAction;
}
+(instancetype)titleIconWith:(NSString *)title text:(NSString *)lab controller:(UIViewController *)controlller tag:(NSInteger )tag{

    LFBMineModel *titleIconAction = [[LFBMineModel alloc]init];
    titleIconAction.title = title;
    titleIconAction.labtext = lab;
    titleIconAction.controller = controlller;
    titleIconAction.tag = tag;
//        titleIconAction.labtext =
    return titleIconAction;

}
@end
