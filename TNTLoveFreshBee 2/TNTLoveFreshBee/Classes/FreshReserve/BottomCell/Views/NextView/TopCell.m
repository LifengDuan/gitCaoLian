//
//  TopCell.m
//  TNTLoveFreshBee
//
//  Created by 王朝阳 on 2016/10/13.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "TopCell.h"

@implementation TopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
#pragma mark - 搭建界面
- (void)setupUI {
    
    UIImageView *topImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"theme_header_1452169592_20530_0.jpg@90Q"]];
    [self.contentView addSubview:topImage];
    [topImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.bottom.mas_offset(-8);
    }];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
