//
//  ScrollImgCollectionViewCell.m
//  CeShi_02
//
//  Created by 赵世得 on 2016/10/13.
//  Copyright © 2016年 Zh. All rights reserved.
//

#import "ScrollImgCollectionViewCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>

@interface ScrollImgCollectionViewCell ()
@property (nonatomic, weak) UIImageView *imageV;

@end
@implementation ScrollImgCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    UIImageView *imgV = [[UIImageView alloc] init];
    [imgV sizeToFit];
    imgV.image = [UIImage imageNamed:@"suannai"];
    [self.contentView addSubview:imgV];
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.contentView);
    }];
    imgV.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction:)];
    [imgV addGestureRecognizer:tap];
        self.imageV = imgV;
}
- (void)setImgAddress:(NSString *)imgAddress{
    _imgAddress = imgAddress;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:imgAddress] placeholderImage:[UIImage imageNamed:@"11111"]];
}

- (void)clickAction: (UITapGestureRecognizer *)sender
{
    NSNotificationCenter *note = [NSNotificationCenter defaultCenter];
    [note postNotificationName:@"clickeCollection" object:self userInfo:nil];
}

@end
