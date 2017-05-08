//
//  AJProgressHUDManager.h
//  loveFreshPeak
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 吕文苑. All rights reserved.
//

#import <SVProgressHUD/SVProgressHUD.h>

@interface ProgressHUDManager : SVProgressHUD

- (void)setBackgroundColor:(UIColor *)color;
- (void)showImage:(UIImage *)image string:(NSString *)string;
@end
