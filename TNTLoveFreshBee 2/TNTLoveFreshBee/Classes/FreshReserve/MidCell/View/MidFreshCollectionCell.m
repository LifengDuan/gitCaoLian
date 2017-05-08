//
//  MidFreshCollectionCell.m
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "MidFreshCollectionCell.h"
#import "FreshConllectionView.h"
#import "FreshFlowLayout.h"
#import "Masonry.h"
#import "FreshModel.h"
#import "ActivModel.h"
#import "BaseHomeModel.h"
#import "DetailHomeModel.h"

@interface MidFreshCollectionCell ()

@property (nonatomic, strong) FreshModel *listModel;
@property (nonatomic, weak) UIImageView *topView;
@property (nonatomic, weak) FreshConllectionView *conllectionV;

@end

@implementation MidFreshCollectionCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
//        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)setupUI
{
    
    UIImageView *topView = [[UIImageView alloc] init];
//    topView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(30);
    }];

    FreshConllectionView *conllectionV = [[FreshConllectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[FreshFlowLayout alloc]init]];
    
    [self.contentView addSubview:conllectionV];
    [conllectionV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.top.equalTo(topView.mas_bottom).offset(0);
    }];
    self.topView = topView;
    self.conllectionV = conllectionV;
    
}

- (void)setModel:(FreshModel *)model
{
    _model = model;
    self.listModel = model;
    NSRange range = [model.banner_img rangeOfString:@"@"];
    NSString *imgStr = [model.banner_img substringToIndex:range.location];
    [self.topView sd_setImageWithURL:[NSURL URLWithString:imgStr]];
    ActivModel *act = model.activ_detail;
//    BaseHomeModel *base = model.more_activity;
    self.conllectionV.modelList = act.goods;
//    DetailHomeModel *det = act.goods[0];
    
    
}

@end
