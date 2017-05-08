//
//  AJProgressHUDManager.m
//  loveFreshPeak
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 吕文苑. All rights reserved.
//

#import "ProgressHUDManager.h"

@implementation ProgressHUDManager
- (void)setBackgroundColor:(UIColor *)color{
    [SVProgressHUD setBackgroundColor:color];
}
- (void)showImage:(UIImage *)image string:(NSString *)string{
    [SVProgressHUD showImage:image status:string];
}
@end
