//
//  gaiyangshi.h
//  TNTLoveFreshBee
//
//  Created by Book on 16/10/14.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface gaiyangshi : UITableViewCell
//左边的文字
@property(nonatomic,weak)UILabel *leftText;
//右边的图片
@property(nonatomic,weak)UIImageView *image;
//中间的文字
@property(nonatomic,weak)UILabel *centerText;
//复制文字
@property(nonatomic,copy)NSString *lb;
//复制名字
@property(nonatomic,copy)NSString *name;
//中间的
@property(nonatomic,copy)NSString *centerlb;
@end
