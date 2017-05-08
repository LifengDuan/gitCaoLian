//
//  FrashCell.m
//  新鲜预订测试版
//
//  Created by 王朝阳 on 2016/10/11.
//  Copyright © 2016年 wangzhaoyang. All rights reserved.
//

#import "FrashCell.h"
#import "CZAdditions.h"
#import "LFBFrashLayout.h"
#import "LFBFrashCollectionViewCell.h"
#import "GoodsModel.h"
#import "BaseHomeModel.h"
#import "DetailHomeModel.h"
#import "ActivModel.h"
//#import "FrashDetailTableViewController.h"

static NSString *ID = @"FrashCellID";
@interface FrashCell ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, weak) UICollectionView *collectionView;

//名称
@property (nonatomic, weak) UILabel *nameLabel;
//商品图片
@property (nonatomic, weak) UIImageView *goodsImage;

@property (nonatomic, strong) NSArray *goodList;
@end
@implementation FrashCell

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
#pragma mark - 监听点击事件
- (void)goToNextDidClick:(UIButton *)sender{
    
    //    判断并执行代理方法
    if ([_delegate respondsToSelector:@selector(goToNextBtn:andWithbut:)]) {
        [_delegate goToNextBtn:self andWithbut:sender];
    }
    //    NSLog(@"%ld",sender.tag);
    //    FrashDetailTableViewController *fdc = [[FrashDetailTableViewController alloc]init];
    //    fdc.btn = sender;
}

#pragma mark - 创建控件
- (void)setupUI{
    
    //0.统一间距
    CGFloat margin = 10;
    //1.顶部视图
    UIImageView *topImage = [[UIImageView alloc] init];
    [self.contentView addSubview:topImage];
    topImage.image = [UIImage imageNamed:@"v2_coupon_pink"];
    
    [topImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(-5);
        make.left.right.offset(0);
    }];
    UIView *leftView = [[UIView alloc] init];
    leftView.backgroundColor = [UIColor cz_colorWithHex:0xf38631];
    [self.contentView addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(5);
        make.height.mas_offset(16);
        make.width.mas_equalTo(6);
        make.top.equalTo(topImage.mas_bottom).offset(margin);
    }];
    
    //2.分类名称
    
    UILabel *nameLabel = [UILabel cz_labelWithText:@"精选水果" fontSize:14 color:[UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0]];
    [self.contentView addSubview:nameLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(topImage.mas_bottom).offset(margin);
        make.left.equalTo(leftView.mas_right).offset(6);
    }];

    //3.更多按钮
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [moreBtn setTitle:@"更多 >" forState:UIControlStateNormal];
    moreBtn.tintColor = [UIColor lightGrayColor];
    moreBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    
    
    [self.contentView addSubview:moreBtn];
    
    [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-margin);
        make.centerY.equalTo(nameLabel);
    }];
    //MARK: -添加监听事件
    [moreBtn addTarget:self action:@selector(goToNextDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //4.添加图片
    UIImageView *goodsImage = [[UIImageView alloc] init];
    //    goodsImage.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:goodsImage];
    goodsImage.userInteractionEnabled = NO;
    goodsImage.image = [UIImage imageNamed:@"2016081016474388.jpg@90Q"];
    
    [goodsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(nameLabel.mas_bottom).offset(margin);
        make.left.right.offset(0);
        make.height.offset(100);
    }];
    
    
    //5.创建底部的 collectionView
    
    LFBFrashLayout *flowLayout = [[LFBFrashLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    //    [collectionView setCollectionViewLayout:flowLayout];
    
    [self.contentView addSubview:collectionView];
    
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(goodsImage.mas_bottom).offset(0);
        make.left.right.bottom.offset(0);
    }];
    
    
    collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView = collectionView;
    //设置代理和数据源
    collectionView.delegate = self;
    collectionView.dataSource = self;
    //    collectionView.bounces = NO;
    collectionView.scrollEnabled = NO;
    collectionView.userInteractionEnabled = YES;
    
    //MARK: 注册  collectionViewCell
    [collectionView registerClass:[LFBFrashCollectionViewCell class] forCellWithReuseIdentifier:ID];
    // MARK: 赋值
    self.nameLabel = nameLabel;
    self.goodsImage = goodsImage;
    
}
#pragma mark - collectionView 的数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.goodList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //创建 cell
    LFBFrashCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    //    cell.backgroundColor = [UIColor redColor];
    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.layer.borderWidth = 0.1;
    //赋值
    cell.model = self.goodList[indexPath.item];
    
    
    //返回
    return cell;
}
#pragma mark - set方法
-(void)setModel:(GoodsModel *)model
{
    _model = model;
    
    BaseHomeModel *bas = model.more_activity;
    ActivModel *actv = model.category_detail;
    self.goodList = actv.goods;
    
    self.nameLabel.text = actv.name;
    [self.goodsImage sd_setImageWithURL:[NSURL URLWithString:bas.img]];
    
    [self.collectionView reloadData];

    
}

@end
