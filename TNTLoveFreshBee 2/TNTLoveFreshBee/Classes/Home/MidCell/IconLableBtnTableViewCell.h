//
//  IconLableBtnTableViewCell.h
//  CeShi_02
//
//  Created by 赵世得 on 2016/10/13.
//  Copyright © 2016年 Zh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseHomeModel;
@interface IconLableBtnTableViewCell : UITableViewCell

@property (nonatomic, strong) NSArray *model;
@property (nonatomic, copy) void(^click)(NSInteger tag);

@end
