//
//  UILabel+Addition.m
//  支付宝口碑自己03
//
//  Created by Steve on 16/8/13.
//  Copyright © 2016年 Steve. All rights reserved.
//

#import "UILabel+Addition.h"

@implementation UILabel (Addition)
/**
 返回一个label
 
 @param text     显示的文字
 @param color    文字颜色
 @param fontSize 文字字体
 */
+ (instancetype)makeLabelText:(NSString *)text andTextColor:(UIColor *)color andTextFont:(CGFloat)fontSize {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:fontSize];
    return label;
}
@end
