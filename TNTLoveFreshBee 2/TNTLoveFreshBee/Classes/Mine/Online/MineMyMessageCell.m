//
//  MineMyMessageCell.m
//  SubOthersDetail
//
//  Created by 张木锋 on 2016/10/16.
//  Copyright © 2016年 ZMF. All rights reserved.
//

#import "MineMyMessageCell.h"
#import "Masonry.h"
@implementation MineMyMessageCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupCellUI];
        
    }
    return self;
}

- (void)setupCellUI {
    
    UIImageView *nullImageView = [[UIImageView alloc] init];
//    nullImageView.backgroundColor = [UIColor redColor];
    nullImageView.image = [UIImage imageNamed:@"v2_connnect_error"];
    
    
    [self addSubview:nullImageView];
    
    [nullImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(-100);
        make.centerX.offset(0);
        make.width.height.mas_equalTo(100);
    }];
    
    UILabel *nullLabel = [[UILabel alloc] init];
    nullLabel.text = @"暂无消息";
    nullLabel.font = [UIFont systemFontOfSize:14];
    nullLabel.textColor = [UIColor grayColor];
    [self addSubview:nullLabel];
    [nullLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.centerY.offset(0);
    }];
}

@end
