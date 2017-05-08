//
//  LFBVipCenterViewCell.m
//  LFBVipCenter
//
//  Created by YVEN on 16/10/13.
//  Copyright © 2016年 YVEN. All rights reserved.
//

#import "LFBVipCenterViewCell.h"
#import "Masonry.h"
#import "LFBVipCenterModel.h"

@interface LFBVipCenterViewCell ()

@property (nonatomic, weak) UIImageView *iconView;

@property (nonatomic, weak) UILabel *nameLabel;

@property (nonatomic, weak) UILabel *contentLabel;

@end

@implementation LFBVipCenterViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 添加子控件
        [self setupUI];
        
    }
    return self;
}

#pragma mark - 搭建界面
- (void)setupUI {
    
    //Frame:CGRectMake(0, 0, 50, 50)
    UIImageView *growValueImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vip_001"]];
    [self.contentView addSubview:growValueImg];
    
    [growValueImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(0);
        make.left.offset(20);
        
        make.height.width.offset(60);
        
    }];
    
    UILabel *growValuelab = [[UILabel alloc] init];
    growValuelab.text = @"成长值";
    growValuelab.font = [UIFont systemFontOfSize:13];
    
    [self.contentView addSubview:growValuelab];
    
    [growValuelab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(10);
        make.left.equalTo(growValueImg.mas_right).offset(10);
        
    }];
    
    UILabel *growValueWord = [[UILabel alloc] init];
    growValueWord.text = @"会员等级有效期为1年,1年后扣减相应等级成长值,剩余成长值重新计算会员级别.";
    growValueWord.font = [UIFont systemFontOfSize:11];
    growValueWord.textColor = [UIColor grayColor];
    growValueWord.numberOfLines = 0;
    
    [self.contentView addSubview:growValueWord];
    
    [growValueWord mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(growValuelab.mas_bottom).offset(8);
        make.left.equalTo(growValuelab.mas_left);
        make.right.offset(-20);
        
    }];
    
    // cell 高
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(growValueWord.mas_bottom).offset(10);
        make.width.equalTo(self.mas_width);
        
    }];
    
    self.iconView = growValueImg;
    self.nameLabel = growValuelab;
    self.contentLabel = growValueWord;
}

- (void)setContent:(LFBVipCenterModel *)content {
    
    _content = content;
    
    self.iconView.image = [UIImage imageNamed:content.icon];
    
    self.nameLabel.text = content.name;
    
    self.contentLabel.text = content.content;
    
}

@end
