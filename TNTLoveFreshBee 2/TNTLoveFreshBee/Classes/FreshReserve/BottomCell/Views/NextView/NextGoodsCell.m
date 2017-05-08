//
//  NextGoodsCell.m
//  TNTLoveFreshBee
//
//  Created by 王朝阳 on 2016/10/13.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "NextGoodsCell.h"
#import "CZAdditions.h"

@implementation NextGoodsCell

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
#pragma mark - 监听点击
- (void)goToDetailBtn {
//    NSLog(@"跳转到详情页面");
}

#pragma mark - 创建界面
- (void)setupUI {
    
    //统一间距
    CGFloat margin = 15;
    //商品图片
    UIImageView *goodsImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"20161014105101_600355.jpg@355w_355h_90Q"]];
    [self.contentView addSubview:goodsImage];
    
    [goodsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(margin);
        make.width.mas_offset(150);
        make.bottom.offset( -margin);
    }];
    //开启用户交互
    goodsImage.userInteractionEnabled = YES;
    //添加点按手势
    UITapGestureRecognizer *goodTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToDetailBtn)];
    [goodsImage addGestureRecognizer:goodTap];
    
    //商品信息
    UILabel *descLabel = [UILabel cz_labelWithText:@"[次日达]凯旋1664白啤酒4瓶装" fontSize:13 color:[UIColor lightGrayColor]];
    descLabel.numberOfLines = 2;
    [self.contentView addSubview:descLabel];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(goodsImage);
        make.right.offset(-margin);
        make.width.mas_offset(150);
    }];
    //现价
    UILabel *discountLab = [UILabel cz_labelWithText:@"¥49.8" fontSize:17 color:[UIColor redColor]];
    discountLab.font = [UIFont boldSystemFontOfSize:16];
    [self.contentView addSubview:discountLab];
    [discountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(descLabel);
        make.bottom.offset(-margin);
    }];
    //原价
    UILabel *moneyLab = [UILabel cz_labelWithText:@"¥56" fontSize:11 color:[UIColor lightGrayColor]];
    [self.contentView addSubview:moneyLab];
    [moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(discountLab.mas_right).offset(0);
        make.centerY.mas_equalTo(discountLab.mas_centerY);
    }];
    //购物车按钮
    UIButton *shopBtn = [[UIButton alloc] init];
    [shopBtn setBackgroundImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
    [self.contentView addSubview:shopBtn];
    [shopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-margin);
        make.centerY.mas_equalTo(moneyLab.mas_centerY);
    }];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
