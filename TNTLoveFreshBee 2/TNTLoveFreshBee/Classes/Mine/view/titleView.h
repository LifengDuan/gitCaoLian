//
//  titleView.h
//  TNTLoveFreshBee
//
//  Created by Book on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface titleView : UIView
- (instancetype)initWithTitleLabel:(NSString *)titleLabel icon:(UIImage *)icon boder:(BOOL)boder;
- (instancetype)initWithTitleLabel:(NSString *)titleLabel text:(NSString *)lab boder:(BOOL)boder;
@end
