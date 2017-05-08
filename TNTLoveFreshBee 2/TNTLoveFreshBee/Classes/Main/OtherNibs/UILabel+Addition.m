//
//  UILabel+Addition.m
//  01-生活圈
//
//  Created by chao on 16/8/12.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "UILabel+Addition.h"

@implementation UILabel (Addition)
+ (instancetype)makeLabelWithText:(NSString *)text andTextFont:(UIFont *)font andTextColor:(UIColor *)color {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = color;
    label.font = font;
    return label;
}
@end
