//
//  MineMymessageViewController.m
//  SubOthersDetail
//
//  Created by 张木锋 on 2016/10/15.
//  Copyright © 2016年 ZMF. All rights reserved.
//

#import "MineMyMessageViewController.h"
#import "Masonry.h"
#import "MineUICollectionViewFlowLayout.h"
#import "MineMyMessageCell.h"
#import "UIColor+CZAddition.h"
#import "UIButton+CZAddition.h"
#define MYmessageCellID @"MYmessageCell"

@interface MineMyMessageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,weak) UICollectionView *collectionView;
@property(nonatomic,strong) NSArray<UIButton *> *btnArr;
@property(nonatomic,weak) UIImageView *lineImageView;
@property(nonatomic,weak) UIView *topView;
@property(nonatomic,weak) UIButton *selectedBtn;
@end

@implementation MineMyMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"我的消息";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self setupWebViewUI];
    
    [self.collectionView registerClass:[MineMyMessageCell class] forCellWithReuseIdentifier:MYmessageCellID];
}

- (void)setupWebViewUI {
    
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    self.topView = topView;
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.offset(0);
        make.top.offset(64);
        make.height.mas_equalTo(20);
    }];
    
    
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(topView.mas_bottom).offset(0);
        make.height.mas_equalTo(1);
    }];
    
    
    NSArray<NSString *> *titleArr = @[@"用户信息",@"系统信息"];
    [titleArr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [UIButton cz_textButton:obj fontSize:14 normalColor:[UIColor cz_colorWithHex:0x555555] selectedColor:[UIColor cz_colorWithHex:0x000000]];
        [topView addSubview:btn];
        
        [btn addTarget:self action:@selector(btnActionClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (idx == 0) {
            
            btn.selected = YES;
            _selectedBtn = btn;
        }
    }];

    self.btnArr = topView.subviews;
    
    [topView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [topView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(topView);
    }];
    
//    UIButton *leftBtn = [[UIButton alloc] init];
//    [leftBtn setTitle:@"用户信息" forState:UIControlStateNormal];
//    leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//    [leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
////    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
//    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
//    [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [topView addSubview:leftBtn];
//    
//    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.bottom.offset(0);
//        make.width.mas_equalTo(self.view.bounds.size.width * 0.5);
//    }];
//    
//    UIButton *rightBtn = [[UIButton alloc] init];
//    [rightBtn setTitle:@"系统信息" forState:UIControlStateNormal];
//    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//    [rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
////    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
//    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
//    [leftBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [topView addSubview:rightBtn];
//    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.right.bottom.offset(0);
//        make.width.equalTo(leftBtn);
//    }];
    
    UIImageView *lineImageView = [[UIImageView alloc] init];
    lineImageView.image = [UIImage imageNamed:@"icon_sendcoupon"];
    [topView addSubview:lineImageView];
    [lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(18);
        make.centerX.equalTo(self.btnArr[0]);
        make.width.mas_equalTo(55);
        make.height.mas_equalTo(4);
    }];
    self.lineImageView = lineImageView;
    
    
    MineUICollectionViewFlowLayout *layOut = [[MineUICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layOut];
//    collectionView.backgroundColor = [UIColor cz_colorWithHex:0x000000];
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    collectionView.dataSource = self;
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.top.equalTo(topView.mas_bottom).offset(1);
    }];
    
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MineMyMessageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MYmessageCellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:235.0 green:235.0 blue:235.0 alpha:1.0];
    return cell;
}
// 重写黄线的偏移量，让黄线偏移
- (void)setOffset_X:(CGFloat)offset_X {
    _offset_X = offset_X;
    
    [_lineImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_btnArr[0]).offset(offset_X);
    }];
    [self.topView layoutIfNeeded];
    
    NSInteger idx = offset_X / _btnArr[0].bounds.size.width + 0.5;
    
    self.selectedBtn.selected = NO;
    
    _btnArr[idx].selected = YES;
    
    self.selectedBtn = _btnArr[idx];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
//    NSLog(@"%f",scrollView.contentOffset.x);
    
    self.offset_X = self.collectionView.contentOffset.x / 2;
}


//右边按钮监听点击事件
- (void)btnActionClick:(UIButton *)btn {
//    NSLog(@"张木锋");
    
    _pageNum = [self.btnArr indexOfObject:btn];
    //第几组第几个
    NSIndexPath *path = [NSIndexPath indexPathForItem:_pageNum inSection:0];
    // 滚动到指定个的下标
    [self.collectionView scrollToItemAtIndexPath:path atScrollPosition:0 animated:YES];
//    NSLog(@"%zd",_pageNum);
}
@end














